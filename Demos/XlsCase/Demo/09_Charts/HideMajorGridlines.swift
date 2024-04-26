import XCTest
@testable import Spire_Xls

class HideMajorGridlinesTests: TestCaseBase {
    func testHideMajorGridlines() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampeB_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideMajorGridlines.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0)

        // Hide major gridlines
        try chart.get_PrimaryValueAxis().set_HasMajorGridLines(false)

        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/HideMajorGridlines.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
