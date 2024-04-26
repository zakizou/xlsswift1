import XCTest
@testable import Spire_Xls

class GroupRowsAndColumnsTests: TestCaseBase {

    func testGroupRowsAndColumns() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/GroupRowsAndColumns.xls"
        let outputFile = TestUtil.OutputPath + "Demo/GroupRowsAndColumns.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Grouping rows
        try sheet.GroupByRows(1, 5, false)
        // Grouping columns
        try sheet.GroupByColumns(1, 3, false)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // region check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/GroupRowsAndColumns.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }

}
