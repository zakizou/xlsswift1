import XCTest
@testable import Spire_Xls

class DeleteBlankRowsAndColumnsTests: TestCaseBase {

    func testDeleteBlankRowsAndColumns() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DeleteBlankRowsAndColumns.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the file from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Delete blank rows from the worksheet
        for i in (0...(try sheet.get_Rows().get_Count() - 1)).reversed() {
            if try sheet.get_Rows().get_Item(i).get_IsBlank() {
                try sheet.DeleteRow(i + 1)
            }
        }

        // Delete blank columns from the worksheet
        for j in (0...(try sheet.get_Columns().get_Count() - 1)).reversed() {
            if try sheet.get_Columns().get_Item(j).get_IsBlank() {
                try sheet.DeleteColumn(j + 1)
            }
        }

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/DeleteBlankRowsAndColumns.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
