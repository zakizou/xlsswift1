import XCTest
@testable import Spire_Xls

class AddErrorBarsTests: TestCaseBase {
    func testAddErrorBars() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/AddErrorBars.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        try workbook.CreateEmptySheets(1)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.set_Name("Demo")
        try sheet.get_Range().get_Item("A1").set_Value("Month")
        try sheet.get_Range().get_Item("A2").set_Value("Jan.")
        try sheet.get_Range().get_Item("A3").set_Value("Feb.")
        try sheet.get_Range().get_Item("A4").set_Value("Mar.")
        try sheet.get_Range().get_Item("A5").set_Value("Apr.")
        try sheet.get_Range().get_Item("A6").set_Value("May.")
        try sheet.get_Range().get_Item("A7").set_Value("Jun.")
        try sheet.get_Range().get_Item("B1").set_Value("Planned")
        try sheet.get_Range().get_Item("B2").set_NumberValue(3.3)
        try sheet.get_Range().get_Item("B3").set_NumberValue(2.5)
        try sheet.get_Range().get_Item("B4").set_NumberValue(2.0)
        try sheet.get_Range().get_Item("B5").set_NumberValue(3.7)
        try sheet.get_Range().get_Item("B6").set_NumberValue(4.5)
        try sheet.get_Range().get_Item("B7").set_NumberValue(4.0)
        try sheet.get_Range().get_Item("C1").set_Value("Actual")
        try sheet.get_Range().get_Item("C2").set_NumberValue(3.8)
        try sheet.get_Range().get_Item("C3").set_NumberValue(3.2)
        try sheet.get_Range().get_Item("C4").set_NumberValue(1.7)
        try sheet.get_Range().get_Item("C5").set_NumberValue(3.5)
        try sheet.get_Range().get_Item("C6").set_NumberValue(4.5)
        try sheet.get_Range().get_Item("C7").set_NumberValue(4.3)
        
        // Add a line chart and add percentage error bar to it
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.Line)
        try chart.set_DataRange(sheet.get_Range().get_Item("B1:B7"))
        try chart.set_SeriesDataFromRange(false)
        try chart.set_TopRow(8)
        try chart.set_BottomRow(25)
        try chart.set_LeftColumn(2)
        try chart.set_RightColumn(9)
        try chart.set_ChartTitle("Error Bar 10% Plus")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        let cs1 = try chart.get_Series()[0] as! XlsChartSerie
        try cs1.set_CategoryLabels(sheet.get_Range().get_Item("A2:A7"))
        try cs1.ErrorBar(true, ErrorBarIncludeType.Plus, ErrorBarType.Percentage, 10.0)
        
        // Add a column chart with standard error bars
        let chart2 = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.ColumnClustered)
        try chart2.set_DataRange(sheet.get_Range().get_Item("B1:C7"))
        try chart2.set_SeriesDataFromRange(false)
        try chart2.set_TopRow(8)
        try chart2.set_BottomRow(25)
        try chart2.set_LeftColumn(10)
        try chart2.set_RightColumn(17)
        try chart2.set_ChartTitle("Standard Error Bar")
        try chart2.get_ChartTitleArea().set_IsBold(true)
        try chart2.get_ChartTitleArea().set_Size(12)
        let cs2 = try chart2.get_Series()[0] as! XlsChartSerie
        try cs2.set_CategoryLabels(sheet.get_Range().get_Item("A2:A7"))
        try cs2.ErrorBar(true, ErrorBarIncludeType.Minus, ErrorBarType.StandardError, 0.3)
        let cs3 = try chart2.get_Series()[1] as! XlsChartSerie
        try cs3.ErrorBar(true, ErrorBarIncludeType.Both, ErrorBarType.StandardError, 0.5)
        
        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddErrorBars.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
