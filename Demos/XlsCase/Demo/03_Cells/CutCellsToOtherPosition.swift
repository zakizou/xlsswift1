import XCTest
@testable import Spire_Xls

class CutCellsToOtherPositionTests: TestCaseBase {
    func testCutCellsToOtherPosition() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CutCellsToOtherPosition.xlsx"
        
        // Load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        let Ori = try sheet.get_Range().get_Item("A1:C5") as! CellRange
        let Dest = try sheet.get_Range().get_Item("A26:C30") as! CellRange
        
        // Copy the range to other position
        try sheet.Copy(Ori, Dest, true, true, true)
        
        // Remove all content in original cells
        for cell in try Ori.get_Cells() {
            try cell.ClearAll()
        }
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CutCellsToOtherPosition.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
