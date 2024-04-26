import XCTest
@testable import Spire_Xls

class EmptyCellTests: TestCaseBase {
    func testEmptyCell() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/EmptyCell.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the file from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Set the value as null to remove the original content from the Excel Cell
        try sheet.get_Range().get_Item("C6").set_Value("")
        
        // Clear the contents to remove the original content from the Excel Cell
        try (sheet.get_Range().get_Item("B6") as! XlsRange).ClearContents()
        
        // Remove the contents with format from the Excel cell
        try (sheet.get_Range().get_Item("D6") as! XlsRange).ClearAll()
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/EmptyCell.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
