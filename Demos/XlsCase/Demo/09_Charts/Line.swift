import XCTest
@testable import Spire_Xls

class LineTests: TestCaseBase {
    func testLine() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/Line.xlsx"

        // Create a Workbook
        let workbook = try Workbook()

        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Line Chart")

        // Set chart data
        try self._createChartData(sheet)

        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_ChartType(ExcelChartType.Line)

        // Set region of chart data
        try chart.set_DataRange(sheet.get_Range().get_Item("A1:E5"))

        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(11)
        try chart.set_BottomRow(29)

        // Set chart title
        try chart.set_ChartTitle("Sales market by country")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)

        try chart.get_PrimaryCategoryAxis().set_Title("Month")
        try chart.get_PrimaryCategoryAxis().get_Font().set_IsBold(true)
        try chart.get_PrimaryCategoryAxis().get_TitleArea().set_IsBold(true)

        try chart.get_PrimaryValueAxis().set_Title("Sales(in Dollars)")
        try chart.get_PrimaryValueAxis().set_HasMajorGridLines(false)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_TextRotationAngle(90)
        try chart.get_PrimaryValueAxis().set_MinValue(1000)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_IsBold(true)
        
        for i in try 0..<chart.get_Series().get_Count() {
            let cs  = try chart.get_Series().get_Item(i)
            try cs.get_Format().get_Options().set_IsVaryColor(true)
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        }

        try chart.get_PlotArea().get_Fill().set_Visible(false)

        try chart.get_Legend().set_Position(LegendPositionType.Top)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/Line.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }

    func testLine_Circle() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/Line_Circle.xlsx"

        // Create a Workbook
        let workbook = try Workbook()

        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Line Chart")

        // Set chart data
        try self._createChartData(sheet)

        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_ChartType(ExcelChartType.Line)

        // Set region of chart data
        try chart.set_DataRange(sheet.get_Range().get_Item("A1:E5"))

        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(11)
        try chart.set_BottomRow(29)

        // Set chart title
        try chart.set_ChartTitle("Sales market by country")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)

        try chart.get_PrimaryCategoryAxis().set_Title("Month")
        try chart.get_PrimaryCategoryAxis().get_Font().set_IsBold(true)
        try chart.get_PrimaryCategoryAxis().get_TitleArea().set_IsBold(true)

        try chart.get_PrimaryValueAxis().set_Title("Sales(in Dollars)")
        try chart.get_PrimaryValueAxis().set_HasMajorGridLines(false)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_TextRotationAngle(90)
        try chart.get_PrimaryValueAxis().set_MinValue(1000)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_IsBold(true)

        for i in try 0..<chart.get_Series().get_Count() {
            let cs  = try chart.get_Series().get_Item(i)
            try cs.get_Format().get_Options().set_IsVaryColor(true)
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
            try cs.get_DataFormat().set_MarkerStyle(ChartMarkerType.Circle)
        }

        try chart.get_PlotArea().get_Fill().set_Visible(false)

        try chart.get_Legend().set_Position(LegendPositionType.Top)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/Line_Circle.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }

    func testLine_3D() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/Line_3D.xlsx"

        // Create a Workbook
        let workbook = try Workbook()

        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Line Chart")

        // Set chart data
        try self._createChartData(sheet)

        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_ChartType(ExcelChartType.Line3D)

        // Set region of chart data
        try chart.set_DataRange(sheet.get_Range().get_Item("A1:E5"))

        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(11)
        try chart.set_BottomRow(29)

        // Set chart title
        try chart.set_ChartTitle("Sales market by country")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)

        try chart.get_PrimaryCategoryAxis().set_Title("Month")
        try chart.get_PrimaryCategoryAxis().get_Font().set_IsBold(true)
        try chart.get_PrimaryCategoryAxis().get_TitleArea().set_IsBold(true)

        try chart.get_PrimaryValueAxis().set_Title("Sales(in Dollars)")
        try chart.get_PrimaryValueAxis().set_HasMajorGridLines(false)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_TextRotationAngle(90)
        try chart.get_PrimaryValueAxis().set_MinValue(1000)
        try chart.get_PrimaryValueAxis().get_TitleArea().set_IsBold(true)

        for i in try 0..<chart.get_Series().get_Count() {
            let cs  = try chart.get_Series().get_Item(i)
            try cs.get_Format().get_Options().set_IsVaryColor(true)
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        }

        try chart.get_PlotArea().get_Fill().set_Visible(false)

        try chart.get_Legend().set_Position(LegendPositionType.Top)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/Line_3D.xlsx"
        // Compare
        // CompareFile(baseLineFile, outputFile)
    }

    private func _createChartData(_ sheet: Worksheet)throws{
        // Set value of specified cell
        try sheet.get_Range().get_Item("A1").set_Value("Country")
        try sheet.get_Range().get_Item("A2").set_Value("Cuba")
        try sheet.get_Range().get_Item("A3").set_Value("Mexico")
        try sheet.get_Range().get_Item("A4").set_Value("France")
        try sheet.get_Range().get_Item("A5").set_Value("German")

        try sheet.get_Range().get_Item("B1").set_Value("Jun")
        try sheet.get_Range().get_Item("B2").set_NumberValue(3300)
        try sheet.get_Range().get_Item("B3").set_NumberValue(2300)
        try sheet.get_Range().get_Item("B4").set_NumberValue(4500)
        try sheet.get_Range().get_Item("B5").set_NumberValue(6700)

        try sheet.get_Range().get_Item("C1").set_Value("Jul")
        try sheet.get_Range().get_Item("C2").set_NumberValue(7500)
        try sheet.get_Range().get_Item("C3").set_NumberValue(2900)
        try sheet.get_Range().get_Item("C4").set_NumberValue(2300)
        try sheet.get_Range().get_Item("C5").set_NumberValue(4200)

        try sheet.get_Range().get_Item("D1").set_Value("Aug")
        try sheet.get_Range().get_Item("D2").set_NumberValue(7400)
        try sheet.get_Range().get_Item("D3").set_NumberValue(6900)
        try sheet.get_Range().get_Item("D4").set_NumberValue(7800)
        try sheet.get_Range().get_Item("D5").set_NumberValue(4200)

        try sheet.get_Range().get_Item("E1").set_Value("Sep")
        try sheet.get_Range().get_Item("E2").set_NumberValue(8000)
        try sheet.get_Range().get_Item("E3").set_NumberValue(7200)
        try sheet.get_Range().get_Item("E4").set_NumberValue(8500)
        try sheet.get_Range().get_Item("E5").set_NumberValue(5600)

        // Style
        try sheet.get_Range().get_Item("A1:E1").set_RowHeight(15)
        try sheet.get_Range().get_Item("A1:E1").get_Style().set_Color(Color.get_DarkGray())
        try sheet.get_Range().get_Item("A1:E1").get_Style().get_Font().set_Color(Color.get_White())
        try sheet.get_Range().get_Item("A1:E1").get_Style().set_VerticalAlignment(VerticalAlignType.Center)
        try sheet.get_Range().get_Item("A1:E1").get_Style().set_HorizontalAlignment(HorizontalAlignType.Center)

        try sheet.get_Range().get_Item("B2:D5").get_Style().set_NumberFormat("\"$\"#,##0")
    }
}