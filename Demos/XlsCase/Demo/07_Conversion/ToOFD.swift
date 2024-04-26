import XCTest
@testable import Spire_Xls

class ToOFDTests: TestCaseBase {
    func testToOFD() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToOFD.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToOFD.ofd"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Convert to OFD file
        try workbook.SaveToFile(outputFile, FileFormat.OFD)
        try workbook.Dispose()
        
        // Check Data
        // let baseLineFile = "Demo/ToOFD.ofd"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
