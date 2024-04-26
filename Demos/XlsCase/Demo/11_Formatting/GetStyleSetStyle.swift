import XCTest
@testable import Spire_Xls

class GetStyleSetStyleTests: TestCaseBase {

    func testGetStyleSetStyle() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/templateAz.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetStyleSetStyle.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load an Excel document
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get "B4" cell
        let range = try sheet.get_Range().get_Item("B4")

        // Get the style of cell
        var style = try range.get_Style()
        try style.get_Font().set_FontName("Calibri")
        try style.get_Font().set_IsBold(true)
        try style.get_Font().set_Size(15)
        try style.get_Font().set_Color(Color.get_CornflowerBlue())

        try range.set_Style(style)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/GetStyleSetStyle.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
