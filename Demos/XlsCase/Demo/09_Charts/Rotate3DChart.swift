import XCTest
@testable import Spire_Xls

class Rotate3DChartTests: TestCaseBase {
    func testRotate3DChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample3.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/Rotate3DChart.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the chart from the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try sheet.get_Charts().get_Item(0)

        // X rotation:
        try chart.set_Rotation(30)
        // Y rotation:
        try chart.set_Elevation(20)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/Rotate3DChart.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
