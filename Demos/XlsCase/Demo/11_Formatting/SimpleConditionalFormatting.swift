import XCTest
@testable import Spire_Xls

class SimpleConditionalFormattingTests: TestCaseBase {

    func testSimpleConditionalFormatting() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ConditionalFormatting.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SimpleConditionalFormatting.xlsx"

        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let oldSheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try self.addConditionalFormattingForExistingSheet(oldSheet)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SimpleConditionalFormatting.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }

    func addConditionalFormattingForExistingSheet(_ sheet: Worksheet) throws {
        try sheet.get_AllocatedRange().set_RowHeight(15)
        try sheet.get_AllocatedRange().set_ColumnWidth(16)

        // Create conditional formatting rule 1
        let xcfs1 = try sheet.get_ConditionalFormats().Add()
        try xcfs1.AddRange(sheet.get_Range().get_Item("A1:D1"))
        let cf1 = try xcfs1.AddCondition()
        try cf1.set_FormatType(ConditionalFormatType.CellValue)
        try cf1.set_FirstFormula("150")
        try cf1.set_Operator(ComparisonOperatorType.Greater)
        try cf1.set_FontColor(Color.get_Red())
        try cf1.set_BackColor(Color.get_LightBlue())

        // Create conditional formatting rule 2
        let xcfs2 = try sheet.get_ConditionalFormats().Add()
        try xcfs2.AddRange(sheet.get_Range().get_Item("A2:D2"))
        let cf2 = try xcfs2.AddCondition()
        try cf2.set_FormatType(ConditionalFormatType.CellValue)
        try cf2.set_FirstFormula("300")
        try cf2.set_Operator(ComparisonOperatorType.Less)
        // Set border color
        try cf2.set_LeftBorderColor(Color.get_Pink())
        try cf2.set_RightBorderColor(Color.get_Pink())
        try cf2.set_TopBorderColor(Color.get_DeepSkyBlue())
        try cf2.set_BottomBorderColor(Color.get_DeepSkyBlue())
        try cf2.set_LeftBorderStyle(LineStyleType.Medium)
        try cf2.set_RightBorderStyle(LineStyleType.Thick)
        try cf2.set_TopBorderStyle(LineStyleType.Double)
        try cf2.set_BottomBorderStyle(LineStyleType.Double)

        // Create conditional formatting rule 3 (Data Bars)
        let xcfs3 = try sheet.get_ConditionalFormats().Add()
        try xcfs3.AddRange(sheet.get_Range().get_Item("A3:D3"))
        let cf3 = try xcfs3.AddCondition()
        try cf3.set_FormatType(ConditionalFormatType.DataBar)
        try cf3.get_DataBar().set_BarColor(Color.get_CadetBlue())

        // Create conditional formatting rule 4 (Icon Sets)
        let xcfs4 = try sheet.get_ConditionalFormats().Add()
        try xcfs4.AddRange(sheet.get_Range().get_Item("A4:D4"))
        let cf4 = try xcfs4.AddCondition()
        try cf4.set_FormatType(ConditionalFormatType.IconSet)
        try cf4.get_IconSet().set_IconSetType(IconSetType.ThreeTrafficLights1)

        // Create conditional formatting rule 5 (Color Scales)
        let xcfs5 = try sheet.get_ConditionalFormats().Add()
        try xcfs5.AddRange(sheet.get_Range().get_Item("A5:D5"))
        let cf5 = try xcfs5.AddCondition()
        try cf5.set_FormatType(ConditionalFormatType.ColorScale)

        // Highlight duplicate values in range "A6:D6" with BurlyWood color
        let xcfs6 = try sheet.get_ConditionalFormats().Add()
        try xcfs6.AddRange(sheet.get_Range().get_Item("A6:D6"))
        let cf6 = try xcfs6.AddCondition()
        try cf6.set_FormatType(ConditionalFormatType.DuplicateValues)
        try cf6.set_BackColor(Color.get_BurlyWood())
    }
}
