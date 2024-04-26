import XCTest
@testable import Spire_Xls

class SetExcelPaperSizeTests: XCTestCase {

    func testSetExcelPaperSize() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetExcelPaperSize.xlsx"

        // Create a workbook.
        let workbook = try Workbook()

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set the paper size of the worksheet as A4 paper.
        try sheet.get_PageSetup().set_PaperSize(PaperSizeType.PaperA4)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetExcelPaperSize.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}