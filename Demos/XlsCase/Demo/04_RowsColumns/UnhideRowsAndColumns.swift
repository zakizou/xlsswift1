import XCTest
@testable import Spire_Xls

class UnhideRowsAndColumnsTests: TestCaseBase {

    func testUnhideRowsAndColumns() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CommonTemplate1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/UnhideRowsAndColumns.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Unhide the row
        try sheet.ShowRow(15)

        // Unhide the column
        try sheet.ShowColumn(4)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/UnhideRowsAndColumns.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
