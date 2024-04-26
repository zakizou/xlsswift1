import XCTest
@testable import Spire_Xls

class DetectVBAMacrosTests: TestCaseBase {
    func testDetectVBAMacros() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/MacroSample.xls"
        let outputFile = TestUtil.OutputPath + "Demo/DetectVBAMacros.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let hasMacros = try workbook.get_HasMacros()
        let value = hasMacros ? "Yes" : "No"
        try File.appendText(outputFile, value)
    }
}

