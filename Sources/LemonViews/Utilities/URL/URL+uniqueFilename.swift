//
//  URL+uniqueFilename.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/24.
//

import Foundation

extension URL {
    /// Generate a unique filename by appending " (n)" if the file already exists.
    /// - Returns: A URL with a unique filename that doesn't exist on disk
    ///
    /// Example:
    /// - If `song.mp3` exists, returns `song (1).mp3`
    /// - If `song (1).mp3` also exists, returns `song (2).mp3`
    /// - If `archive.tar.gz` exists, returns `archive (1).tar.gz`
    /// - And so on...
    public func uniqueFilename() -> URL {
        // If file doesn't exist, return as-is
        guard FileManager.default.fileExists(atPath: path) else {
            return self
        }

        let directory = deletingLastPathComponent()
        let filename = lastPathComponent
        let (baseName, fileExtension) = extractBaseNameAndExtension(from: filename)

        var counter = 1
        var candidateURL: URL

        repeat {
            let newBaseName = "\(baseName) (\(counter))"
            if fileExtension.isEmpty {
                candidateURL = directory.appendingPathComponent(newBaseName)
            } else {
                candidateURL = directory.appendingPathComponent(newBaseName + fileExtension)
            }
            counter += 1

            if counter > 10000 {
                let timestamp = Int(Date().timeIntervalSince1970)
                let fallbackName = "\(baseName)_\(timestamp)"
                if fileExtension.isEmpty {
                    return directory.appendingPathComponent(fallbackName)
                } else {
                    return directory.appendingPathComponent(fallbackName + fileExtension)
                }
            }
        } while FileManager.default.fileExists(atPath: candidateURL.path)

        return candidateURL
    }

    /// Extracts the base name and full extension from a filename, handling compound extensions.
    /// - Parameter filename: The filename to parse
    /// - Returns: A tuple containing the base name and the full extension (including the leading dot)
    ///
    /// Examples:
    /// - "song.mp3" → ("song", ".mp3")
    /// - "archive.tar.gz" → ("archive", ".tar.gz")
    /// - "document.backup.tar.bz2" → ("document.backup", ".tar.bz2")
    /// - "file" → ("file", "")
    private func extractBaseNameAndExtension(from filename: String) -> (baseName: String, extension: String) {
        // Common compound extensions that should be preserved as a unit
        let compoundExtensions: [String] = [
            ".tar.gz", ".tar.bz2", ".tar.xz", ".tar.Z", ".tar.lz", ".tar.lzma",
            ".tar.zst", ".tar.br",
        ]

        // Check if the filename ends with any compound extension
        for compoundExt in compoundExtensions {
            if filename.hasSuffix(compoundExt) {
                let baseName = String(filename.dropLast(compoundExt.count))
                return (baseName, compoundExt)
            }
        }

        // If no compound extension found, use standard extension handling
        if let dotIndex = filename.lastIndex(of: ".") {
            let baseName = String(filename[..<dotIndex])
            let ext = String(filename[dotIndex...])
            return (baseName, ext)
        }

        // No extension found
        return (filename, "")
    }
}
