import XCTest
@testable import Spire_Xls

class InsertExcelBackgroundImageTests: TestCaseBase {
    func testInsertExcelBackgroundImage() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let inputFileImg = TestUtil.DataPath + "Demo/Background.png"
        let outputFile = TestUtil.OutputPath + "Demo/InsertExcelBackgroundImage.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Open an image
        let bm = try Image.FromFile(inputFileImg)

        // Set the image to be the background image of the worksheet
        try sheet.get_PageSetup().set_BackgoundImage(bm)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/InsertExcelBackgroundImage.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
