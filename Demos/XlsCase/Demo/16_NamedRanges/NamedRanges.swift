import XCTest
@testable import Spire_Xls

class NamedRangesTests: TestCaseBase {
    func testNamedRanges() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/NamedRanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/NamedRanges.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let NamedRange = try workbook.get_NameRanges().Add("NewNamedRange")
        try NamedRange.set_RefersToRange(sheet.get_Range().get_Item("A8:E12"))

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/NamedRanges.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}