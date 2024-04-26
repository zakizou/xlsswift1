import XCTest
@testable import Spire_Xls

class SetFormatOptionsTests: TestCaseBase {
    func testSetFormatOptions() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTableExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetFormatOptions.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item("PivotTable") as! Worksheet
        let pt = try sheet.get_PivotTables().get_Item(0) as! XlsPivotTable

        try pt.get_Options().set_IsAutoFormat(true)
        try pt.set_ShowRowGrand(true)
        try pt.set_ShowColumnGrand(true)
        try pt.set_DisplayNullString(true)
        try pt.set_NullString("null")
        try pt.set_PageFieldOrder(PagesOrderType.DownThenOver)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetFormatOptions.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}