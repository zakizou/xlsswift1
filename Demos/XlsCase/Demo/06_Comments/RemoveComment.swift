import XCTest
@testable import Spire_Xls

class RemoveCommentTests: TestCaseBase {
    func testRemoveComment() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CommentSample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveComment.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get all comments of the first sheet
        let comments = try (workbook.get_Worksheets().get_Item(0) as! Worksheet).get_Comments() as! CommentsCollection
        // Change the content of the first comment
        try comments.get_Item(0).set_Text("This comment has been changed.")
        // Remove the second comment
        try comments.get_Item(1).Remove()
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RemoveComment.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
