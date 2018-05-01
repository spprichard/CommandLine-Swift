import Foundation
import XCTest
import Files
import CommandLineToolCore

class CommandLineToolTests: XCTestCase {
    func testCreatingFile() throws {
        let fileSystem = FileSystem()
        let tempFolder = fileSystem.temporaryFolder
        let testFolder = try tempFolder.createSubfolderIfNeeded(withName: "CommandLineToolTests")
        
        // Empty testFolder to ensure clean state
        try testFolder.empty()
        
        // Set the test folder as the working directory
        let fileManager = FileManager.default
        fileManager.changeCurrentDirectoryPath(testFolder.path)
        
        // Create Instance of the CommandLineTool
        let arguments = [testFolder.path, "Hello.swift"]
        let tool = CommandLineTool(arguments: arguments)
        
        try tool.run()
        XCTAssertNotNil(try? testFolder.file(named: "Hello.swift"))
    }
}
