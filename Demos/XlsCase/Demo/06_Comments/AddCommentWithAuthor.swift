import XCTest
@testable import Spire_Xls

class AddCommentWithAuthorTests: TestCaseBase {
    func testAddCommentWithAuthor() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddCommentWithAuthor.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the range that will add comment
        let range = try sheet.get_Range().get_Item("C1") as! CellRange
        
        // Set the author and comment content
        let author = "E-iceblue"
        let text = "This is demo to show how to add a comment with editable Author property."
        
        // Add comment to the range and set properties
        let comment = try range.AddComment() as! ExcelComment
        try comment.set_Width(200)
        try comment.set_Visible(true)
        try comment.set_Text(author + ":\n" + text)
        
        // Set the font of the author
        let font = try workbook.CreateFont()
        try font.set_FontName("Tahoma")
        try font.set_KnownColor(ExcelColors.Black)
        try font.set_IsBold(true)
        try comment.get_RichText().SetFont(0, Int32(author.count), font)
        
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddCommentWithAuthor.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
