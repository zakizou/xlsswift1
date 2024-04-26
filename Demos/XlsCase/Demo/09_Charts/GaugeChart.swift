import XCTest
@testable import Spire_Xls

class GaugeChartTests: TestCaseBase {
    func testGaugeChart() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/GaugeChart.xlsx"
        
        // Create a Workbook
        let workbook = try Workbook()
        
        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Gauge Chart")
        
        // Set chart data
        try self._CreateChartData(sheet)
        
        // Add a Doughnut chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.Doughnut)
        try chart.set_DataRange(sheet.get_Range().get_Item("A1:A5"))
        try chart.set_SeriesDataFromRange(false)
        try chart.set_HasLegend(true)
        
        // Set the position of chart
        try chart.set_LeftColumn(2)
        try chart.set_TopRow(7)
        try chart.set_RightColumn(9)
        try chart.set_BottomRow(25)
        
        // Get the series 1
        let cs1 = try chart.get_Series().get_Item("Value")
        try cs1.get_Format().get_Options().set_DoughnutHoleSize(60)
        try cs1.get_DataFormat().get_Options().set_FirstSliceAngle(270)
        
        // Set the fill color
        try cs1.get_DataPoints().get_Item(0).get_DataFormat().get_Fill().set_ForeColor(Color.get_Yellow())
        try cs1.get_DataPoints().get_Item(1).get_DataFormat().get_Fill().set_ForeColor(Color.get_PaleVioletRed())
        try cs1.get_DataPoints().get_Item(2).get_DataFormat().get_Fill().set_ForeColor(Color.get_DarkViolet())
        try cs1.get_DataPoints().get_Item(3).get_DataFormat().get_Fill().set_Visible(false)
        
        // Add a series with pie chart
        let cs2 = try chart.get_Series().Add("Pointer", ExcelChartType.Pie)
        
        // Set the value
        try cs2.set_Values(sheet.get_Range().get_Item("D2:D4"))
        try cs2.set_UsePrimaryAxis(false)
        try cs2.get_DataPoints().get_Item(0).get_DataLabels().set_HasValue(true)
        try cs2.get_DataFormat().get_Options().set_FirstSliceAngle(270)
        try cs2.get_DataPoints().get_Item(0).get_DataFormat().get_Fill().set_Visible(false)
        try cs2.get_DataPoints().get_Item(1).get_DataFormat().get_Fill().set_FillType(ShapeFillType.SolidColor)
        try cs2.get_DataPoints().get_Item(1).get_DataFormat().get_Fill().set_ForeColor(Color.get_Black())
        try cs2.get_DataPoints().get_Item(2).get_DataFormat().get_Fill().set_Visible(false)
        
        // Save and Launch
        try workbook.SaveToFile(outputFile, FileFormat.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GaugeChart.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
    
    private func _CreateChartData(_ sheet: Worksheet) throws {
        // Set value of specified cell
        try sheet.get_Range().get_Item("A1").set_Value("Value")
        try sheet.get_Range().get_Item("A2").set_Value("30")
        try sheet.get_Range().get_Item("A3").set_Value("60")
        try sheet.get_Range().get_Item("A4").set_Value("90")
        try sheet.get_Range().get_Item("A5").set_Value("180")
        try sheet.get_Range().get_Item("C2").set_Value("value")
        try sheet.get_Range().get_Item("C3").set_Value("pointer")
        try sheet.get_Range().get_Item("C4").set_Value("End")
        try! sheet.get_Range().get_Item("D2").set_Value("10")
        try! sheet.get_Range().get_Item("D3").set_Value("1")
        try! sheet.get_Range().get_Item("D4").set_Value("189")
    }
}
