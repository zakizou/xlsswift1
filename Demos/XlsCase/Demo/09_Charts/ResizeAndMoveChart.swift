import XCTest
@testable import Spire_Xls

class ResizeAndMoveChartTests: TestCaseBase {
    func testResizeAndMoveChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ResizeAndMoveChart.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the chart from the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try sheet.get_Charts().get_Item(0)

        // Set position of the chart
        try chart.set_LeftColumn(5)
        try chart.set_TopRow(1)

        // Resize the chart
        try chart.set_Width(500)
        try chart.set_Height(350)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ResizeAndMoveChart.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
