import XCTest
@testable import Spire_Xls

class ToTextTests: TestCaseBase {

    func testToText() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ConversionSample2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ExceltoTxt.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet in excel workbook
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.SaveToFile(outputFile, " ", Encoding.get_UTF8())
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ExceltoTxt.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
