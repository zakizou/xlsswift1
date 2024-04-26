import XCTest
@testable import Spire_Xls

class WorkbookToHTMLTests: TestCaseBase {

    func testWorkbookToHTML() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorkbookToHTML.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/WorkbookToHTML.html"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        // Convert to html
        try workbook.SaveToHtml(outputFile)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/WorkbookToHTML.html"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
