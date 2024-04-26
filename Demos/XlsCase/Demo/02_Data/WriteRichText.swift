import XCTest
@testable import Spire_Xls

class WriteRichTextTests: TestCaseBase {
    func testWriteRichText() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WriteRichText.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/WriteRichText.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        let fontBold = try workbook.CreateFont()
        try fontBold.set_IsBold(true)
        
        let fontUnderline = try workbook.CreateFont()
        try fontUnderline.set_Underline(FontUnderlineType.Single)
        
        let fontItalic = try workbook.CreateFont()
        try fontItalic.set_IsItalic(true)
        
        let fontColor = try workbook.CreateFont()
        try fontColor.set_KnownColor(ExcelColors.Green)
        
        let richText = try (sheet.get_Range().get_Item("B11") as! CellRange).get_RichText()
        try richText.set_Text("Bold and underlined and italic and colored text.")
        try richText.SetFont(0, 3, fontBold)
        try richText.SetFont(9, 18, fontUnderline)
        try richText.SetFont(24, 29, fontItalic)
        try richText.SetFont(35, 41, fontColor)
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/WriteRichText.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
