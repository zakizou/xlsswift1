import XCTest
@testable import Spire_Xls

class CreateBubbleChartTests: TestCaseBase {
    func testCreateBubbleChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CreateBubbleChart.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateBubbleChart.xlsx"
        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.Bubble)

        // Set region of chart data
        try chart.set_DataRange(try sheet.get_Range().get_Item("A1:C5"))
        try chart.set_SeriesDataFromRange(false)
        try chart.get_Series().get_Item(0).set_Bubbles(try sheet.get_Range().get_Item("C2:C5"))
        // Set position of chart
        try chart.set_LeftColumn(7)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(16)
        try chart.set_BottomRow(29)

        try chart.set_ChartTitle("Bubble Chart")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)

        // Save the Excel file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CreateBubbleChart.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
