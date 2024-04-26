import XCTest
@testable import Spire_Xls

class SetFontTests: TestCaseBase {
    func testSetFont() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SetFont.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetFont.xlsx"

        // Load a Workbook from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Create a font
        let font = try workbook.CreateFont()
        try font.set_Size(15.0)
        try font.set_Color(Color.get_LightSeaGreen())

        for cs in try chart.get_Series() {
            // Set font
            try ((cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels() as! XlsChartDataLabels).get_TextArea() as! XlsChartDataLabelArea).SetFont(font)
        }

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetFont.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
