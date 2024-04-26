import XCTest
@testable import Spire_Xls

class AutofilterBlankTests: TestCaseBase {
    func testAutofilterBlank() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AutofilterBlank.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AutofilterBlank.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Match the blank data
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).MatchBlanks(0)

        // Filter
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).Filter()
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AutofilterBlank.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
