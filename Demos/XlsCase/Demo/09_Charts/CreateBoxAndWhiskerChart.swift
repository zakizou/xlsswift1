import XCTest
@testable import Spire_Xls

class CreateBoxAndWhiskerChartTests: TestCaseBase {
    func testCreateBoxAndWhiskerChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/BoxAndWhiskerChart.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/BoxAndWhiskerChart.xlsx"

        // Create a new excel document
        let workbook = try Workbook()
        // Load an excel document from the file
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Add a new chart
        let officeChart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add() as! Chart
        // Set the chart title
        try officeChart.set_ChartTitle("Yearly Vehicle Sales")

        // Set chart type as Box and Whisker
        try officeChart.set_ChartType(ExcelChartType.BoxAndWhisker)

        // Set data range in the worksheet
        try officeChart.set_DataRange(try sheet.get_Range().get_Item("A1:E17"))

        // Box and Whisker settings on first series
        let seriesA = try officeChart.get_Series().get_Item(0) as! ChartSerie
        try seriesA.get_DataFormat().set_ShowInnerPoints(false)
        try seriesA.get_DataFormat().set_ShowOutlierPoints(true)
        try seriesA.get_DataFormat().set_ShowMeanMarkers(true)
        try seriesA.get_DataFormat().set_ShowMeanLine(false)
        try seriesA.get_DataFormat().set_QuartileCalculationType(ExcelQuartileCalculation.ExclusiveMedian)

        // Box and Whisker settings on second series
        let seriesB = try officeChart.get_Series().get_Item(1) as! ChartSerie
        try seriesB.get_DataFormat().set_ShowInnerPoints(false)
        try seriesB.get_DataFormat().set_ShowOutlierPoints(true)
        try seriesB.get_DataFormat().set_ShowMeanMarkers(true)
        try seriesB.get_DataFormat().set_ShowMeanLine(false)
        try seriesB.get_DataFormat().set_QuartileCalculationType(ExcelQuartileCalculation.InclusiveMedian)

        // Box and Whisker settings on third series
        let seriesC = try officeChart.get_Series().get_Item(2) as! ChartSerie
        try seriesC.get_DataFormat().set_ShowInnerPoints(false)
        try seriesC.get_DataFormat().set_ShowOutlierPoints(true)
        try seriesC.get_DataFormat().set_ShowMeanMarkers(true)
        try seriesC.get_DataFormat().set_ShowMeanLine(false)
        try seriesC.get_DataFormat().set_QuartileCalculationType(ExcelQuartileCalculation.ExclusiveMedian)

        // Save and Launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = "Demo/BoxAndWhiskerChart.xlsx"
        // XCTAssertTrue(CompareFile.Compare(baseLineFile, outputFile))
    }
}
