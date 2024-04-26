import XCTest
@testable import Spire_Xls

class HideOrShowCommentTests: TestCaseBase {
    func testHideOrShowComment() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CommentSample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideOrShowComment.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Hide the second comment
        try (sheet.get_Comments() as! CommentsCollection).get_Item(1).set_IsVisible(false)
        
        // Show the third comment
        try (sheet.get_Comments() as! CommentsCollection).get_Item(2).set_IsVisible(true)
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/HideOrShowComment.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
