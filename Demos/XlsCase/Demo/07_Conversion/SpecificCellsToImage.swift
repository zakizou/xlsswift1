import XCTest
@testable import Spire_Xls

class SpecificCellsToImageTests: TestCaseBase {
    func testSpecificCellsToImage() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ConversionSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/Image/"
        if !File.exists(outputFile) {
            try Directory.createDirectory(outputFile)
        }
        
        // Load the document and perform necessary operations.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Specify Cell Ranges and Save to certain Image formats
        try sheet.ToImage(1, 1, 7, 5).Save(outputFile + "SpecificCellsToImage.png", ImageFormat.get_Png())
        try sheet.ToImage(8, 1, 15, 5).Save(outputFile + "SpecificCellsToImage.jpg", ImageFormat.get_Jpeg())
        try sheet.ToImage(17, 1, 23, 5).Save(outputFile + "SpecificCellsToImage.bmp", ImageFormat.get_Bmp())
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/Image/"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
