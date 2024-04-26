import XCTest
@testable import Spire_Xls

class AddTrendlineTests: TestCaseBase {
    func testAddTrendline() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddTrendline.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Select chart and set logarithmic trendline
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart
        try chart.set_ChartTitle("Logarithmic Trendline")
        try chart.get_Series()[0]!.get_TrendLines().Add(TrendLineType.Logarithmic)
        
        // Select chart and set moving_average trendline
        let chart1 = try sheet.get_Charts().get_Item(1) as! Chart
        try chart1.set_ChartTitle("Moving Average Trendline")
        try chart1.get_Series()[0]!.get_TrendLines().Add(.Moving_Average)
        
        // Select chart and set linear trendline
        let chart2 = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(2) as! Chart
        try chart2.set_ChartTitle("Linear Trendline")
        try chart2.get_Series()[0]!.get_TrendLines().Add(TrendLineType.Linear)
        
        // Select chart and set exponential trendline
        let chart3 = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(3) as! Chart
        try chart3.set_ChartTitle("Exponential Trendline")
        try chart3.get_Series()[0]!.get_TrendLines().Add(TrendLineType.Exponential)
        
        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddTrendline.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
