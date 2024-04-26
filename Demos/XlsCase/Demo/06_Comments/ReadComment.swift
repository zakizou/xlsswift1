import XCTest
@testable import Spire_Xls

class ReadCommentTests: TestCaseBase {
    func testReadComment() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadComment.xls"
        let outputFile = TestUtil.OutputPath + "Demo/ReadComment.txt"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        var builder = [String]()
        
        builder.append(try sheet.get_Range().get_Item("A1").get_Comment().get_Text() + "\n\t")
        
        builder.append(try ((sheet.get_Range().get_Item("A2") as! CellRange).get_Comment() as! ExcelComment).get_RichText().get_RtfText())
        
        try File.appendAllText(outputFile, builder)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ReadComment.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
