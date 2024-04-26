import XCTest
@testable import Spire_Xls

class CopySingleColumnAndRowTests: TestCaseBase {

    func testCopySingleColumnAndRow() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CreateTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopySingleColumnAndRow.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Specify a destination range to copy one column
        let columnCells = try sheet1.get_Range().get_Item("G1:G19")

        // Copy the second column to destination range
        try sheet1.get_Columns().get_Item(1).Copy(columnCells as! CellRange)

        // Specify a destination range to copy one row
        let rowCells = try sheet1.get_Range().get_Item("A21:E21")

        // Copy the first row to destination range
        try sheet1.get_Rows().get_Item(0).Copy(rowCells as! CellRange)

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/CopySingleColumnAndRow.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
