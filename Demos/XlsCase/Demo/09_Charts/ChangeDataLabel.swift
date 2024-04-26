import XCTest
@testable import Spire_Xls

class ChangeDataLabelTests: TestCaseBase {
    func testChangeDataLabel() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChangeDataLabel.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChangeDataLabel.xlsx"

        // Create a workbook and load from file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Change data label of the first datapoint of the first series
        try (chart.get_Series()[0]!.get_DataPoints() as! XlsChartDataPointsCollection).get_Item(0).get_DataLabels().set_Text("changed data label")

        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChangeDataLabel.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
