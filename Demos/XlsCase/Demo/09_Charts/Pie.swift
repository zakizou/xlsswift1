import XCTest
@testable import Spire_Xls

class PieTests: TestCaseBase {
    func testPie() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/Pie.xlsx"
        
        // Create a Workbook
        let workbook = try Workbook()
        
        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Pie Chart")
        
        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.Pie)
        
        // Set chart data
        try self._createChartData(sheet)
        
        // Set region of chart data
        try chart.set_DataRange(sheet.get_Range().get_Item("B2:B5"))
        try chart.set_SeriesDataFromRange(false)
        
        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(9)
        try chart.set_BottomRow(25)
        
        // Chart title
        try chart.set_ChartTitle("Sales by year")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        
        let cs = try chart.get_Series().get_Item(0) as! ChartSerie
        try cs.set_CategoryLabels(sheet.get_Range().get_Item("A2:A5"))
        try cs.set_Values(sheet.get_Range().get_Item("B2:B5"))
        try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        
        try chart.get_PlotArea().get_Fill().set_Visible(false)
        
        // Save and launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/Pie.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }

    func testPie_3D() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/Pie_3D.xlsx"
        
        // Create a Workbook
        let workbook = try Workbook()
        
        // Get the first sheet and set its name
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Pie Chart")
        
        // Add a chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.Pie3D)
        
        // Set chart data
        try self._createChartData(sheet)
        
        // Set region of chart data
        try chart.set_DataRange(sheet.get_Range().get_Item("B2:B5"))
        try chart.set_SeriesDataFromRange(false)
        
        // Set position of chart
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(9)
        try chart.set_BottomRow(25)
        
        // Chart title
        try chart.set_ChartTitle("Sales by year")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        
        let cs = try chart.get_Series().get_Item(0) as! ChartSerie
        try cs.set_CategoryLabels(sheet.get_Range().get_Item("A2:A5"))
        try cs.set_Values(sheet.get_Range().get_Item("B2:B5"))
        try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        
        try chart.get_PlotArea().get_Fill().set_Visible(false)
        
        // Save and launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/Pie_3D.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }

    private func _createChartData(_ sheet: Worksheet)throws {
        // Set value of specified cell
        try sheet.get_Range().get_Item("A1").set_Value("Year")
        try sheet.get_Range().get_Item("A2").set_Value("2002")
        try sheet.get_Range().get_Item("A3").set_Value("2003")
        try sheet.get_Range().get_Item("A4").set_Value("2004")
        try sheet.get_Range().get_Item("A5").set_Value("2005")

        try sheet.get_Range().get_Item("B1").set_Value("Sales")
        try sheet.get_Range().get_Item("B2").set_NumberValue(4000)
        try sheet.get_Range().get_Item("B3").set_NumberValue(6000)
        try sheet.get_Range().get_Item("B4").set_NumberValue(7000)
        try sheet.get_Range().get_Item("B5").set_NumberValue(8500)

        // Style
        try sheet.get_Range().get_Item("A1:B1").set_RowHeight(15)
        try sheet.get_Range().get_Item("A1:B1").get_Style().set_Color(Color.get_DarkGray())
        try sheet.get_Range().get_Item("A1:B1").get_Style().get_Font().set_Color(Color.get_White())
        try sheet.get_Range().get_Item("A1:B1").get_Style().set_VerticalAlignment(VerticalAlignType.Center)
        try sheet.get_Range().get_Item("A1:B1").get_Style().set_HorizontalAlignment(HorizontalAlignType.Center)

        try sheet.get_Range().get_Item("B2:C5").get_Style().set_NumberFormat("\"$\"#,##0")
    }
}