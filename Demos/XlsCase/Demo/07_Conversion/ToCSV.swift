import XCTest
@testable import Spire_Xls

class ToCSVTests: TestCaseBase {
    func testToCSV() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToCSV.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToCSV.csv"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Convert to CSV file
        try sheet.SaveToFile(outputFile, ",", Encoding.get_UTF8())
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ToCSV.csv"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
