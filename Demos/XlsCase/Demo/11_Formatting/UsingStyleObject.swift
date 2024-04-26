import XCTest
@testable import Spire_Xls

class UsingStyleObjectTests: TestCaseBase {

    func testUsingStyleObject() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/UsingStyleObject.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Add a new worksheet to the Excel object
        let sheet = try workbook.get_Worksheets().Add("new sheet")

        // Access the "B1" cell from the worksheet
        let cell = try sheet.get_Range().get_Item("B1")

        // Add some value to the "B1" cell
        try cell.set_Text("Hello Spire!")

        // Create a new style
        let style = try workbook.get_Styles().Add("newStyle")

        // Set the vertical alignment of the text in the "B1" cell
        try style.set_VerticalAlignment(VerticalAlignType.Center)

        // Set the horizontal alignment of the text in the "B1" cell
        try style.set_HorizontalAlignment(HorizontalAlignType.Center)

        // Set the font color of the text in the "B1" cell
        try style.get_Font().set_Color(Color.get_Blue())

        // Shrink the text to fit in the cell
        try style.set_ShrinkToFit(true)

        // Set the bottom border color of the cell to GreenYellow
        try style.get_Borders().get_Item(BordersLineType.EdgeBottom).set_Color(Color.get_GreenYellow())

        // Set the bottom border type of the cell to Medium
        try style.get_Borders().get_Item(BordersLineType.EdgeBottom).set_LineStyle(LineStyleType.Medium)

        // Assign the Style object to the "B1" cell
        try cell.set_Style(style)

        // Apply the same style to some other cells
        try sheet.get_Range().get_Item("B4").set_Style(style)
        try sheet.get_Range().get_Item("B4").set_Text("Test")
        try sheet.get_Range().get_Item("C3").set_CellStyleName(style.get_Name())
        try sheet.get_Range().get_Item("C3").set_Text("Welcome to use Spire.XLS")
        try sheet.get_Range().get_Item("D4").set_Style(style)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/UsingStyleObject.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
