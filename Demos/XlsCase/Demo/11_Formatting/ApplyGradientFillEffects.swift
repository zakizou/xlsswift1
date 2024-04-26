import XCTest
@testable import Spire_Xls

class ApplyGradientFillEffectsTests: TestCaseBase {
    func testApplyGradientFillEffects() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ApplyGradientFillEffects.xlsx"

        let workbook = try Workbook()
        try workbook.set_Version(ExcelVersion.Version2010)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let range = try sheet.get_Range().get_Item("B5") as! CellRange
        try range.set_RowHeight(50)
        try range.set_ColumnWidth(30)
        try range.set_Text("Hello")

        let style = try range.get_Style() as! CellStyle
        try style.set_HorizontalAlignment(HorizontalAlignType.Center)
        let interior = try style.get_Interior() as! ExcelInterior
        try interior.set_FillPattern(ExcelPatternType.Gradient)
        try range.get_Style().get_Interior().get_Gradient().set_ForeColor(Color.FromArgb(255, 255, 255))
        try range.get_Style().get_Interior().get_Gradient().set_BackColor(Color.FromArgb(79, 129, 189))
        try range.get_Style().get_Interior().get_Gradient().TwoColorGradient(GradientStyleType.Horizontal, GradientVariantsType.ShadingVariants1)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ApplyGradientFillEffects.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
