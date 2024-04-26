import XCTest
@testable import Spire_Xls

class RemoveAllDigitalSignaturesTests: TestCaseBase {
    func testRemoveAllDigitalSignatures() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WithDigitalSignature.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveAllDigitalSignatures.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Remove all digital signatures.
        try workbook.RemoveAllDigitalSignatures()

        // Save to file.
        try workbook.SaveToFile(outputFile, FileFormat.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RemoveAllDigitalSignatures.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

