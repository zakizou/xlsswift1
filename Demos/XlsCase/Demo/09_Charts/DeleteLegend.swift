import XCTest
@testable import Spire_Xls

class DeleteLegendTests: TestCaseBase {
    
    func testDeleteLegend() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DeleteLegend.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try sheet.get_Charts().get_Item(0)
        
        // Delete the first and second legend entries from the chart
        try chart.get_Legend().get_LegendEntries().get_Item(0).Delete()
        try chart.get_Legend().get_LegendEntries().get_Item(1).Delete()
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
    }
}
