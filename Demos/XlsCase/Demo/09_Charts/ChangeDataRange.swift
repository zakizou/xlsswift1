import XCTest
@testable import Spire_Xls

class ChangeDataRangeTests: TestCaseBase {
    func testChangeDataRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampeB_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ChangeDataRange.xlsx"

        // Create a workbook and load from file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get chart
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0)

        // Change data range
        try chart.set_DataRange(sheet.get_Range().get_Item("A1:C4"))

        // Save and launch result file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ChangeDataRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
