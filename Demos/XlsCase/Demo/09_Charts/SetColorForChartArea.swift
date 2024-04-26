import XCTest
@testable import Spire_Xls

class SetColorForChartAreaTests: TestCaseBase {
    func testSetColorForChartArea() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampeB_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetColorForChartArea.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the chart
        let chart = try sheet.get_Charts().get_Item(0)

        // Set color for chart area
        try chart.get_ChartArea().get_Fill().set_ForeColor(Color.get_LightSeaGreen())

        // Set color for plot area
        try chart.get_PlotArea().get_Fill().set_ForeColor(Color.get_LightGray())

        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetColorForChartArea.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
