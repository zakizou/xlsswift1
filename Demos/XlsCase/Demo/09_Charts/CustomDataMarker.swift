import XCTest
@testable import Spire_Xls

class CustomDataMarkerTests: TestCaseBase {
    
    func testCustomDataMarker() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CustomDataMarker.xlsx"
        
        let workbook = try Workbook()
        try workbook.CreateEmptySheets(1)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Demo")
        try sheet.get_Range().get_Item("A1").set_Value("Tom")
        try sheet.get_Range().get_Item("A2").set_NumberValue(1.5)
        try sheet.get_Range().get_Item("A3").set_NumberValue(2.1)
        try sheet.get_Range().get_Item("A4").set_NumberValue(3.6)
        try sheet.get_Range().get_Item("A5").set_NumberValue(5.2)
        try sheet.get_Range().get_Item("A6").set_NumberValue(7.3)
        try sheet.get_Range().get_Item("A7").set_NumberValue(3.1)
        try sheet.get_Range().get_Item("B1").set_Value("Kitty")
        try sheet.get_Range().get_Item("B2").set_NumberValue(2.5)
        try sheet.get_Range().get_Item("B3").set_NumberValue(4.2)
        try sheet.get_Range().get_Item("B4").set_NumberValue(1.3)
        try sheet.get_Range().get_Item("B5").set_NumberValue(3.2)
        try sheet.get_Range().get_Item("B6").set_NumberValue(6.2)
        try sheet.get_Range().get_Item("B7").set_NumberValue(4.7)
        
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.ScatterMarkers)
        try chart.set_DataRange(try sheet.get_Range().get_Item("A1:B7"))
        try chart.get_PlotArea().set_Visible(false)
        try chart.set_SeriesDataFromRange(false)
        try chart.set_TopRow(5)
        try chart.set_BottomRow(22)
        try chart.set_LeftColumn(4)
        try chart.set_RightColumn(11)
        try chart.set_ChartTitle("Chart with Markers")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(10)
        
        let cs1 = try chart.get_Series().get_Item(0)
        try cs1.get_DataFormat().set_MarkerBackgroundColor(Color.get_RoyalBlue())
        try cs1.get_DataFormat().set_MarkerForegroundColor(Color.get_WhiteSmoke())
        try cs1.get_DataFormat().set_MarkerSize(7)
        try cs1.get_DataFormat().set_MarkerStyle(ChartMarkerType.PlusSign)
        try cs1.get_DataFormat().set_MarkerTransparencyValue(0.8)
        
        let cs2 = try chart.get_Series().get_Item(1)
        try cs2.get_DataFormat().set_MarkerBackgroundColor(Color.get_Pink())
        try cs2.get_DataFormat().set_MarkerSize(9)
        try cs2.get_DataFormat().set_MarkerStyle(ChartMarkerType.Triangle)
        try cs2.get_DataFormat().set_MarkerTransparencyValue(0.9)
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
    }
}
