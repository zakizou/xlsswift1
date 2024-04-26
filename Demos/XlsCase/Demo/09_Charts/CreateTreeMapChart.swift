import XCTest
@testable import Spire_Xls

class CreateTreeMapChartTests: TestCaseBase {
    
    func testCreateTreeMapChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/TreeMap.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateTreeMapChart.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let officeChart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add()
        try officeChart.set_ChartType(ExcelChartType.TreeMap)
        try officeChart.set_DataRange(try sheet.get_Range().get_Item("A2:C11"))
        try officeChart.set_TopRow(1)
        try officeChart.set_BottomRow(19)
        try officeChart.set_LeftColumn(4)
        try officeChart.set_RightColumn(14)
        try officeChart.set_ChartTitle("Area by countries")
        try officeChart.get_Series().get_Item(0).get_DataFormat().set_TreeMapLabelOption(ExcelTreeMapLabelOption.Banner)
        try officeChart.get_Series().get_Item(0).get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_Size(8)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
}
