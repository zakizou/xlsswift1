import XCTest
@testable import Spire_Xls

class ConditionalFormatRuntimeTests: TestCaseBase {
    func testConditionalFormatRuntime() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ConditionalFormatRuntime.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ConditionalFormatRuntime.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try _addComparisonRule1(sheet)
        try _addComparisonRule2(sheet)
        try _addComparisonRule3(sheet)
        try _addComparisonRule4(sheet)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ConditionalFormatRuntime.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }

    func _addComparisonRule1(_ sheet: Worksheet)throws {
        let xcfs1 = try! sheet.get_ConditionalFormats().Add()
        try! xcfs1.AddRange(sheet.get_Range().get_Item("A1:D1"))
        let cf1 = try! xcfs1.AddCondition()
        try cf1.set_FormatType(ConditionalFormatType.CellValue)
        try cf1.set_FirstFormula("150")
        try cf1.set_Operator(ComparisonOperatorType.Greater)
        try cf1.set_FontColor(Color.get_Red())
        try cf1.set_BackColor(Color.get_LightBlue())
    }

    func _addComparisonRule2(_ sheet: Worksheet)throws {
        let xcfs2 = try! sheet.get_ConditionalFormats().Add()
        try! xcfs2.AddRange(sheet.get_Range().get_Item("A2:D2"))
        let cf2 = try! xcfs2.AddCondition()
        try cf2.set_FormatType(ConditionalFormatType.CellValue)
        try cf2.set_FirstFormula("500")
        try cf2.set_Operator(ComparisonOperatorType.Less)
        try cf2.set_LeftBorderColor(Color.get_Pink())
        try cf2.set_RightBorderColor(Color.get_Pink())
        try cf2.set_TopBorderColor(Color.get_DeepSkyBlue())
        try cf2.set_BottomBorderColor(Color.get_DeepSkyBlue())
        try cf2.set_LeftBorderStyle(LineStyleType.Medium)
        try cf2.set_RightBorderStyle(LineStyleType.Thick)
        try cf2.set_TopBorderStyle(LineStyleType.Double)
        try cf2.set_BottomBorderStyle(LineStyleType.Double)
    }

    func _addComparisonRule3(_ sheet: Worksheet)throws {
        let xcfs1 = try! sheet.get_ConditionalFormats().Add()
        try! xcfs1.AddRange(sheet.get_Range().get_Item("A3:D3"))
        let cf1 = try! xcfs1.AddCondition()
        try cf1.set_FormatType(ConditionalFormatType.CellValue)
        try cf1.set_FirstFormula("300")
        try cf1.set_SecondFormula("500")
        try cf1.set_Operator(ComparisonOperatorType.Between)
        try cf1.set_BackColor(Color.get_Yellow())
    }

    func _addComparisonRule4(_ sheet: Worksheet)throws {
        let xcfs1 = try! sheet.get_ConditionalFormats().Add()
        try! xcfs1.AddRange(sheet.get_Range().get_Item("A4:D4"))
        let cf1 = try! xcfs1.AddCondition()
        try cf1.set_FormatType(ConditionalFormatType.CellValue)
        try cf1.set_FirstFormula("100")
        try cf1.set_SecondFormula("200")
        try cf1.set_Operator(ComparisonOperatorType.NotBetween)
        try cf1.set_FillPattern(ExcelPatternType.DarkDownwardDiagonal)
        try cf1.set_Color(Color.FromArgb(255, 255, 0))
        try cf1.set_BackColor(Color.FromArgb(0, 255, 255))
    }
}
