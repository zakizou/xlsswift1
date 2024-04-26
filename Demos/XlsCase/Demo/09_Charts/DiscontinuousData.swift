import XCTest
@testable import Spire_Xls

class DiscontinuousDataTests: TestCaseBase {
    
    func testDiscontinuousData() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DiscontinuousData.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DiscontinuousData.xlsx"
        
        let book = try Workbook()
        try book.LoadFromFile(inputFile)
        let sheet = try book.get_Worksheets().get_Item(0) as! Worksheet
        
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.ColumnClustered)
        try chart.set_SeriesDataFromRange(false)
        try chart.set_LeftColumn(1)
        try chart.set_TopRow(10)
        try chart.set_RightColumn(10)
        try chart.set_BottomRow(24)
        
        let cs1 = try chart.get_Series().Add()
        try cs1.set_Name(try sheet.get_Range().get_Item("B1").get_Value())
        try cs1.set_CategoryLabels(try (sheet.get_Range().get_Item("A2:A3") as! CellRange).AddCombinedRange(try (sheet.get_Range().get_Item("A5:A6")) as! CellRange).AddCombinedRange(try sheet.get_Range().get_Item("A8:A9") as! CellRange))
        try cs1.set_Values(try (sheet.get_Range().get_Item("B2:B3") as! CellRange).AddCombinedRange(try (sheet.get_Range().get_Item("B5:B6")) as! CellRange).AddCombinedRange(try sheet.get_Range().get_Item("B8:B9") as! CellRange))
        try cs1.set_SerieType(ExcelChartType.ColumnClustered)
        
        let cs2 = try chart.get_Series().Add()
        try cs2.set_Name(try sheet.get_Range().get_Item("C1").get_Value())
        try cs2.set_CategoryLabels(try (sheet.get_Range().get_Item("A2:A3") as! CellRange).AddCombinedRange(try (sheet.get_Range().get_Item("A5:A6")) as! CellRange).AddCombinedRange(try sheet.get_Range().get_Item("A8:A9") as! CellRange))
        try cs2.set_Values(try (sheet.get_Range().get_Item("C2:C3") as! CellRange).AddCombinedRange(try (sheet.get_Range().get_Item("C5:C6")) as! CellRange).AddCombinedRange(try sheet.get_Range().get_Item("C8:C9") as! CellRange))
        try cs2.set_SerieType(ExcelChartType.ColumnClustered)
        
        try chart.set_ChartTitle("Chart")
        try chart.get_ChartTitleArea().get_Font().set_Size(20)
        try chart.get_ChartTitleArea().set_Color(Color.get_Black())
        
        try chart.get_PrimaryValueAxis().set_HasMajorGridLines(false)
        
        try book.SaveToFile(outputFile, ExcelVersion.Version2010)
        try book.Dispose()
    }
}
