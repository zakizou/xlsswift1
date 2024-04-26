import XCTest
@testable import Spire_Xls

class EditExcelCommentTests: TestCaseBase {
    func testEditExcelComment() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_8.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/EditExcelComment.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()
        
        // Load the file from disk.
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the first comment.
        let comment = try (sheet.get_Comments() as! CommentsCollection).get_Item(0)
        
        // Edit the comment.
        try comment.set_Text("This comment has been edited by Spire.XLS.")
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/EditExcelComment.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
