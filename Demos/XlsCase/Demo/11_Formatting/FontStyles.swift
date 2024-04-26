import XCTest
@testable import Spire_Xls

class FontStylesTests: TestCaseBase {
    func testFontStyles() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/FontStyles.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FontStyles.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set font style
        try sheet.get_Range().get_Item("B1").get_Style().get_Font().set_FontName("Comic Sans MS")
        try sheet.get_Range().get_Item("B2:D2").get_Style().get_Font().set_FontName("Corbel")
        try sheet.get_Range().get_Item("B3:D7").get_Style().get_Font().set_FontName("Aleo")

        // Set font size
        try sheet.get_Range().get_Item("B1").get_Style().get_Font().set_Size(45)
        try sheet.get_Range().get_Item("B2:D3").get_Style().get_Font().set_Size(25)
        try sheet.get_Range().get_Item("B3:D7").get_Style().get_Font().set_Size(12)

        // Set excel cell data to be bold
        try sheet.get_Range().get_Item("B2:D2").get_Style().get_Font().set_IsBold(true)

        // Set excel cell data to be underline
        try sheet.get_Range().get_Item("B3:B7").get_Style().get_Font().set_Underline(FontUnderlineType.Single)

        // Set excel cell data color
        try sheet.get_Range().get_Item("B1").get_Style().get_Font().set_Color(Color.get_CornflowerBlue())
        try sheet.get_Range().get_Item("B2:D2").get_Style().get_Font().set_Color(Color.get_CadetBlue())
        try sheet.get_Range().get_Item("B3:D7").get_Style().get_Font().set_Color(Color.get_Firebrick())

        // Set excel cell data to be italic
        try sheet.get_Range().get_Item("B3:D7").get_Style().get_Font().set_IsItalic(true)

        // Add strikethrough
        try sheet.get_Range().get_Item("D3").get_Style().get_Font().set_IsStrikethrough(true)
        try sheet.get_Range().get_Item("D7").get_Style().get_Font().set_IsStrikethrough(true)

        // Save and launch
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FontStyles.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
