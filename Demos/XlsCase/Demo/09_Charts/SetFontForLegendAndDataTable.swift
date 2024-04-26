import XCTest
@testable import Spire_Xls

class SetFontForLegendAndDataTableTests: TestCaseBase {
    func testSetFontForLegendAndDataTable() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetFontForLegendAndDataTable.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet from workbook
        let ws = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try (ws.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Create a font with specified size and color
        let font = try workbook.CreateFont()
        try font.set_Size(14.0)
        try font.set_Color(Color.get_Red())

        // Apply the font to chart Legend
        try chart.get_Legend().get_TextArea().SetFont(font)

        // Apply the font to chart DataLabel
        for cs in try chart.get_Series() {
            try ((cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels() as! XlsChartDataLabels).get_TextArea() as! XlsChartDataLabelArea).SetFont(font)
        }

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetFontForLegendAndDataTable.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
