import XCTest
@testable import Spire_Xls

class UseArrayR1C1FormulaTests: TestCaseBase {
    func testUseArrayFormulas() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/UseArrayR1C1Formula.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("A1").set_NumberValue(1)
        try sheet.get_Range().get_Item("A2").set_NumberValue(2)
        try sheet.get_Range().get_Item("A3").set_NumberValue(3)
        try sheet.get_Range().get_Item("B1").set_NumberValue(4)
        try sheet.get_Range().get_Item("B2").set_NumberValue(5)
        try sheet.get_Range().get_Item("B3").set_NumberValue(6)
        try sheet.get_Range().get_Item("C1").set_NumberValue(7)
        try sheet.get_Range().get_Item("C2").set_NumberValue(8)
        try sheet.get_Range().get_Item("C3").set_NumberValue(9)

        try sheet.get_Range().get_Item("B4").set_Text("Sum:")
        try sheet.get_Range().get_Item("B4").get_Style().set_HorizontalAlignment(HorizontalAlignType.Right)
        try sheet.get_Range().get_Item("C4").set_FormulaArrayR1C1("=SUM(R[-3]C[-2]:R[-1]C)")

        try workbook.CalculateAllValue()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/UseArrayR1C1Formula.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
