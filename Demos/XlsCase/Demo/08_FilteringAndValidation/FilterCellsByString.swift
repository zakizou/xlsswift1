import XCTest
@testable import Spire_Xls

class FilterCellsByStringTests: TestCaseBase {
    func testFilterCellsByString() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/FilterCellsByString.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FilterCellsByString.xlsx"

        // Get the workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Filter cells data which start with "South"
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).set_Range(sheet.get_Range().get_Item("D1:D19"))
        let filterColumn = try sheet.get_AutoFilters().get_Item(0)
        let strCrt = "South*"
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).CustomFilter(filterColumn, FilterOperatorType.Equal, SpireString(strCrt))
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).Filter()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = "Demo/FilterCellsByString.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
