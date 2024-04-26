import XCTest
@testable import Spire_Xls

class StackedColumnTests: TestCaseBase {

    func testStackedColumn() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/StackedColumn.xlsx"

        // Create a Workbook
        let workbook = try Workbook()

        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("StackedColumn")

        // Set chart data
        try self._createChartData(sheet)

        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()

        // Set region of chart data
        try chart.set_DataRange(try sheet.get_Range().get_Item("A1:C5"))
        try chart.set_SeriesDataFromRange(false)

        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(11)
        try chart.set_BottomRow(29)
        try chart.set_ChartType(ExcelChartType.ColumnStacked)

        // Chart title
        try chart.set_ChartTitle("Sales market by country")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)

        // Chart Axes
        try chart.get_PrimaryCategoryAxis().set_Title("Country")
        try chart.get_PrimaryCategoryAxis().get_Font().set_IsBold(true)
        try chart.get_PrimaryCategoryAxis().get_TitleArea().set_IsBold(true)

        try chart.get_PrimaryValueAxis().set_Title("Sales(in Dollars)")
        try chart.get_PrimaryValueAxis().set_HasMajorGridLines(false)
        try chart.get_PrimaryValueAxis().set_MinValue(1000)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_IsBold(true)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_TextRotationAngle(90)

        for i in try 0..<chart.get_Series().get_Count() {
            let cs  = try chart.get_Series().get_Item(i)
            try cs.get_Format().get_Options().set_IsVaryColor(true)
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        }

        // Chart Legend
        try chart.get_Legend().set_Position(LegendPositionType.Top)

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/StackedColumn.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }

    func testStackedColumn_3D() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/StackedColumn_3D.xlsx"

        // Create a Workbook
        let workbook = try Workbook()

        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("StackedColumn")

        // Set chart data
        try self._createChartData(sheet)

        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()

        // Set region of chart data
        try chart.set_DataRange(try sheet.get_Range().get_Item("A1:C5"))
        try chart.set_SeriesDataFromRange(false)

        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(11)
        try chart.set_BottomRow(29)
        try chart.set_ChartType(ExcelChartType.Column3DStacked)

        // Chart title
        try chart.set_ChartTitle("Sales market by country")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)

        // Chart Axes
        try chart.get_PrimaryCategoryAxis().set_Title("Country")
        try chart.get_PrimaryCategoryAxis().get_Font().set_IsBold(true)
        try chart.get_PrimaryCategoryAxis().get_TitleArea().set_IsBold(true)

        try chart.get_PrimaryValueAxis().set_Title("Sales(in Dollars)")
        try chart.get_PrimaryValueAxis().set_HasMajorGridLines(false)
        try chart.get_PrimaryValueAxis().set_MinValue(1000)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_IsBold(true)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_TextRotationAngle(90)

        for i in try 0..<chart.get_Series().get_Count() {
            let cs  = try chart.get_Series().get_Item(i)
            try cs.get_Format().get_Options().set_IsVaryColor(true)
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        }

        // Chart Legend
        try chart.get_Legend().set_Position(LegendPositionType.Top)

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/StackedColumn_3D.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }

    func _createChartData(_ sheet: Worksheet)throws {
        // Set value of specified cell
        try sheet.get_Range().get_Item("A1").set_Value("Country")
        try sheet.get_Range().get_Item("A2").set_Value("Cuba")
        try sheet.get_Range().get_Item("A3").set_Value("Mexico")
        try sheet.get_Range().get_Item("A4").set_Value("France")
        try sheet.get_Range().get_Item("A5").set_Value("German")

        try sheet.get_Range().get_Item("B1").set_Value("Jun")
        try sheet.get_Range().get_Item("B2").set_NumberValue(6000)
        try sheet.get_Range().get_Item("B3").set_NumberValue(8000)
        try sheet.get_Range().get_Item("B4").set_NumberValue(9000)
        try sheet.get_Range().get_Item("B5").set_NumberValue(8500)

        try sheet.get_Range().get_Item("C1").set_Value("Aug")
        try sheet.get_Range().get_Item("C2").set_NumberValue(3000)
        try sheet.get_Range().get_Item("C3").set_NumberValue(2000)
        try sheet.get_Range().get_Item("C4").set_NumberValue(2300)
        try sheet.get_Range().get_Item("C5").set_NumberValue(4200)

        // Style
        try sheet.get_Range().get_Item("A1:C1").set_RowHeight(15)
        try sheet.get_Range().get_Item("A1:C1").get_Style().set_Color(Color.get_DarkGray())
        try sheet.get_Range().get_Item("A1:C1").get_Style().get_Font().set_Color(Color.get_White())
        try sheet.get_Range().get_Item("A1:C1").get_Style().set_VerticalAlignment(.Center)
        try sheet.get_Range().get_Item("A1:C1").get_Style().set_HorizontalAlignment(.Center)

        try sheet.get_Range().get_Item("B2:C5").get_Style().set_NumberFormat("\"$\"#,##0")

    }
}

