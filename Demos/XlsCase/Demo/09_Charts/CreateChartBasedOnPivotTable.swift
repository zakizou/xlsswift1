import XCTest
@testable import Spire_Xls

class CreateChartBasedOnPivotTableTests: TestCaseBase {
    func testCreateChartBasedOnPivotTable() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTable_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateChartBasedOnPivotTable.xlsx"
        // Create a workbook
        let workbook = try Workbook()

        // Load an excel file including pivot table
        try workbook.LoadFromFile(inputFile)

        // Get the sheet in which the pivot table is located
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let pt = try sheet.get_PivotTables().get_Item(0) as! XlsPivotTable

        try ((workbook.get_Worksheets().get_Item(1) as! Worksheet).get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.BarClustered, pt)

        // Save the Excel file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CreateChartBasedOnPivotTable.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
