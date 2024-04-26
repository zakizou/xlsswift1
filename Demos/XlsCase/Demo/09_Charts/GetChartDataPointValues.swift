import XCTest
@testable import Spire_Xls

class GetChartDataPointValuesTests: TestCaseBase {
    func testGetChartDataPointValues() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartToImage.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetChartDataPointValues.txt"
        try File.delete(outputFile)
        
        var sb = [String]()
        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart
        
        // Get the first series of the chart
        let cs = try chart.get_Series().get_Item(0)
        
        for cr in try (cs.get_Values() as! XlsRange).get_Cells() {
            sb.append(try cr.get_RangeAddress())
            
            // Get the data point value
            sb.append("The value of the data point is \(try cr.get_Value())")
        }
        
        // Save and launch result file
        try File.appendAllText(outputFile, sb)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetChartDataPointValues.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
