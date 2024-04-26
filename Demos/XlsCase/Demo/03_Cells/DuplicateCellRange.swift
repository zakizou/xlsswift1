import XCTest
@testable import Spire_Xls

class DuplicateCellRangeTests: TestCaseBase {
    func testDuplicateCellRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DuplicateCellRange.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the file from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Copy data from source range to destination range and maintain the format
        try sheet.Copy(sheet.get_Range().get_Item("A6:F6") as! CellRange, sheet.get_Range().get_Item("A16:F16") as! CellRange, true)
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DuplicateCellRange.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
