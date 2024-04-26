import XCTest
@testable import Spire_Xls

class ForegroundAndBackgroundTests: TestCaseBase {

    func testForegroundAndBackground() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ForegroundAndBackground.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.set_Version(ExcelVersion.Version2010)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create a new style
        let style1 = try workbook.get_Styles().Add("newStyle1")

        // Set filling pattern type
        try style1.get_Interior().set_FillPattern(ExcelPatternType.Gradient)

        // Set filling Background color
        try style1.get_Interior().get_Gradient().set_BackKnownColor(ExcelColors.Green)

        // Set filling Foreground color
        try style1.get_Interior().get_Gradient().set_ForeKnownColor(ExcelColors.Yellow)

        // Set gradient fill style
        try style1.get_Interior().get_Gradient().set_GradientStyle(GradientStyleType.From_Center)

        // Apply the style to "B2" cell
        try sheet.get_Range().get_Item("B2").set_CellStyleName(style1.get_Name())
        try sheet.get_Range().get_Item("B2").set_Text("Test")
        try sheet.get_Range().get_Item("B2").set_RowHeight(30)
        try sheet.get_Range().get_Item("B2").set_ColumnWidth(50)

        // Create a new style
        let style2 = try workbook.get_Styles().Add("newStyle2")

        // Set filling pattern type
        try style2.get_Interior().set_FillPattern(ExcelPatternType.Gradient)

        // Set filling Foreground color
        try style2.get_Interior().get_Gradient().set_ForeKnownColor(ExcelColors.Red)

        // Apply the style to "B4" cell
        try sheet.get_Range().get_Item("B4").set_CellStyleName(style2.get_Name())
        try sheet.get_Range().get_Item("B4").set_RowHeight(30)
        try sheet.get_Range().get_Item("B4").set_ColumnWidth(60)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ForegroundAndBackground.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
