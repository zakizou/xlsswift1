import XCTest
@testable import Spire_Xls

class ExtractTrendlineTests: TestCaseBase {
    func testExtractTrendline() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ExtractTrendline.txt"
        try File.delete(outputFile)
        
        // Create a workbook and load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Get the chart from the first worksheet
        let chart = try (workbook.get_Worksheets().get_Item(0) as! Worksheet).get_Charts().get_Item(0) as! Chart
        
        // Get the trendline of the chart and then extract the equation of the trendline
        let trendLine = try chart.get_Series().get_Item(1).get_TrendLines().get_Item(0)
        let formula = try trendLine.get_Formula()
        var sb = [String]()
        sb.append("The equation is: " + formula)
        
        // Save to Text file
        try File.appendAllText(outputFile, [sb.joined(separator: "\n")])
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ExtractTrendline.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
