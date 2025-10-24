//
//  URLUniqueFilenameTests.swift
//  LemonViews
//
//  Created by Lu Ai on 2025/10/24.
//

import Testing
import Foundation
@testable import LemonViews

/// Tests for the URL.uniqueFilename() extension method
struct URLUniqueFilenameTests {
    
    /// Test that uniqueFilename generates the correct unique filename when conflicts exist
    @Test("uniqueFilename generates unique filename with conflicts")
    func testUniqueFilenameWithConflicts() throws {
        // Create a temporary directory for testing
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        // Ensure cleanup happens even if test fails
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        // Create the temporary directory
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Create the conflicting files
        let testFile = tempDirectory.appendingPathComponent("test.txt")
        let testFile1 = tempDirectory.appendingPathComponent("test (1).txt")
        let testFile2 = tempDirectory.appendingPathComponent("test (2).txt")
        
        // Create the files
        try "content".write(to: testFile, atomically: true, encoding: .utf8)
        try "content".write(to: testFile1, atomically: true, encoding: .utf8)
        try "content".write(to: testFile2, atomically: true, encoding: .utf8)
        
        // Call uniqueFilename on test.txt
        let uniqueURL = testFile.uniqueFilename()
        
        // Verify the result is test (3).txt
        let expectedURL = tempDirectory.appendingPathComponent("test (3).txt")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'test (3).txt'")
        #expect(uniqueURL.lastPathComponent == "test (3).txt", "Expected last path component to be 'test (3).txt'")
    }
    
    /// Test that uniqueFilename returns the same URL when no conflict exists
    @Test("uniqueFilename returns same URL when no conflict")
    func testUniqueFilenameNoConflict() throws {
        // Create a temporary directory for testing
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        // Ensure cleanup happens even if test fails
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        // Create the temporary directory
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Create a URL for a non-existent file
        let nonExistentFile = tempDirectory.appendingPathComponent("nonexistent.txt")
        
        // Call uniqueFilename
        let uniqueURL = nonExistentFile.uniqueFilename()
        
        // Verify the result is the same as the input
        #expect(uniqueURL == nonExistentFile, "Expected unique filename to be the same when no conflict exists")
    }
    
    /// Test that uniqueFilename works with files without extensions
    @Test("uniqueFilename works with files without extensions")
    func testUniqueFilenameNoExtension() throws {
        // Create a temporary directory for testing
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        // Ensure cleanup happens even if test fails
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        // Create the temporary directory
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Create files without extensions
        let testFile = tempDirectory.appendingPathComponent("testfile")
        let testFile1 = tempDirectory.appendingPathComponent("testfile (1)")
        
        // Create the files
        try "content".write(to: testFile, atomically: true, encoding: .utf8)
        try "content".write(to: testFile1, atomically: true, encoding: .utf8)
        
        // Call uniqueFilename
        let uniqueURL = testFile.uniqueFilename()
        
        // Verify the result is testfile (2)
        let expectedURL = tempDirectory.appendingPathComponent("testfile (2)")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'testfile (2)'")
    }
    
    /// Test that uniqueFilename handles multiple extensions correctly
    @Test("uniqueFilename handles multiple extensions")
    func testUniqueFilenameMultipleExtensions() throws {
        // Create a temporary directory for testing
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")

        // Ensure cleanup happens even if test fails
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }

        // Create the temporary directory
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )

        // Create a file with multiple extensions
        let testFile = tempDirectory.appendingPathComponent("archive.tar.gz")

        // Create the file
        try "content".write(to: testFile, atomically: true, encoding: .utf8)

        // Call uniqueFilename
        let uniqueURL = testFile.uniqueFilename()

        // Verify the result is archive (1).tar.gz
        // The function should preserve the full .tar.gz extension
        let expectedURL = tempDirectory.appendingPathComponent("archive (1).tar.gz")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'archive (1).tar.gz'")
        #expect(uniqueURL.lastPathComponent == "archive (1).tar.gz", "Expected last path component to be 'archive (1).tar.gz'")
    }

    /// Test that uniqueFilename handles .tar.bz2 compound extension
    @Test("uniqueFilename handles .tar.bz2 extension")
    func testUniqueFilenameTarBz2() throws {
        // Create a temporary directory for testing
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")

        // Ensure cleanup happens even if test fails
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }

        // Create the temporary directory
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )

        // Create a file with .tar.bz2 extension
        let testFile = tempDirectory.appendingPathComponent("backup.tar.bz2")

        // Create the file
        try "content".write(to: testFile, atomically: true, encoding: .utf8)

        // Call uniqueFilename
        let uniqueURL = testFile.uniqueFilename()

        // Verify the result is backup (1).tar.bz2
        let expectedURL = tempDirectory.appendingPathComponent("backup (1).tar.bz2")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'backup (1).tar.bz2'")
    }

    /// Test that uniqueFilename handles sequential conflicts with compound extensions
    @Test("uniqueFilename handles sequential conflicts with compound extensions")
    func testUniqueFilenameSequentialCompound() throws {
        // Create a temporary directory for testing
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")

        // Ensure cleanup happens even if test fails
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }

        // Create the temporary directory
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )

        // Create files with compound extensions
        let testFile = tempDirectory.appendingPathComponent("data.tar.gz")
        let testFile1 = tempDirectory.appendingPathComponent("data (1).tar.gz")
        let testFile2 = tempDirectory.appendingPathComponent("data (2).tar.gz")

        // Create the files
        try "content".write(to: testFile, atomically: true, encoding: .utf8)
        try "content".write(to: testFile1, atomically: true, encoding: .utf8)
        try "content".write(to: testFile2, atomically: true, encoding: .utf8)

        // Call uniqueFilename on the original file
        let uniqueURL = testFile.uniqueFilename()

        // Verify the result is data (3).tar.gz
        let expectedURL = tempDirectory.appendingPathComponent("data (3).tar.gz")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'data (3).tar.gz'")
    }
    
    
    /// Test that uniqueFilename handles Unicode filenames
    @Test("uniqueFilename handles Unicode filenames")
    func testUniqueFilenameUnicode() throws {
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Create files with Unicode characters
        let testFile = tempDirectory.appendingPathComponent("文档.txt")
        let testFile1 = tempDirectory.appendingPathComponent("文档 (1).txt")
        
        try "content".write(to: testFile, atomically: true, encoding: .utf8)
        try "content".write(to: testFile1, atomically: true, encoding: .utf8)
        
        let uniqueURL = testFile.uniqueFilename()
        
        let expectedURL = tempDirectory.appendingPathComponent("文档 (2).txt")
        #expect(uniqueURL == expectedURL, "Expected unique Unicode filename to be '文档 (2).txt'")
    }
    
    /// Test that uniqueFilename handles filenames with special characters
    @Test("uniqueFilename handles special characters")
    func testUniqueFilenameSpecialCharacters() throws {
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Create a file with special characters
        let testFile = tempDirectory.appendingPathComponent("file@#$.txt")
        try "content".write(to: testFile, atomically: true, encoding: .utf8)
        
        let uniqueURL = testFile.uniqueFilename()
        
        let expectedURL = tempDirectory.appendingPathComponent("file@#$ (1).txt")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'file@#$ (1).txt'")
    }
    
    /// Test that uniqueFilename handles files with dots in the basename
    @Test("uniqueFilename handles dots in basename")
    func testUniqueFilenameDotsInBasename() throws {
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Create a file with dots in the basename
        let testFile = tempDirectory.appendingPathComponent("my.file.name.txt")
        try "content".write(to: testFile, atomically: true, encoding: .utf8)
        
        let uniqueURL = testFile.uniqueFilename()
        
        // Should only treat .txt as extension
        let expectedURL = tempDirectory.appendingPathComponent("my.file.name (1).txt")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'my.file.name (1).txt'")
    }
    
    /// Test that uniqueFilename handles very long counter values
    @Test("uniqueFilename handles large counter values")
    func testUniqueFilenameLargeCounter() throws {
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Create the base file
        let testFile = tempDirectory.appendingPathComponent("test.txt")
        try "content".write(to: testFile, atomically: true, encoding: .utf8)
        
        // Create files up to (99)
        for i in 1...99 {
            let conflictFile = tempDirectory.appendingPathComponent("test (\(i)).txt")
            try "content".write(to: conflictFile, atomically: true, encoding: .utf8)
        }
        
        let uniqueURL = testFile.uniqueFilename()
        
        let expectedURL = tempDirectory.appendingPathComponent("test (100).txt")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'test (100).txt'")
    }
    
    /// Test that uniqueFilename handles filenames ending with a dot
    @Test("uniqueFilename handles trailing dot")
    func testUniqueFilenameTrailingDot() throws {
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        // Create a file with a trailing dot
        let testFile = tempDirectory.appendingPathComponent("file.")
        try "content".write(to: testFile, atomically: true, encoding: .utf8)
        
        let uniqueURL = testFile.uniqueFilename()
        
        // Should treat trailing dot as no extension
        let expectedURL = tempDirectory.appendingPathComponent("file. (1)")
        #expect(uniqueURL == expectedURL, "Expected unique filename to be 'file. (1)'")
    }
    
    /// Test that uniqueFilename handles all supported compound extensions
    @Test("uniqueFilename handles all compound extensions")
    func testUniqueFilenameAllCompoundExtensions() throws {
        let tempDirectory = FileManager.default.temporaryDirectory
            .appendingPathComponent("URLUniqueFilenameTests_\(UUID().uuidString)")
        
        defer {
            try? FileManager.default.removeItem(at: tempDirectory)
        }
        
        try FileManager.default.createDirectory(
            at: tempDirectory,
            withIntermediateDirectories: true,
            attributes: nil
        )
        
        let compoundExtensions = [
            "tar.gz", "tar.bz2", "tar.xz", "tar.Z", "tar.lz", 
            "tar.lzma", "tar.zst", "tar.br"
        ]
        
        for ext in compoundExtensions {
            let testFile = tempDirectory.appendingPathComponent("archive.\(ext)")
            try "content".write(to: testFile, atomically: true, encoding: .utf8)
            
            let uniqueURL = testFile.uniqueFilename()
            let expectedURL = tempDirectory.appendingPathComponent("archive (1).\(ext)")
            
            #expect(uniqueURL == expectedURL, "Expected unique filename for .\(ext) to be 'archive (1).\(ext)'")
            
            // Clean up for next iteration
            try? FileManager.default.removeItem(at: testFile)
        }
    }
}

