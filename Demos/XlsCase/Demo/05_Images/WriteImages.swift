import XCTest
@testable import Spire_Xls

class WriteImagesTests: TestCaseBase {
    func testWriteImages() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WriteImages.xlsx"
        let inputFile_Img = TestUtil.DataPath + "Demo/SpireXls.png"
        let outputFile = TestUtil.OutputPath + "Demo/WriteImages.xlsx"
        
        // Create a Workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Add an image to the specific cell
        try sheet.get_Pictures().Add(14, 5, inputFile_Img)
        
        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/WriteImages.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
