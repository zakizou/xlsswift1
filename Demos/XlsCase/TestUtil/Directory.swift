import Foundation

enum DirectoryError: Error {
    case directoryNotFound
}

class Directory {
    static func exists(_ path: String) -> Bool {
        return FileManager.default.fileExists(atPath: path)
    }
    
    static func createDirectory(_ path: String) throws {
        if !FileManager.default.fileExists(atPath: path) {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    static func getFiles(_ path: String) throws -> [String] {
        guard let enumerator = FileManager.default.enumerator(atPath: path) else {
            throw DirectoryError.directoryNotFound
        }
        
        var fileURLs: [String] = []
        for case let fileURL as URL in enumerator {
            fileURLs.append(fileURL.path)
        }
        
        return fileURLs
    }
}
