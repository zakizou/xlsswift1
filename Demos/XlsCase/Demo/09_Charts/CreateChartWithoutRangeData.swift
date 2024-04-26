import XCTest
@testable import Spire_Xls

class CreateChartWithoutRangeDataTests: TestCaseBase {
    func testCreateChartWithoutRangeData() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CreateChartWithoutRangeData.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add a chart to the worksheet
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try chart.set_ChartTitle("Sample Chart")

        // Add a series to the chart
        let series = try chart.get_Series().Add()

        // Add data
        try series.set_EnteredDirectlyValues([SpireInt32(10), SpireInt32(20), SpireInt32(30)])
        let values = try series.get_EnteredDirectlyValues()
        print(try SpireInt32(values[0]).Value())

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateChartWithoutRangeData.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
