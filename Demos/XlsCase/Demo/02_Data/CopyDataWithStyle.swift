import XCTest
@testable import Spire_Xls

class CopyDataWithStyleTests: TestCaseBase {
    func testCopyDataWithStyle() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CopyDataWithStyle.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Get the default first worksheet
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        
        // Set the values for some cells.
        let cells = try worksheet.get_Range().get_Item("A1:J50")
        for i:Int32 in 1...10 {
            for j:Int32 in 1...8 {
                let text = "\(i - 1),\(j - 1)"
                try cells.get_Item(i, j).set_Text(text)
            }
        }
        
        // Get a source range (A1:D3).
        let srcRange = try worksheet.get_Range().get_Item("A1:D3") as! CellRange
        
        // Create a style object.
        let style = try workbook.get_Styles().Add("style")
        
        // Specify the font attribute.
        try style.get_Font().set_FontName("Calibri")
        
        // Specify the shading color.
        try style.get_Font().set_Color(Color.get_Red())
        
        // Specify the border attributes.
        try style.get_Borders().get_Item(BordersLineType.EdgeTop).set_LineStyle(LineStyleType.Thin)
        try style.get_Borders().get_Item(BordersLineType.EdgeTop).set_Color(Color.get_Blue())
        try style.get_Borders().get_Item(BordersLineType.EdgeBottom).set_LineStyle(LineStyleType.Thin)
        try style.get_Borders().get_Item(BordersLineType.EdgeBottom).set_Color(Color.get_Blue())
        try style.get_Borders().get_Item(BordersLineType.EdgeLeft).set_LineStyle(LineStyleType.Thin)
        try style.get_Borders().get_Item(BordersLineType.EdgeLeft).set_Color(Color.get_Blue())
        try style.get_Borders().get_Item(BordersLineType.EdgeRight).set_LineStyle(LineStyleType.Thin)
        try style.get_Borders().get_Item(BordersLineType.EdgeRight).set_Color(Color.get_Blue())
        
        try srcRange.set_CellStyleName(style.get_Name())
        
        // Set the destination range
        let destRange = try worksheet.get_Range().get_Item("A12:D14") as! CellRange
        
        // Copy the range data with style
        try srcRange.Copy(destRange, true, true)
        
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CopyDataWithStyle.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
