import XCTest
@testable import Spire_Xls

class SetAndFormatDataLabelTests: TestCaseBase {
    func testSetAndFormatDataLabel() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetAndFormatDataLabel.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        try workbook.CreateEmptySheets(1)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.set_Name("Demo")
        try sheet.get_Range().get_Item("A1").set_Value("Month")
        try sheet.get_Range().get_Item("A2").set_Value("Jan")
        try sheet.get_Range().get_Item("A3").set_Value("Feb")
        try sheet.get_Range().get_Item("A4").set_Value("Mar")
        try sheet.get_Range().get_Item("A5").set_Value("Apr")
        try sheet.get_Range().get_Item("A6").set_Value("May")
        try sheet.get_Range().get_Item("A7").set_Value("Jun")
        try sheet.get_Range().get_Item("B1").set_Value("Peter")
        try sheet.get_Range().get_Item("B2").set_NumberValue(25)
        try sheet.get_Range().get_Item("B3").set_NumberValue(18)
        try sheet.get_Range().get_Item("B4").set_NumberValue(8)
        try sheet.get_Range().get_Item("B5").set_NumberValue(13)
        try sheet.get_Range().get_Item("B6").set_NumberValue(22)
        try sheet.get_Range().get_Item("B7").set_NumberValue(28)

        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.LineMarkers)
        try chart.set_DataRange(sheet.get_Range().get_Item("B1:B7"))
        try chart.get_PlotArea().set_Visible(false)
        try chart.set_SeriesDataFromRange(false)
        try chart.set_TopRow(5)
        try chart.set_BottomRow(26)
        try chart.set_LeftColumn(2)
        try chart.set_RightColumn(11)
        try chart.set_ChartTitle("Data Labels Demo")
        try chart.get_ChartTitleArea().set_IsBold(true)
        try chart.get_ChartTitleArea().set_Size(12)
        let cs1 = try chart.get_Series().get_Item(0)
        try cs1.set_CategoryLabels(sheet.get_Range().get_Item("A2:A7"))

        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasLegendKey(false)
        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasPercentage(false)
        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasSeriesName(true)
        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasCategoryName(true)
        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_Delimiter(". ")

        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_Size(9)
        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_Color(Color.get_Red())
        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_FontName("Calibri")
        try cs1.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_Position(DataLabelPositionType.Center)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetAndFormatDataLabel.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
