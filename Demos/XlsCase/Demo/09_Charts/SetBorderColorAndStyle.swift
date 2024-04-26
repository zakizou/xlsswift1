import XCTest
@testable import Spire_Xls

class SetBorderColorAndStyleTests: TestCaseBase {
    func testSetBorderColorAndStyle() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample3.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetBorderColorAndStyle.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet from workbook and then get the first chart from the worksheet
        let ws = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try (ws.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Set CustomLineWeight property for Series line
        try (chart.get_Series().get_Item(0).get_DataPoints().get_Item(0).get_DataFormat().get_LineProperties() as! XlsChartBorder).set_CustomLineWeight(2.5)
        // Set color property for Series line
        try (chart.get_Series().get_Item(0).get_DataPoints().get_Item(0).get_DataFormat().get_LineProperties() as! XlsChartBorder).set_Color(Color.get_Red())

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetBorderColorAndStyle.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
