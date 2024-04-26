import XCTest
@testable import Spire_Xls

class SetFirstPageNumberTests: TestCaseBase {
    func testSetFirstPageNumber() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetFirstPageNumber.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set the first page number of the worksheet pages
        try sheet.get_PageSetup().set_FirstPageNumber(2)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetFirstPageNumber.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
