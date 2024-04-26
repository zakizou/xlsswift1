import XCTest
@testable import Spire_Xls

class SetNumberFormatOfTrendlineTests: TestCaseBase {
    func testSetNumberFormatOfTrendline() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetNumberFormatOfTrendline.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the chart from the first worksheet
        let chart = try ((workbook.get_Worksheets().get_Item(0) as! Worksheet).get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Get the trendline of the chart and then extract the equation of the trendline
        let trendLine = try chart.get_Series().get_Item(1).get_TrendLines().get_Item(0)

        // Set the number format of trendLine to "#,##0.00"
        try trendLine.get_DataLabel().set_NumberFormat("#,##0.00")

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetNumberFormatOfTrendline.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
