import XCTest
@testable import Spire_Xls

class ChangeSeriesColorTests: TestCaseBase {
    func testChangeSeriesColor() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChangeSeriesColor.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChangeSeriesColor.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the first chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Get the second series
        let cs = try chart.get_Series()[1]!

        // Set the fill type
        try cs.get_Format().get_Fill().set_FillType(ShapeFillType.SolidColor)

        // Change the fill color
        try cs.get_Format().get_Fill().set_ForeColor(Color.get_Orange())

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChangeSeriesColor.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
