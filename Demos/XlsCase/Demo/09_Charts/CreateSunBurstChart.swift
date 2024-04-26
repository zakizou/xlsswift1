import XCTest
@testable import Spire_Xls

class CreateSunBurstChartTests: TestCaseBase {
    
    func testCreateSunBurstChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SunBurst.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateSunBurstChart.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let officeChart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try officeChart.set_ChartType(ExcelChartType.SunBurst)
        try officeChart.set_DataRange(try sheet.get_Range().get_Item("A1:D16"))
        try officeChart.set_TopRow(1)
        try officeChart.set_BottomRow(17)
        try officeChart.set_LeftColumn(6)
        try officeChart.set_RightColumn(14)
        try officeChart.set_ChartTitle("Sales by quarter")
        try officeChart.get_Series().get_Item(0).get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_Size(8)
        try officeChart.set_HasLegend(false)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
}
