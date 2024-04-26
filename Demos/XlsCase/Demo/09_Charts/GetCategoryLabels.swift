import XCTest
@testable import Spire_Xls

class GetCategoryLabelsTests: TestCaseBase {
    func testGetCategoryLabels() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampeB_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetCategoryLabels.txt"
        try File.delete(outputFile)
        
        var sb = [String]()
        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0)
        
        // Get the cell range of the category labels
        let cr = try chart.get_PrimaryCategoryAxis().get_CategoryLabels() as! XlsRange
        for cell in try cr.get_Cells() {
            sb.append(try cell.get_Value())
        }
        
        // Save and launch result file
        try File.appendAllText(outputFile, sb)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetCategoryLabels.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
