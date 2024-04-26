import XCTest
@testable import Spire_Xls

class LoadSaveEtAndETTTests: TestCaseBase {
    func testLoadSaveEtAndETT() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Sample-et.et"
        let outputFile = TestUtil.OutputPath + "Demo/LoadSaveEtAndETT.et"

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        try workbook.SaveToFile(outputFile, FileFormat.ET)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = "Demo/LoadSaveEtAndETT.et"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
