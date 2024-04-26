import XCTest
@testable import Spire_Xls

class AjustBarSpaceTests: TestCaseBase {
    func testAjustBarSpace() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AjustBarSpace.xlsx"

        // Create a workbook and load from file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet from workbook and then get the first chart from the worksheet
        let ws = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try (ws.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Adjust the space between bars
        for cs in try chart.get_Series() {
            let csFormat = try cs.get_Format()
            try csFormat.get_Options().set_GapWidth(200)
            try csFormat.get_Options().set_Overlap(0)
        }

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AjustBarSpace.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
