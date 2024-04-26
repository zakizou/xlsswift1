import XCTest
@testable import Spire_Xls

class CreateRadarChartTests: TestCaseBase {
    
    func testCreateRadarChart() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CreateRadarChart.xlsx"
        
        let workbook = try Workbook()
        try workbook.CreateEmptySheets(1)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Chart data")
        try sheet.set_GridLinesVisible(false)
        
        try self.CreateChartData(sheet)
        
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(11)
        try chart.set_BottomRow(29)
        try chart.set_DataRange(try sheet.get_Range().get_Item("A1:C5"))
        try chart.set_SeriesDataFromRange(false)
        try chart.set_ChartType(ExcelChartType.Radar)
        
        try chart.set_ChartTitle("Sale market by region")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        try chart.get_PlotArea().get_Fill().set_Visible(false)
        try chart.get_Legend().set_Position(LegendPositionType.Corner)
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
    }
    
    func testCreateRadarChart_Fill() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CreateRadarChart_Fill.xlsx"
        
        let workbook = try Workbook()
        try workbook.CreateEmptySheets(1)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Chart data")
        try sheet.set_GridLinesVisible(false)
        
        try self.CreateChartData(sheet)
        
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(11)
        try chart.set_BottomRow(29)
        try chart.set_DataRange(try sheet.get_Range().get_Item("A1:C5"))
        try chart.set_SeriesDataFromRange(false)
        try chart.set_ChartType(ExcelChartType.RadarFilled)
        
        try chart.set_ChartTitle("Sale market by region")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        try chart.get_PlotArea().get_Fill().set_Visible(false)
        try chart.get_Legend().set_Position(LegendPositionType.Corner)
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
    }
    
    func CreateChartData(_ sheet: Worksheet)throws {
        try sheet.get_Range().get_Item("A1").set_Value("Product")
        try sheet.get_Range().get_Item("A2").set_Value("Bikes")
        try sheet.get_Range().get_Item("A3").set_Value("Cars")
        try sheet.get_Range().get_Item("A4").set_Value("Trucks")
        try sheet.get_Range().get_Item("A5").set_Value("Buses")
        
        try sheet.get_Range().get_Item("B1").set_Value("Paris")
        try sheet.get_Range().get_Item("B2").set_NumberValue(4000)
        try sheet.get_Range().get_Item("B3").set_NumberValue(23000)
        try sheet.get_Range().get_Item("B4").set_NumberValue(4000)
        try sheet.get_Range().get_Item("B5").set_NumberValue(30000)
        
        try sheet.get_Range().get_Item("C1").set_Value("New York")
        try sheet.get_Range().get_Item("C2").set_NumberValue(30000)
        try sheet.get_Range().get_Item("C3").set_NumberValue(7600)
        try sheet.get_Range().get_Item("C4").set_NumberValue(18000)
        try sheet.get_Range().get_Item("C5").set_NumberValue(8000)
        
        try sheet.get_Range().get_Item("A1:C1").get_Style().get_Font().set_IsBold(true)
        try sheet.get_Range().get_Item("A2:C2").get_Style().set_KnownColor(ExcelColors.LightYellow)
        try sheet.get_Range().get_Item("A3:C3").get_Style().set_KnownColor(ExcelColors.LightGreen1)
        try sheet.get_Range().get_Item("A4:C4").get_Style().set_KnownColor(ExcelColors.LightOrange)
        try sheet.get_Range().get_Item("A5:C5").get_Style().set_KnownColor(ExcelColors.LightTurquoise)
        
        let style = try (sheet.get_Range().get_Item("A1:C5") as! CellRange).get_Style() as! CellStyle
        let borders = try style.get_Borders() as! BordersCollection
        let topborder = try borders.get_Item(BordersLineType.EdgeTop)
        try topborder.set_Color(Color.FromArgb(0, 0, 128))
        try topborder.set_LineStyle(LineStyleType.Thin)
        try borders.get_Item(BordersLineType.EdgeBottom).set_Color(Color.FromArgb(0, 0, 128))
        try sheet.get_Range().get_Item("A1:C5").get_Style().get_Borders().get_Item(BordersLineType.EdgeBottom).set_LineStyle(LineStyleType.Thin)
        try sheet.get_Range().get_Item("A1:C5").get_Style().get_Borders().get_Item(BordersLineType.EdgeLeft).set_Color(Color.FromArgb(0, 0, 128))
        try sheet.get_Range().get_Item("A1:C5").get_Style().get_Borders().get_Item(BordersLineType.EdgeLeft).set_LineStyle(LineStyleType.Thin)
        try sheet.get_Range().get_Item("A1:C5").get_Style().get_Borders().get_Item(BordersLineType.EdgeRight).set_Color(Color.FromArgb(0, 0, 128))
        try sheet.get_Range().get_Item("A1:C5").get_Style().get_Borders().get_Item(BordersLineType.EdgeRight).set_LineStyle(LineStyleType.Thin)
        
        try sheet.get_Range().get_Item("B2:C5").get_Style().set_NumberFormat("\"$\"#,##0")
    }
}
