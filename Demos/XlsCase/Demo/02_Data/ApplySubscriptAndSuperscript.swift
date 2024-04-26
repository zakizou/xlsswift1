import XCTest
@testable import Spire_Xls

class ApplySubscriptAndSuperscriptTests: TestCaseBase {
    func testApplySubscriptAndSuperscript() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ApplySubscriptAndSuperscript.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()
        
        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        try sheet.get_Range().get_Item("B2").set_Text("This is an example of Subscript:")
        try sheet.get_Range().get_Item("D2").set_Text("This is an example of Superscript:")
        
        // Set the rtf value of "B3" to "R100-0.06".
        let rangeB3 = try sheet.get_Range().get_Item("B3") as! CellRange
        try rangeB3.get_RichText().set_Text("R100-0.06")
        
        // Create a font. Set the IsSubscript property of the font to "true".
        let fontSubscript = try workbook.CreateFont()
        try fontSubscript.set_IsSubscript(true)
        try fontSubscript.set_Color(Color.get_Green())
        
        // Set font for specified range of the text in "B3".
        try rangeB3.get_RichText().SetFont(4, 8, fontSubscript)
        
        // Set the rtf value of "D3" to "a2 + b2 = c2".
        let rangeD3 = try sheet.get_Range().get_Item("D3") as! CellRange
        try rangeD3.get_RichText().set_Text("a2 + b2 = c2")
        
        // Create a font. Set the IsSuperscript property of the font to "true".
        let fontSuperscript = try workbook.CreateFont()
        try fontSuperscript.set_IsSuperscript(true)
        
        // Set font for specified range of the text in "D3".
        try rangeD3.get_RichText().SetFont(1, 1, fontSuperscript)
        try rangeD3.get_RichText().SetFont(6, 6, fontSuperscript)
        try rangeD3.get_RichText().SetFont(11, 11, fontSuperscript)
        
        try sheet.get_AllocatedRange().AutoFitColumns()
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ApplySubscriptAndSuperscript.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
