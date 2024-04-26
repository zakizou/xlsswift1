import XCTest
@testable import Spire_Xls

class ReadImagesTests: XCTestCase {
    func testReadImages() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadImages.xlsx"
        let output = TestUtil.OutputPath + "Demo/Image/"
        let outputFile = TestUtil.OutputPath + "Demo/Image/ReadImages.jpg"
        
        if !FileManager.default.fileExists(atPath: output) {
            try FileManager.default.createDirectory(atPath: output, withIntermediateDirectories: true, attributes: nil)
        }

        // Create a Workbook
        let workbook = try Workbook()
        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Get the first image
        let pic = try (sheet.get_Pictures()as! XlsPicturesCollection).get_Item(0)

        try pic.get_Picture().Save(outputFile, ImageFormat.get_Jpeg())
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/Image/ReadImages.jpg"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
