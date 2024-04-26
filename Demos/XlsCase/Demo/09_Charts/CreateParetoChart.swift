import XCTest
@testable import Spire_Xls

class CreateParetoChartTests: TestCaseBase {
    func testCreateParetoChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ParetoChart.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateParetoChart.xlsx"

        // Create a new excel document
        let workbook = try Workbook()
        // Load an excel document from the file
        try workbook.LoadFromFile(inputFile)
        // Find the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Add chart
        let officeChart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        // Set chart type as Pareto
        try officeChart.set_ChartType(ExcelChartType.Pareto)

        // Set data range in the worksheet
        try officeChart.set_DataRange(sheet.get_Range().get_Item("A2:B8"))

        try officeChart.set_TopRow(1)
        try officeChart.set_BottomRow(19)
        try officeChart.set_LeftColumn(4)
        try officeChart.set_RightColumn(12)
        try officeChart.get_PrimaryCategoryAxis().set_IsBinningByCategory(true)

        try officeChart.get_PrimaryCategoryAxis().set_OverflowBinValue(5)
        try officeChart.get_PrimaryCategoryAxis().set_UnderflowBinValue(1)

        // Formatting Pareto line
        try officeChart.get_Series().get_Item(0).get_ParetoLineFormat().get_LineProperties().set_Color(Color.get_Blue())

        // Gap width settings
        try officeChart.get_Series().get_Item(0).get_DataFormat().get_Options().set_GapWidth(6)

        // Set the chart title
        try officeChart.set_ChartTitle("Expenses")

        // Hiding the legend
        try officeChart.set_HasLegend(false)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // baseLineFile = "Demo/CreateParetoChart.xlsx"
        // Assert.IsTrue(CompareFile.Compare(baseLineFile, outputFile))
    }
}
