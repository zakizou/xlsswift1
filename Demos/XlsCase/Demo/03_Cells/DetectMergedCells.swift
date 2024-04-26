import XCTest
@testable import Spire_Xls

class DetectMergedCellsTests: TestCaseBase {
    func testDetectMergedCells() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DetectMergedCells.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the file from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the merged cell ranges in the first worksheet and put them into a CellRange array
        let range = try sheet.get_MergedCells()
        
        // Traverse through the array and unmerge the merged cells
        for cell in range {
            try cell.UnMerge()
        }
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DetectMergedCells.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
