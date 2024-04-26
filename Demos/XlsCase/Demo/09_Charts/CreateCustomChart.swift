import XCTest
@testable import Spire_Xls

class CreateCustomChartTests: TestCaseBase {
    func testCreateCustomChart() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CreateCustomChart.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set values
        try (sheet.get_Range().get_Item("A1") as! CellRange).set_Value("60")
        try sheet.get_Range().get_Item("A2").set_Value("90")
        try sheet.get_Range().get_Item("A3").set_Value("80")
        try sheet.get_Range().get_Item("A4").set_Value("85")
        try sheet.get_Range().get_Item("B1").set_Value("100")
        try sheet.get_Range().get_Item("B2").set_Value("110")
        try sheet.get_Range().get_Item("B3").set_Value("80")
        try sheet.get_Range().get_Item("B4").set_Value("70")

        // Add a chart based on the data from A1 to B4
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_DataRange(sheet.get_Range().get_Item("A1:B4"))
        try chart.set_SeriesDataFromRange(false)

        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(10)
        try chart.set_RightColumn(7)
        try chart.set_BottomRow(25)

        // Apply different chart type to different series
        let cs1 = try chart.get_Series()[0] as! XlsChartSerie
        try cs1.set_SerieType(ExcelChartType.ColumnClustered)
        let cs2 = try chart.get_Series()[1] as! XlsChartSerie
        try cs2.set_SerieType(ExcelChartType.Line)

        try chart.set_ChartTitle("Custom chart")

        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateCustomChart.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
