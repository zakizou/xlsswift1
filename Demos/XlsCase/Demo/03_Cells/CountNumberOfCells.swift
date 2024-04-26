import XCTest
@testable import Spire_Xls

class CountNumberOfCellsTests: TestCaseBase {
    func testCountNumberOfCells() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CountNumberOfCells.txt"
        try File.delete(outputFile)
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the file from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        var content = [String]()
        
        // Get the number of cells
        content.append("Number of Cells: \(try sheet.get_Cells().get_Count())")
        
        // Save to file
        try File.appendAllText(outputFile, [content.joined(separator: "\n")])
        
        // Check data in txt
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CountNumberOfCells.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
