import XCTest
@testable import Spire_Xls

class CreateFunnelChartTests: TestCaseBase {
    func testCreateFunnelChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Funnel.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateFunnelChart.xlsx"

        // Create a new excel document
        let workbook = try Workbook()
        // Load an excel document from the file
        try workbook.LoadFromFile(inputFile)
        // Find the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Add a new chart
        let officeChart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        // Set chart type as Funnel
        try officeChart.set_ChartType(ExcelChartType.Funnel)

        // Set data range in the worksheet
        try officeChart.set_DataRange(sheet.get_Range().get_Item("A1:B6"))

        // Set the chart title
        try officeChart.set_ChartTitle("Funnel")

        // Formatting the legend and data label option
        try officeChart.set_HasLegend(false)
        try (officeChart.get_Series()[0]! as! XlsChartSerie).get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        try (officeChart.get_Series()[0]! as! XlsChartSerie).get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_Size(8)

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // baseLineFile = "Demo/CreateFunnelChart.xlsx"
        // Assert.IsTrue(CompareFile.Compare(baseLineFile, outputFile))
    }
}
