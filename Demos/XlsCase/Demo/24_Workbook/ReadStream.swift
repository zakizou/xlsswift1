import XCTest
@testable import Spire_Xls

class ReadStreamTests: TestCaseBase {
   func testReadStream() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ReadStream.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/ReadStream.xlsx"

       let workbook = try Workbook()

       // Open excel from a stream
       let fileStream = try Stream(inputFile)

       try workbook.LoadFromStream(fileStream)

       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/ReadStream.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

