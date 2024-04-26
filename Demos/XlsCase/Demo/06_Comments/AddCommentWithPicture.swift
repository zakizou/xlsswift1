import XCTest
@testable import Spire_Xls

class AddCommentWithPictureTests: TestCaseBase {
    func testAddCommentWithPicture() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Logo.png"
        let outputFile = TestUtil.OutputPath + "Demo/AddCommentWithPicture.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        try sheet.get_Range().get_Item("C6").set_Text("E-iceblue")
        // Add the comment
        let comment = try sheet.get_Range().get_Item("C6").AddComment()
        
        // Load the image file
        let image = try Image.FromFile(inputFile)
        try comment.get_Fill().CustomPicture(image, "logo.png")
        // Set the height and width of comment
        try comment.set_Height(image.get_Height())
        try comment.set_Width(image.get_Width())
        try comment.set_Visible(true)
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddCommentWithPicture.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
