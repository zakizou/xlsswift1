import XCTest
@testable import Spire_Xls

class ChartAxisTitleTests: TestCaseBase {
    func testChartAxisTitle() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampeB_5.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChartAxisTitle.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0)

        // Set axis title
        try chart.get_PrimaryCategoryAxis().set_Title("Category Axis")
        try chart.get_PrimaryValueAxis().set_Title("Value axis")

        // Set font size
        try chart.get_PrimaryCategoryAxis().get_Font().set_Size(12)
        try chart.get_PrimaryValueAxis().get_Font().set_Size(12)

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChartAxisTitle.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
