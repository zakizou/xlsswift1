import XCTest
@testable import Spire_Xls

class RemoveChartTests: TestCaseBase {
    func testRemoveChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveChart.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet from the workbook
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first chart from the first worksheet
        let chart = try sheet.get_Charts().get_Item(0)

        // Remove the chart
        try chart.Remove()

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/RemoveChart.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
