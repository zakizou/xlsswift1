import XCTest
@testable import Spire_Xls

class ToHtmlTests: TestCaseBase {
    func testToHtml() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToHtml.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToHtml.html"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let options = try HTMLOptions()
        try options.set_ImageEmbedded(true)
        try sheet.SaveToHtml(outputFile)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ToHtml.html"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
