import XCTest
@testable import Spire_Xls

class SetPivotFieldFormatTests: TestCaseBase {
    func testSetPivotFieldFormat() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTableExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetPivotFieldFormat.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item("PivotTable") as! Worksheet
        let pt = try sheet.get_PivotTables().get_Item(0) as! XlsPivotTable
        let n = try pt.get_Name()
        print(n)
        let ps = try pt.get_PivotFields()
        print(try ps.get_Count())
        let pf = try ps.get_Item(0)

        try pf.set_SortType(PivotFieldSortType.Ascending)
        try pf.set_SubtotalTop(true)
        try pf.set_Subtotals(SubtotalTypes.Count)
        try pf.set_IsAutoShow(true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetPivotFieldFormat.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

