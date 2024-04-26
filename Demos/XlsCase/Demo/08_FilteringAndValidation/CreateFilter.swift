import XCTest
@testable import Spire_Xls

class CreateFilterTests: TestCaseBase {
    func testCreateFilter() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CreateFilter.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CreateFilter.xlsx"
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Create filter
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).set_Range(sheet.get_Range().get_Item("A1:J1"))

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateFilter.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
