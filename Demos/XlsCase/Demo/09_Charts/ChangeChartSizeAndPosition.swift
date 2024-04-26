import XCTest
@testable import Spire_Xls

class ChangeChartSizeAndPositionTests: TestCaseBase {
    func testChangeChartSizeAndPosition() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampeB_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChangeChartSizeAndPosition.xlsx"

        // Create a workbook and load from file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0)

        // Change chart size
        try chart.set_Width(600)
        try chart.set_Height(500)

        // Change chart position
        try chart.set_LeftColumn(3)
        try chart.set_TopRow(7)

        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChangeChartSizeAndPosition.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
