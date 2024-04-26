import XCTest
@testable import Spire_Xls

class SetFontForTitleAndAxisTests: TestCaseBase {
    func testSetFontForTitleAndAxis() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetFontForTitleAndAxis.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Set font for chart title and chart axis
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try (worksheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        // Format the font for the chart title
        try chart.get_ChartTitleArea().set_Color(Color.get_Blue())
        try chart.get_ChartTitleArea().set_Size(20.0)

        // Format the font for the chart Axis
        try chart.get_PrimaryValueAxis().get_Font().set_Color(Color.get_Gold())
        try chart.get_PrimaryValueAxis().get_Font().set_Size(10.0)
        try chart.get_PrimaryCategoryAxis().get_Font().set_Color(Color.get_Red())
        try chart.get_PrimaryCategoryAxis().get_Font().set_Size(20.0)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetFontForTitleAndAxis.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
