import XCTest
@testable import Spire_Xls

class SaveStreamTests: TestCaseBase {
    func testSaveStream() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SaveStream.xls"
        let outputFile = TestUtil.OutputPath + "Demo/SaveStream.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Save an Excel workbook to stream
        let fileStream = try Stream(outputFile)
        try workbook.SaveToStream(fileStream, FileFormat.Version2010)

        try fileStream.Close()
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SaveStream.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

