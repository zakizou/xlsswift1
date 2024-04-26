import XCTest
@testable import Spire_Xls

class WriteCommentTests: TestCaseBase {
    func testWriteComment() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WriteComment.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/WriteComment.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create fonts
        let font = try workbook.CreateFont()
        try font.set_FontName("Arial")
        try font.set_Size(11)
        try font.set_KnownColor(ExcelColors.Orange)
        let fontBlue = try workbook.CreateFont()
        try fontBlue.set_KnownColor(ExcelColors.LightBlue)
        let fontGreen = try workbook.CreateFont()
        try fontGreen.set_KnownColor(ExcelColors.LightGreen)

        var range = try sheet.get_Range().get_Item("B11")
        try range.set_Text("Regular comment")
        try range.get_Comment().set_Text("Regular comment")
        try range.AutoFitColumns()

        // Regular comment

        range = try sheet.get_Range().get_Item("B12") as! CellRange
        try range.set_Text("Rich text comment")
        try range.get_RichText().SetFont(0, 16, font)
        try range.AutoFitColumns()

        // Rich text comment
        try (range.get_Comment() as! ExcelComment).get_RichText().set_Text("Rich text comment")
        try (range.get_Comment() as! ExcelComment).get_RichText().SetFont(0, 4, fontGreen)
        try (range.get_Comment() as! ExcelComment).get_RichText().SetFont(5, 9, fontBlue)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2007)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/WriteComment.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
