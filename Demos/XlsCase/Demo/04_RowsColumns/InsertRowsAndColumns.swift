import XCTest
@testable import Spire_Xls

class InsertRowsAndColumnsTests: TestCaseBase {

    func testInsertRowsAndColumns() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/InsertRowsAndColumns.xls"
        let outputFile = TestUtil.OutputPath + "Demo/InsertRowsAndColumns.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Inserting a row into the worksheet
        try worksheet.InsertRow(2)
        // Inserting a column into the worksheet
        try worksheet.InsertColumn(2)
        // Inserting multiple rows into the worksheet
        try worksheet.InsertRow(5, 2)
        // Inserting multiple columns into the worksheet
        try worksheet.InsertColumn(5, 2)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/InsertRowsAndColumns.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
