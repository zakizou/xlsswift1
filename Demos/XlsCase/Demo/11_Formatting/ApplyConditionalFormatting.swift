import XCTest
@testable import Spire_Xls

class ApplyConditionalFormattingTests: TestCaseBase {
    func testApplyConditionalFormatting() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ApplyConditionalFormatting.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("A1").set_NumberValue(582)
        try sheet.get_Range().get_Item("A2").set_NumberValue(234)
        try sheet.get_Range().get_Item("A3").set_NumberValue(314)
        try sheet.get_Range().get_Item("A4").set_NumberValue(50)
        try sheet.get_Range().get_Item("B1").set_NumberValue(150)
        try sheet.get_Range().get_Item("B2").set_NumberValue(894)
        try sheet.get_Range().get_Item("B3").set_NumberValue(560)
        try sheet.get_Range().get_Item("B4").set_NumberValue(900)
        try sheet.get_Range().get_Item("C1").set_NumberValue(134)
        try sheet.get_Range().get_Item("C2").set_NumberValue(700)
        try sheet.get_Range().get_Item("C3").set_NumberValue(920)
        try sheet.get_Range().get_Item("C4").set_NumberValue(450)
        try sheet.get_AllocatedRange().set_RowHeight(15)
        try sheet.get_AllocatedRange().set_ColumnWidth(17)

        let xcfs1 = try sheet.get_ConditionalFormats().Add()
        try xcfs1.AddRange(sheet.get_AllocatedRange())
        let format1 = try xcfs1.AddCondition()
        try format1.set_FormatType(ConditionalFormatType.CellValue)
        try format1.set_FirstFormula("800")
        try format1.set_Operator(ComparisonOperatorType.Greater)
        try format1.set_FontColor(Color.get_Red())
        try format1.set_BackColor(Color.get_LightSalmon())

        let xcfs2 = try sheet.get_ConditionalFormats().Add()
        try xcfs2.AddRange(sheet.get_AllocatedRange())
        let format2 = try xcfs2.AddCondition()
        try format2.set_FormatType(ConditionalFormatType.CellValue)
        try format2.set_FirstFormula("300")
        try format2.set_Operator(ComparisonOperatorType.Less)
        try format2.set_FontColor(Color.get_Green())
        try format2.set_BackColor(Color.get_LightBlue())

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ApplyConditionalFormatting.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
