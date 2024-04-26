import XCTest
@testable import Spire_Xls

class CreateHistogramChartTests: TestCaseBase {
    func testCreateHistogramChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/HistogramChart.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateHistogramChart.xlsx"

        // Create a new excel document
        let workbook = try Workbook()
        // Load an excel document from the file
        try workbook.LoadFromFile(inputFile)
        // Find the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Add a new chart
        let officeChart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        // Set chart type as histogram
        try officeChart.set_ChartType(ExcelChartType.Histogram)

        // Set data range in the worksheet
        try officeChart.set_DataRange(sheet.get_Range().get_Item("A1:A15"))
        try officeChart.set_TopRow(1)
        try officeChart.set_BottomRow(19)
        try officeChart.set_LeftColumn(4)
        try officeChart.set_RightColumn(12)

        // Category axis bin settings
        try officeChart.get_PrimaryCategoryAxis().set_BinWidth(8)

        // Gap width settings
        try (officeChart.get_Series().get_Item(0)).get_DataFormat().get_Options().set_GapWidth(6)

        // Set the chart title and axis title
        try officeChart.set_ChartTitle("Height Data")
        try officeChart.get_PrimaryValueAxis().set_Title("Number of students")
        try officeChart.get_PrimaryCategoryAxis().set_Title("Height")

        // Hiding the legend
        try officeChart.set_HasLegend(false)

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // baseLineFile = "Demo/CreateHistogramChart.xlsx"
        // Assert.IsTrue(CompareFile.Compare(baseLineFile, outputFile))
    }
}
