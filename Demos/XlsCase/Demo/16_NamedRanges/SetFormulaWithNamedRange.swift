import XCTest
@testable import Spire_Xls

class SetFormulaWithNamedRangeTests: TestCaseBase {
    func testSetFormulaWithNamedRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetFormulaWithNamedRange.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let NamedRange = try workbook.get_NameRanges().Add("MyNamedRange")
        try NamedRange.set_RefersToRange(sheet.get_Range().get_Item("B10:B12"))
        try sheet.get_Range().get_Item("B13").set_Formula("=SUM(MyNamedRange)")
        try sheet.get_Range().get_Item("B10").set_Value2(SpireInt32(10))
        try sheet.get_Range().get_Item("B11").set_Value2(SpireInt32(20))
        try sheet.get_Range().get_Item("B12").set_Value2(SpireInt32(30))

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetFormulaWithNamedRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}