import XCTest
@testable import Spire_Xls

class FormatARowTests: TestCaseBase {

    func testFormatARow() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/FormatARow.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create a new style
        let style = try workbook.get_Styles().Add("newStyle")

        // Set the vertical alignment of the text
        try style.set_VerticalAlignment(VerticalAlignType.Center)

        // Set the horizontal alignment of the text
        try style.set_HorizontalAlignment(HorizontalAlignType.Center)

        // Set the font color of the text
        try style.get_Font().set_Color(Color.get_Blue())

        // Shrink the text to fit in the cell
        try style.set_ShrinkToFit(true)

        // Set the bottom border color of the cell to OrangeRed
        try style.get_Borders().get_Item(BordersLineType.EdgeBottom).set_Color(Color.get_OrangeRed())

        // Set the bottom border type of the cell to Dotted
        try style.get_Borders().get_Item(BordersLineType.EdgeBottom).set_LineStyle(LineStyleType.Dotted)

        // Apply the style to the second row
        try sheet.get_Rows().get_Item(1).set_CellStyleName(style.get_Name())

        try sheet.get_Rows().get_Item(1).set_Text("Test")

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FormatARow.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
