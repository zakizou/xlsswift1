import XCTest
@testable import Spire_Xls

class FormatAxisTests: TestCaseBase {
    func testFormatAxis() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/FormatAxis.xlsx"
        
        // Create a Workbook
        let workbook = try Workbook()
        
        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("FormatAxis")
        
        // Set chart data
        try self._CreateChartData(sheet)
        
        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.ColumnClustered)
        try chart.set_DataRange(sheet.get_Range().get_Item("B1:B9"))
        try chart.set_SeriesDataFromRange(false)
        try chart.get_PlotArea().set_Visible(false)
        try chart.set_TopRow(10)
        try chart.set_BottomRow(28)
        try chart.set_LeftColumn(2)
        try chart.set_RightColumn(10)
        try chart.set_ChartTitle("Chart with Customized Axis")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        let cs1 = try chart.get_Series().get_Item(0)
        try cs1.set_CategoryLabels(sheet.get_Range().get_Item("A2:A9"))
        
        // Format axis
        try chart.get_PrimaryValueAxis().set_MajorUnit(8)
        try chart.get_PrimaryValueAxis().set_MinorUnit(2)
        try chart.get_PrimaryValueAxis().set_MaxValue(50)
        try chart.get_PrimaryValueAxis().set_MinValue(0)
        try chart.get_PrimaryValueAxis().set_IsReverseOrder(false)
        try chart.get_PrimaryValueAxis().set_MajorTickMark(TickMarkType.TickMarkOutside)
        try chart.get_PrimaryValueAxis().set_MinorTickMark(TickMarkType.TickMarkInside)
        try chart.get_PrimaryValueAxis().set_TickLabelPosition(TickLabelPositionType.TickLabelPositionNextToAxis)
        try chart.get_PrimaryValueAxis().set_CrossesAt(0)
        
        // Set NumberFormat
        try chart.get_PrimaryValueAxis().set_NumberFormat("$#,##0")
        try chart.get_PrimaryValueAxis().set_IsSourceLinked(false)
        
        let serie = try chart.get_Series().get_Item(0)
        for dataPoint in try (serie.get_DataPoints() as! ChartDataPointsCollection) {
            // Format Series
            try dataPoint.get_DataFormat().get_Fill().set_FillType(ShapeFillType.SolidColor)
            try dataPoint.get_DataFormat().get_Fill().set_ForeColor(Color.get_LightGreen())
            
            // Set transparency
            try dataPoint.get_DataFormat().get_Fill().set_Transparency(0.3)
        }
        
        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/FormatAxis.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
    
    private func _CreateChartData(_ sheet: Worksheet) throws {
        // Set value of specified cell
        try sheet.get_Range().get_Item("A1").set_Value("Month")
        try sheet.get_Range().get_Item("A2").set_Value("Jan")
        try sheet.get_Range().get_Item("A3").set_Value("Feb")
        try sheet.get_Range().get_Item("A4").set_Value("Mar")
        try sheet.get_Range().get_Item("A5").set_Value("Apr")
        try sheet.get_Range().get_Item("A6").set_Value("May")
        try sheet.get_Range().get_Item("A7").set_Value("Jun")
        try sheet.get_Range().get_Item("A8").set_Value("Jul")
        try sheet.get_Range().get_Item("A9").set_Value("Aug")
        
        try sheet.get_Range().get_Item("B1").set_Value("Planned")
        try! sheet.get_Range().get_Item("B2").set_NumberValue(38)
        try! sheet.get_Range().get_Item("B3").set_NumberValue(47)
        try! sheet.get_Range().get_Item("B4").set_NumberValue(39)
        try! sheet.get_Range().get_Item("B5").set_NumberValue(36)
        try! sheet.get_Range().get_Item("B6").set_NumberValue(27)
        try! sheet.get_Range().get_Item("B7").set_NumberValue(25)
        try! sheet.get_Range().get_Item("B8").set_NumberValue(36)
        try! sheet.get_Range().get_Item("B9").set_NumberValue(48)
    }
}
