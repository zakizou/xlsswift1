import XCTest
@testable import Spire_Xls

class EditLineChartTests: TestCaseBase {
    
    func testEditLineChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/LineChart.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/EditLineChart.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart
        
        let cs = try chart.get_Series().Add("Added")
        try cs.set_Values(try sheet.get_Range().get_Item("I1:L1"))
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
}
