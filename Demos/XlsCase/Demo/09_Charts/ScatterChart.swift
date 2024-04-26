import XCTest
@testable import Spire_Xls

class ScatterChartTests: TestCaseBase {
    func testScatterChart() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ScatterChart.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Scatter Chart")

        // Set chart data
        try _CreateChartData(sheet)

        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.ScatterMarkers)

        // Set region of chart data
        try chart.set_DataRange(sheet.get_Range().get_Item("B2:B10"))
        try chart.set_SeriesDataFromRange(false)

        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(11)
        try chart.set_RightColumn(10)
        try chart.set_BottomRow(28)

        try chart.set_ChartTitle("Scatter Chart")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)

        try chart.get_Series().get_Item(0).set_CategoryLabels(sheet.get_Range().get_Item("A2:A10"))
        try chart.get_Series().get_Item(0).set_Values(sheet.get_Range().get_Item("B2:B10"))

        // Add a trend line for the first series
        try chart.get_Series().get_Item(0).get_TrendLines().Add(TrendLineType.Exponential)

        try chart.get_PrimaryValueAxis().set_Title("Salary")
        try chart.get_PrimaryCategoryAxis().set_Title("Car Price")

        try workbook.SaveToFile(outputFile, FileFormat.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ScatterChart.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

func _CreateChartData(_ sheet: Worksheet) throws {
    // Set value of specified cell
    try sheet.get_Range().get_Item("A1").set_Value("Y(Salary)")
    try sheet.get_Range().get_Item("A2").set_Value("42763")
    try sheet.get_Range().get_Item("A3").set_Value("195387")
    try sheet.get_Range().get_Item("A4").set_Value("35672")
    try sheet.get_Range().get_Item("A5").set_Value("217637")
    try sheet.get_Range().get_Item("A6").set_Value("74734")
    try sheet.get_Range().get_Item("A7").set_Value("130550")
    try sheet.get_Range().get_Item("A8").set_Value("42976")
    try sheet.get_Range().get_Item("A9").set_Value("15132")
    try sheet.get_Range().get_Item("A10").set_Value("54936")

    try sheet.get_Range().get_Item("B1").set_Value("X(Car Price)")
    try sheet.get_Range().get_Item("B2").set_Value("19455")
    try sheet.get_Range().get_Item("B3").set_Value("93965")
    try sheet.get_Range().get_Item("B4").set_Value("20858")
    try sheet.get_Range().get_Item("B5").set_Value("107164")
    try sheet.get_Range().get_Item("B6").set_Value("34036")
    try sheet.get_Range().get_Item("B7").set_Value("87806")
    try sheet.get_Range().get_Item("B8").set_Value("17927")
    try sheet.get_Range().get_Item("B9").set_Value("61518")
    try sheet.get_Range().get_Item("B10").set_Value("29479")

    // Style
    try sheet.get_Range().get_Item("A1:B1").set_ColumnWidth(12)
    try sheet.get_Range().get_Item("A1:B1").set_RowHeight(15)
    try sheet.get_Range().get_Item("A1:B1").get_Style().set_Color(Color.get_DarkGray())
    try sheet.get_Range().get_Item("A1:B1").get_Style().get_Font().set_Color(Color.get_White())
    try sheet.get_Range().get_Item("A1:B1").get_Style().set_VerticalAlignment(VerticalAlignType.Center)
    try sheet.get_Range().get_Item("A1:B1").get_Style().set_HorizontalAlignment(HorizontalAlignType.Center)

    try sheet.get_Range().get_Item("A2:B10").get_Style().set_NumberFormat("\"$\"#,##0")
}
