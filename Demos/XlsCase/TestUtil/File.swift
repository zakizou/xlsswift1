import Foundation
import Spire_Xls
enum FileError: Error {
    case fileOpenError
    case fileWriteError
    case fileCloseError
    case fileCreationError
}
class File {
    let fullName: String
    
    init(fileName: String) {
        self.fullName = URL(fileURLWithPath: fileName).path
    }
    
    var `extension`: String {
        return URL(fileURLWithPath: fullName).pathExtension
    }
    
    var name: String {
        return URL(fileURLWithPath: fullName).lastPathComponent
    }
    
    static func exists(_ name: String) -> Bool {
        return FileManager.default.fileExists(atPath: name)
    }
    
    static func delete(_ name: String) throws {
        if FileManager.default.fileExists(atPath: name) {
            try FileManager.default.removeItem(atPath: name)
        }
    }
    
    static func appendText(_ name: String,_ text: String) throws {
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: name) {
            guard fileManager.createFile(atPath: name, contents: nil, attributes: nil) else {
                throw FileError.fileCreationError
            }
        }
        guard let file = FileHandle(forWritingAtPath: name) else {
            throw FileError.fileOpenError
        }
        
        defer {
            file.closeFile()
        }
        
        guard let data = text.data(using: .utf8) else {
            throw FileError.fileWriteError
        }
        file.seekToEndOfFile()
        file.write(data)
    }
    static func appendAllText(_ name: String, _ text: [String]) throws {
        let data = text.joined(separator: "\n")
        try appendText(name, data)
    }
    
    // static func writeAllBytes(_ name: String, _ data: [UInt8]) throws {
    //     let stream = try Stream(data)
    //     try stream.save(name)
    //     try stream.Flush()
    //     try stream.Close()
    // }
    
    // static func readAllBytes(_ name: String) throws -> Data {
    //     return try Data(contentsOf: URL(fileURLWithPath: name))
    // }
    static func writeAllBytes(_ name: String,_ bytes: [UInt8]) {
        let data = Data(bytes)
        let url = URL(fileURLWithPath: name)
        do {
            try data.write(to: url, options: .atomic)
        } catch {
            print("Error writing data to \(name): \(error)")
        }
    }

    static func readAllBytes(_ name: String) -> [UInt8]? {
        let url = URL(fileURLWithPath: name)
        do {
            let data = try Data(contentsOf: url)
            let bytes = [UInt8](data)
            return bytes
        } catch {
            print("Error reading data from \(name): \(error)")
            return nil
        }
    }    
    static func copy(_ source: String, _ dest: String) throws {
        try FileManager.default.copyItem(atPath: source, toPath: dest)
    }
    
    static func open(_ name: String) -> InputStream? {
        if let inputStream = InputStream(fileAtPath: name) {
            return inputStream
        }
        return nil
    }
    
    static func openRead(_ name: String) -> InputStream? {
        return open(name)
    }
    
    static func writeAllText(_ fileName: String, _ text: String) throws {
        try text.write(toFile: fileName, atomically: false, encoding: .utf8)
    }
}

extension String {
    func append(toFileURL fileURL: URL) throws {
        try self.appendLine(toFileURL: fileURL, ending: false)
    }
    
    func appendLine(toFileURL fileURL: URL, ending: Bool = true) throws {
        let stringToAppend = ending ? self + "\n" : self
        guard let fileHandle = FileHandle(forWritingAtPath: fileURL.path) else {
            throw NSError(domain: NSPOSIXErrorDomain, code: 0, userInfo: nil)
        }
        defer {
            fileHandle.closeFile()
        }
        fileHandle.seekToEndOfFile()
        if let data = stringToAppend.data(using: .utf8) {
            fileHandle.write(data)
        }
    }
}
