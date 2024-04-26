import XCTest
@testable import Spire_Xls

class CloneExcelFontStyleTests: TestCaseBase {
    func testCloneExcelFontStyle() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CloneExcelFontStyle.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()
        
        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        
        // Add the text to the Excel sheet cell range A1.
        try sheet.get_Range().get_Item("A1").set_Text("Text1")
        
        // Set A1 cell range's CellStyle.
        let style = try workbook.get_Styles().Add("style")
        try style.get_Font().set_FontName("Calibri")
        try style.get_Font().set_Color(Color.get_Red())
        try style.get_Font().set_Size(12)
        try style.get_Font().set_IsBold(true)
        try style.get_Font().set_IsItalic(true)
        try sheet.get_Range().get_Item("A1").set_CellStyleName(style.get_Name())
        
        // Clone the same style for B2 cell range.
        let csOrieign = try style.clone()
        try sheet.get_Range().get_Item("B2").set_Text("Text2")
        try sheet.get_Range().get_Item("B2").set_CellStyleName(csOrieign.get_Name())
        
        // Clone the same style for C3 cell range and then reset the font color for the text.
        let csGreen = try style.clone()
        try csGreen.get_Font().set_Color(Color.get_Green())
        try sheet.get_Range().get_Item("C3").set_Text("Text3")
        try sheet.get_Range().get_Item("C3").set_CellStyleName(csGreen.get_Name())
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CloneExcelFontStyle.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
