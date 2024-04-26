import XCTest
@testable import Spire_Xls

class CreatePivotChartTests: TestCaseBase {
    func testCreatePivotChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreatePivotChart.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Get the first pivot table in the worksheet
        let pivotTable = try sheet.get_PivotTables().get_Item(0) as! XlsPivotTable

        // Create a clustered column chart based on the pivot table
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.ColumnClustered, pivotTable)
        // Set chart position
        try chart.set_TopRow(10)
        try chart.set_LeftColumn(1)
        try chart.set_RightColumn(7)
        try chart.set_BottomRow(25)
        // Set chart title
        try chart.set_ChartTitle("Pivot Chart")

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/CreatePivotChart.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
