import XCTest
@testable import Spire_Xls

class ToPostScriptTests: TestCaseBase {

    func testToPostScript() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ToPostScript.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ToPostScript.ps"

        // Create a workbook
        let workbook = try Workbook()

        // Load an excel document
        try workbook.LoadFromFile(inputFile)

        try workbook.SaveToFile(outputFile, .PostScript)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ToPostScript.ps"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
