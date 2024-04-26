import XCTest
@testable import Spire_Xls

class SetLegendBackgroundColorTests: TestCaseBase {
    func testSetLegendBackgroundColor() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetLegendBackgroundColor.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let ws = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try (ws.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        let x = try chart.get_Legend().get_FrameFormat() as! XlsChartFrameFormat
        try x.get_Fill().set_FillType(ShapeFillType.SolidColor)
        try x.set_ForeGroundColor(Color.get_SkyBlue())

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetLegendBackgroundColor.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
