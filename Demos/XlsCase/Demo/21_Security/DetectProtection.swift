import XCTest
@testable import Spire_Xls

class DetectProtectionTests: TestCaseBase {
    func testDetectProtection() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ProtectedWorkbook.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DetectProtection.txt"
        try File.delete(outputFile)

        let value = try Workbook.IsPasswordProtected(inputFile)
        let boolvalue: String = value ? "Yes" : "No"
        try File.appendText(outputFile, boolvalue)

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/DetectProtection.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

