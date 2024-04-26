import XCTest
@testable import Spire_Xls

class FilterCellsByCellColorTests: TestCaseBase {
    func testFilterCellsByCellColor() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_3.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FilterCellsByCellColor.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the file from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Create an auto filter in the sheet and specify the range to be filtered
        try sheet.get_AutoFilters().set_Range(sheet.get_Range().get_Item("G1:G19"))
        
        // Get the column to be filtered
        let filterColumn = try sheet.get_AutoFilters().get_Item(0)
        
        // Add a color filter to filter the column based on cell color
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).AddFillColorFilter(filterColumn, Color.get_Red())
        
        // Filter the data
        try (sheet.get_AutoFilters() as! AutoFiltersCollection).Filter()
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FilterCellsByCellColor.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
