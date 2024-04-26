import XCTest
@testable import Spire_Xls

class CopyCellsRangeTests: TestCaseBase {
    func testCopyCellsRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CreateTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopyCellsRange.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet1 = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        
        // Specify a destination range
        let cells = try sheet1.get_Range().get_Item("G1:H19") as! CellRange
        
        // Copy the selected range to destination range
        try (sheet1.get_Range().get_Item("B1:C19") as! CellRange).Copy(cells)
        
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CopyCellsRange.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
