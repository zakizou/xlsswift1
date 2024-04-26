import XCTest
@testable import Spire_Xls

class AccessCellTests: TestCaseBase {
    func testAccessCell() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AccessCell.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AccessCell.txt"
        try File.delete(outputFile)
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        
        var builder = [String]()
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Access cell by its name
        let range1 = try sheet.get_Range().get_Item("A1")
        try builder.append("Value of range1: " + range1.get_Text())
        
        // Access cell by index of row and column
        let range2 = try sheet.get_Range().get_Item(2, 1)
        try builder.append("Value of range2: " + range2.get_Text())
        
        // Access cell in cell collection
        let range3 = try sheet.get_Cells().get_Item(2)
        try builder.append("Value of range3: " + range3.get_Text())
        
        try File.appendAllText(outputFile, [builder.joined(separator: "\n")])
        
        // Check data in txt
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AccessCell.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
