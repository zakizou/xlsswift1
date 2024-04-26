import XCTest
@testable import Spire_Xls

class SetCommentFillColorTests: TestCaseBase {
    func testSetCommentFillColor() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetCommentFillColor.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Get the default first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create Excel font
        let font = try workbook.CreateFont()
        try font.set_FontName("Arial")
        try font.set_Size(11)
        try font.set_KnownColor(ExcelColors.Orange)

        // Add the comment
        let range = try sheet.get_Range().get_Item("A1") as! CellRange
        try range.get_Comment().set_Text("This is a comment")
        try (range.get_Comment() as! ExcelComment).get_RichText().SetFont(0, Int32(range.get_Comment().get_Text().count - 1), font)

        // Set comment Color
        try range.get_Comment().get_Fill().set_FillType(ShapeFillType.SolidColor)
        try range.get_Comment().get_Fill().set_ForeColor(Color.get_SkyBlue())

        try range.get_Comment().set_Visible(true)
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetCommentFillColor.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
