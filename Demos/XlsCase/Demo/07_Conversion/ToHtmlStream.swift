import XCTest
@testable import Spire_Xls

class ToHtmlStreamTests: TestCaseBase {
    func testToHtmlStream() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadImages.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToHtmlStream.html"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Set the HTML options
        let options = try HTMLOptions()
        try options.set_ImageEmbedded(true)
        
        // Save sheet to HTML stream
        let fileStream = try Stream(outputFile)
        try sheet.SaveToHtml(fileStream, options)
        try fileStream.Close()
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ToHtmlStream.html"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
