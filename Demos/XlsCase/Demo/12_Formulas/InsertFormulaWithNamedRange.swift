import XCTest
@testable import Spire_Xls

class InsertFormulaWithNamedRangeTests: TestCaseBase {
    func testInsertFormulaWithNamedRange() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/InsertFormulaWithNamedRange.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("A1").set_Value("1")
        try sheet.get_Range().get_Item("A2").set_Value("1")

        let namedRange = try workbook.get_NameRanges().Add("NewNamedRange")
        try namedRange.set_NameLocal("=SUM(A1+A2)")

        try sheet.get_Range().get_Item("C1").set_Formula("NewNamedRange")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/InsertFormulaWithNamedRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
