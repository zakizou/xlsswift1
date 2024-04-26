import XCTest
@testable import Spire_Xls

class ShowSubTotalsTests: TestCaseBase {
    func testShowSubTotals() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ShowSubTotals.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ShowSubTotals.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item("Pivot Table") as! Worksheet
        let pt = try sheet.get_PivotTables().get_Item(0) as! XlsPivotTable

        try pt.set_ShowSubtotals(true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ShowSubTotals.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

