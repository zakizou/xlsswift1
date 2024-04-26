import XCTest
@testable import Spire_Xls

class ExplodedDoughnutTests: TestCaseBase {
    
    func testExplodedDoughnut() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ExplodedDoughnut.xlsx"
        
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("ExplodedDoughnut")
        
        try self.createChartData(sheet)
        
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_ChartType(ExcelChartType.DoughnutExploded)
        
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(6)
        try chart.set_RightColumn(11)
        try chart.set_BottomRow(29)
        
        try chart.set_DataRange(sheet.get_Range().get_Item("A1:B5"))
        try chart.set_SeriesDataFromRange(false)
        
        try chart.set_ChartTitle("Sales market by country")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        
        for i in try 0..<chart.get_Series().get_Count() {
            let cs = try chart.get_Series().get_Item(i)
            try cs.get_Format().get_Options().set_IsVaryColor(true)
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        }
        
        try chart.get_PlotArea().get_Fill().set_Visible(false)
        try chart.get_Legend().set_Position(LegendPositionType.Top)
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
    
    func createChartData(_ sheet: Worksheet)throws {
        try sheet.get_Range().get_Item("A1").set_Value("Country")
        try sheet.get_Range().get_Item("A2").set_Value("Cuba")
        try sheet.get_Range().get_Item("A3").set_Value("Mexico")
        try sheet.get_Range().get_Item("A4").set_Value("France")
        try sheet.get_Range().get_Item("A5").set_Value("German")
        
        try sheet.get_Range().get_Item("B1").set_Value("Sales")
        try sheet.get_Range().get_Item("B2").set_NumberValue(6000)
        try sheet.get_Range().get_Item("B3").set_NumberValue(8000)
        try sheet.get_Range().get_Item("B4").set_NumberValue(9000)
        try sheet.get_Range().get_Item("B5").set_NumberValue(8500)
        
        try sheet.get_Range().get_Item("A1:B1").set_RowHeight(15)
        try sheet.get_Range().get_Item("A1:B1").get_Style().set_Color(Color.get_DarkGray())
        try sheet.get_Range().get_Item("A1:B1").get_Style().get_Font().set_Color(Color.get_White())
        try sheet.get_Range().get_Item("A1:B1").get_Style().set_VerticalAlignment(VerticalAlignType.Center)
        try sheet.get_Range().get_Item("A1:B1").get_Style().set_HorizontalAlignment(HorizontalAlignType.Center)
        
        try sheet.get_Range().get_Item("B2:B5").get_Style().set_NumberFormat("\"$\"#,##0")
    }
}
