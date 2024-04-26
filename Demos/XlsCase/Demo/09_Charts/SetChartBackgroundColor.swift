import XCTest
@testable import Spire_Xls

class SetChartBackgroundColorTests: TestCaseBase {
    func testSetChartBackgroundColor() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetChartBackgroundColor.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet from workbook and then get the first chart from the worksheet
        let ws = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try (ws.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Set background color
        try chart.get_ChartArea().set_ForeGroundColor(Color.get_LightYellow())

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetChartBackgroundColor.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
