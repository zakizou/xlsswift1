import XCTest
@testable import Spire_Xls

class DeleteMultipleRowsAndColumnsTests: TestCaseBase {

    func testDeleteMultipleRowsAndColumns() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CommonTemplate1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DeleteMultipleRowsAndColumns.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Delete 4 rows from the fifth row
        try sheet.DeleteRow(5, 4)

        // Delete 2 columns from the second column
        try sheet.DeleteColumn(2, 2)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/DeleteMultipleRowsAndColumns.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
