import XCTest
@testable import Spire_Xls

class CreateWaterfallChartTests: TestCaseBase {
    
    func testCreateWaterfallChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WaterfallChart.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateWaterfallChart.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let officeChart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try officeChart.set_ChartType(ExcelChartType.WaterFall)
        try officeChart.set_DataRange(try sheet.get_Range().get_Item("A2:B8"))
        try officeChart.set_TopRow(1)
        try officeChart.set_BottomRow(19)
        try officeChart.set_LeftColumn(4)
        try officeChart.set_RightColumn(12)
        try (officeChart.get_Series().get_Item(0).get_DataPoints().get_Item(3) as! XlsChartDataPoint).set_SetAsTotal(true)
        try (officeChart.get_Series().get_Item(0).get_DataPoints().get_Item(6) as! XlsChartDataPoint).set_SetAsTotal(true)
        try officeChart.get_Series().get_Item(0).get_Format().set_ShowConnectorLines(true)
        try officeChart.set_ChartTitle("WaterFall Chart")
        try officeChart.get_Series().get_Item(0).get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
        try officeChart.get_Series().get_Item(0).get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_Size(8)
        try officeChart.get_Legend().set_Position(LegendPositionType.Right)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
}
