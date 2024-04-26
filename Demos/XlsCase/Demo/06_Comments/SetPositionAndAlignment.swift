import XCTest
@testable import Spire_Xls

class SetPositionAndAlignmentTests: TestCaseBase {
    func testSetPositionAndAlignment() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetPositionAndAlignment.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set two font styles which will be used in comments
        let font1 = try workbook.CreateFont()
        try font1.set_FontName("Calibri")
        try font1.set_Color(Color.get_Firebrick())
        try font1.set_IsBold(true)
        try font1.set_Size(12)
        let font2 = try workbook.CreateFont()
        try font2.set_FontName("Calibri")
        try font2.set_Color(Color.get_Blue())
        try font2.set_Size(12)
        try font2.set_IsBold(true)

        // Add comment 1 and set its size, text, position and alignment
        try sheet.get_Range().get_Item("G5").set_Text("Spire.XLS")
        let comment1 = try (sheet.get_Range().get_Item("G5") as! CellRange).get_Comment() as! ExcelComment
        try comment1.set_IsVisible(true)
        try comment1.set_Height(150)
        try comment1.set_Width(300)
        try comment1.get_RichText().set_Text("Spire.XLS for .Net:\nStandalone Excel component to meet your needs for conversion, data manipulation, charts in workbook etc. ")
        try comment1.get_RichText().SetFont(0, 19,font1)
        try comment1.set_TextRotation(TextRotationType.LeftToRight)
        // Set the position of Comment
        try comment1.set_Top(20)
        try comment1.set_Left(40)
        // Set the alignment of text in Comment
        try comment1.set_VAlignment(CommentVAlignType.Center)
        try comment1.set_HAlignment(CommentHAlignType.Justify)

        // Add comment2 and set its size, text, position and alignment for comparison
        try sheet.get_Range().get_Item("D14").set_Text("E-iceblue")
        let comment2 = try (sheet.get_Range().get_Item("D14") as! CellRange).get_Comment() as! ExcelComment
        try comment2.set_IsVisible(true)
        try comment2.set_Height(150)
        try comment2.set_Width(300)
        try comment2.get_RichText().set_Text("About E-iceblue: \nWe focus on providing excellent office components for developers to operate Word, Excel, PDF, and PowerPoint documents.")
        try comment2.set_TextRotation(TextRotationType.LeftToRight)
        try comment2.get_RichText().SetFont(0, 16, font2)
        // Set the position of Comment
        try comment2.set_Top(170)
        try comment2.set_Left(450)
        // Set the alignment of text in Comment
        try comment2.set_VAlignment(CommentVAlignType.Top)
        try comment2.set_HAlignment(CommentHAlignType.Justify)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetPositionAndAlignment.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
