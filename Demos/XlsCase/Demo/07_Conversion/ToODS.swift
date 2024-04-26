import XCTest
@testable import Spire_Xls

class ToODSTests: TestCaseBase {
    func testToODS() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToODS.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToODS.ods"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Convert to ODS file
        try workbook.SaveToFile(outputFile, FileFormat.ODS)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ToODS.ods"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
