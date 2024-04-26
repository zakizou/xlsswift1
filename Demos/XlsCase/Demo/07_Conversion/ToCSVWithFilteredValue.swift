import XCTest
@testable import Spire_Xls

class ToCSVWithFilteredValueTests: TestCaseBase {
    func testToCSVWithFilteredValue() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AutofilterSample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToCSVWithFilteredValue.csv"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Convert to CSV file with filtered value
        try workbook.get_Worksheets().get_Item(0).SaveToFile(outputFile, ";", false)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ToCSVWithFilteredValue.csv"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
