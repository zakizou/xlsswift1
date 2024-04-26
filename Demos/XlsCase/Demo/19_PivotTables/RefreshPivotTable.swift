import XCTest
@testable import Spire_Xls

class RefreshPivotTableTests: TestCaseBase {
    func testRefreshPivotTable() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_7.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RefreshPivotTable.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(1) as! Worksheet
        try sheet.get_Range().get_Item("D2").set_Value("999")

        let pt = try workbook.get_Worksheets().get_Item(0).get_PivotTables().get_Item(0) as! XlsPivotTable
        try pt.get_Cache().set_IsRefreshOnLoad(true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RefreshPivotTable.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

