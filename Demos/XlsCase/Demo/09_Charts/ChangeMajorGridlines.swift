import XCTest
@testable import Spire_Xls

class ChangeMajorGridlinesTests: TestCaseBase {
    func testChangeMajorGridlines() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampeB_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChangeMajorGridlines.xlsx"

        // Create a workbook and load from file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0)

        // Change the color of major gridlines
        try chart.get_PrimaryValueAxis().get_MajorGridLines().get_LineProperties().set_Color(Color.get_Red())

        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChangeMajorGridlines.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
