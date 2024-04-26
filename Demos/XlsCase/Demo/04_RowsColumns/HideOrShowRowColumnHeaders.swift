import XCTest
@testable import Spire_Xls

class HideOrShowRowColumnHeadersTests: TestCaseBase {

    func testHideOrShowRowColumnHeaders() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideOrShowRowColumnHeaders.xlsx"

        // Create a workbook.
        let workbook = try Workbook()

        // Load the file from disk.
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Hide the headers of rows and columns
        try sheet.set_RowColumnHeadersVisible(false)

        // Show the headers of rows and columns
        // sheet.set_RowColumnHeadersVisible(true)

        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/HideOrShowRowColumnHeaders.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
