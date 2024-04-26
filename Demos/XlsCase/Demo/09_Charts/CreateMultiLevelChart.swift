import XCTest
@testable import Spire_Xls

class CreateMultiLevelChartTests: TestCaseBase {
    func testCreateMultiLevelChart() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CreateMultiLevelChart.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Write data to cells
        try sheet.get_Range().get_Item("A1").set_Text("Main Category")
        try sheet.get_Range().get_Item("A2").set_Text("Fruit")
        try sheet.get_Range().get_Item("A6").set_Text("Vegies")
        try sheet.get_Range().get_Item("B1").set_Text("Sub Category")
        try sheet.get_Range().get_Item("B2").set_Text("Bananas")
        try sheet.get_Range().get_Item("B3").set_Text("Oranges")
        try sheet.get_Range().get_Item("B4").set_Text("Pears")
        try sheet.get_Range().get_Item("B5").set_Text("Grapes")
        try sheet.get_Range().get_Item("B6").set_Text("Carrots")
        try sheet.get_Range().get_Item("B7").set_Text("Potatoes")
        try sheet.get_Range().get_Item("B8").set_Text("Celery")
        try sheet.get_Range().get_Item("B9").set_Text("Onions")
        try sheet.get_Range().get_Item("C1").set_Text("Value")
        try sheet.get_Range().get_Item("C2").set_Value("52")
        try sheet.get_Range().get_Item("C3").set_Value("65")
        try sheet.get_Range().get_Item("C4").set_Value("50")
        try sheet.get_Range().get_Item("C5").set_Value("45")
        try sheet.get_Range().get_Item("C6").set_Value("64")
        try sheet.get_Range().get_Item("C7").set_Value("62")
        try sheet.get_Range().get_Item("C8").set_Value("89")
        try sheet.get_Range().get_Item("C9").set_Value("57")

        // Vertically merge cells from A2 to A5, A6 to A9
        try sheet.get_Range().get_Item("A2:A5").Merge()
        try sheet.get_Range().get_Item("A6:A9").Merge()
        try sheet.AutoFitColumn(1)
        try sheet.AutoFitColumn(2)

        // Add a clustered bar chart to worksheet
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.BarClustered)
        try chart.set_ChartTitle("Value")
        try chart.get_PlotArea().get_Fill().set_FillType(ShapeFillType.NoFill)
        try chart.get_Legend().Delete()
        try chart.set_LeftColumn(5)
        try chart.set_TopRow(1)
        try chart.set_RightColumn(14)

        // Set the data source of series data
        try chart.set_DataRange(sheet.get_Range().get_Item("C2:C9"))
        try chart.set_SeriesDataFromRange(false)
        // Set the data source of category labels
        let serie = try chart.get_Series().get_Item(0)
        try serie.set_CategoryLabels(sheet.get_Range().get_Item("A2:B9"))
        // Show multi-level category labels
        try chart.get_PrimaryCategoryAxis().set_MultiLevelLable(true)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // baseLineFile = TestUtil.BaseLinePath + "Demo/CreateMultiLevelChart.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
