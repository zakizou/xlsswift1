import XCTest
@testable import Spire_Xls

class SetCommentTextRotationTests: TestCaseBase {
    func testSetCommentTextRotation() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CellValues.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetCommentTextRotation.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the default first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create Excel font
        let font = try workbook.CreateFont()
        try font.set_FontName("Arial")
        try font.set_Size(11)
        try font.set_KnownColor(ExcelColors.Orange)

        // Add the comment
        let range = try sheet.get_Range().get_Item("E1") as! CellRange
        try range.get_Comment().set_Text("This is a comment")
        try (range.get_Comment() as! ExcelComment).get_RichText().SetFont(0, Int32(range.get_Comment().get_Text().count) - 1, font)

        // Set its vertical and horizontal alignment
        try range.get_Comment().set_VAlignment(CommentVAlignType.Center)
        try range.get_Comment().set_HAlignment(CommentHAlignType.Right)

        // Set the comment text rotation
        try range.get_Comment().set_TextRotation(TextRotationType.LeftToRight)
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetCommentTextRotation.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
