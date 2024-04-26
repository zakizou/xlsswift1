import XCTest
@testable import Spire_Xls

class ReadFormulasTests: TestCaseBase {
    func testReadFormulas() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadFormulas.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ReadFormulas.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let formula = try sheet.get_Range().get_Item("C14").get_Formula()
        let value = String(try sheet.get_Range().get_Item("C14").get_FormulaNumberValue())

        try File.appendText(outputFile, "Formula：\(formula)\r\nValue：\(value)")
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ReadFormulas.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
