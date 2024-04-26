import XCTest
@testable import Spire_Xls

class InsertHtmlStringIntoCellTests: TestCaseBase {

    func testInsertHtmlStringIntoCell() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/InsertHtmlStringIntoCell.xlsx"

        // Create a workbook and worksheet
        let workbook = try Workbook()
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set HTML string to cell A1
        let htmlCode = "<div>first line<br>second line<br>third line</div>"
        try worksheet.get_Range().get_Item("A1").set_HtmlString(htmlCode)

        // Save the workbook and dispose of resources
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
}
