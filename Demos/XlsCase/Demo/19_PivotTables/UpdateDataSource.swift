import XCTest
@testable import Spire_Xls

class UpdateDataSourceTests: TestCaseBase {
    func testUpdateDataSource() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTableExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/UpdateDataSource.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let data = try workbook.get_Worksheets().get_Item("Data") as! Worksheet
        try data.get_Range().get_Item("A2").set_Text("NewValue")
        try data.get_Range().get_Item("D2").set_NumberValue(28000)

        let sheet = try workbook.get_Worksheets().get_Item("PivotTable") as! Worksheet
        let pt = try sheet.get_PivotTables().get_Item(0) as! XlsPivotTable
        try pt.get_Cache().set_IsRefreshOnLoad(true)
        try pt.CalculateData()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/UpdateDataSource.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}