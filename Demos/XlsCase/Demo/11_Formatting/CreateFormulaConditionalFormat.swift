import XCTest
@testable import Spire_Xls

class CreateFormulaConditionalFormatTests: TestCaseBase {
    func testCreateFormulaConditionalFormat() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_6.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateFormulaConditionalFormat.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let range = try sheet.get_Columns().get_Item(0)

        let xcfs = try sheet.get_ConditionalFormats().Add()
        try xcfs.AddRange(range)
        let conditional = try xcfs.AddCondition()
        try conditional.set_FormatType(ConditionalFormatType.Formula)
        try conditional.set_FirstFormula("=($A1<$B1)")
        try conditional.set_BackKnownColor(ExcelColors.Yellow)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateFormulaConditionalFormat.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
