import XCTest
@testable import Spire_Xls

class FindFormulaCellsTests: XCTestCase {
    func testFindFormulaCells() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/FindCellsSample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FindFormulaCells.txt"
        try File.delete(outputFile)
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Find the cells that contain formula "=SUM(A11,A12)"
        let ranges = try sheet.FindAll("=SUM(A11,A12)", FindType.Formula, ExcelFindOptions.None)
        
        // Create a string builder
        var builder = [String]()
        
        // Append the address of found cells to builder
        if try ranges.get_Count() != 0 {
            for range in ranges {
                let address = try range.get_RangeAddress()
                builder.append("The address of found cell is: " + address)
            }
        } else {
            builder.append("No cell contain the formula")
        }
        try File.appendAllText(outputFile, [builder.joined(separator: "\n")])
        
        // Check data in txt
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FindFormulaCells.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
