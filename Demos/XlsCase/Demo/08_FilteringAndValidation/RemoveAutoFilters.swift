import XCTest
@testable import Spire_Xls

class RemoveAutoFiltersTests: TestCaseBase {
    func testRemoveAutoFilters() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/RemoveAutoFilters.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveAutoFilters.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Remove the auto filters
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).Clear()

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/RemoveAutoFilters.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
