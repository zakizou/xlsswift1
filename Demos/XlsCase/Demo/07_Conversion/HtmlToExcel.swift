import XCTest
@testable import Spire_Xls

class HtmlToExcelTests: TestCaseBase {
    func testHtmlToExcel() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/HtmlToExcel.html"
        let outputFile = TestUtil.OutputPath + "Demo/HtmlToExcel.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load html
        try workbook.LoadFromHtml(inputFile)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/HtmlToExcel.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
