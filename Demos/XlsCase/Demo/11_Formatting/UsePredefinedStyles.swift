import XCTest
@testable import Spire_Xls

class UsePredefinedStylesTests: TestCaseBase {

    func testUsePredefinedStyles() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/UsePredefinedStyles.xlsx"

        let workbook = try Workbook()

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create a new style
        let style = try workbook.get_Styles().Add("newStyle")
        try style.get_Font().set_FontName("Calibri")
        try style.get_Font().set_IsBold(true)
        try style.get_Font().set_Size(15)
        try style.get_Font().set_Color(Color.get_CornflowerBlue())

        // Get "B5" cell
        let range = try sheet.get_Range().get_Item("B5")
        try range.set_Text("Welcome to use Spire.XLS")
        try range.set_CellStyleName(style.get_Name())
        try range.AutoFitColumns()

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/UsePredefinedStyles.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
