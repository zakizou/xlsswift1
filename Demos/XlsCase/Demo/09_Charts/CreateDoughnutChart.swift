import XCTest
@testable import Spire_Xls

class CreateDoughnutChartTests: TestCaseBase {
    func testCreateDoughnutChart() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CreateDoughnutChart.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Insert data
        try sheet.get_Range().get_Item("A1").set_Value("Country")
        try sheet.get_Range().get_Item("A1").get_Style().get_Font().set_IsBold(true)
        try sheet.get_Range().get_Item("A2").set_Value("Cuba")
        try sheet.get_Range().get_Item("A3").set_Value("Mexico")
        try sheet.get_Range().get_Item("A4").set_Value("France")
        try sheet.get_Range().get_Item("A5").set_Value("German")
        try sheet.get_Range().get_Item("B1").set_Value("Sales")
        try sheet.get_Range().get_Item("B1").get_Style().get_Font().set_IsBold(true)
        try sheet.get_Range().get_Item("B2").set_NumberValue(6000)
        try sheet.get_Range().get_Item("B3").set_NumberValue(8000)
        try sheet.get_Range().get_Item("B4").set_NumberValue(9000)
        try sheet.get_Range().get_Item("B5").set_NumberValue(8500)
        
        // Add a new chart, set chart type as doughnut
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_ChartType(ExcelChartType.Doughnut)
        try chart.set_DataRange(sheet.get_Range().get_Item("A1:B5"))
        try chart.set_SeriesDataFromRange(false)
        
        // Set position of chart
        try chart.set_LeftColumn(4)
        try chart.set_TopRow(2)
        try chart.set_RightColumn(12)
        try chart.set_BottomRow(22)
        
        // Chart title
        try chart.set_ChartTitle("Market share by country")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        
        for cs in try chart.get_Series() {
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasPercentage(true)
        }
        
        try chart.get_Legend().set_Position(LegendPositionType.Top)
        
        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateDoughnutChart.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
