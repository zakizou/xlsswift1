import XCTest
@testable import Spire_Xls

class ChangeDataSourceTests: TestCaseBase {
    func testChangeDataSource() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChangeDataSource.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChangeDataSource.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load an Excel file including a pivot table
        try workbook.LoadFromFile(inputFile)
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let range = try sheet.get_Range().get_Item("A1:C15")

        let table = try (workbook.get_Worksheets().get_Item(1) as! Worksheet).get_PivotTables().get_Item(0) as! XlsPivotTable

        // Change data source
        try table.ChangeDataSource(range)
        try table.get_Cache().set_IsRefreshOnLoad(false)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChangeDataSource.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

