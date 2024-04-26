import XCTest
@testable import Spire_Xls

class XLSToXLSMTests: TestCaseBase {
  func testXLSToXLSM() throws {
    try TestUtil.licenseKey()
    let inputFile = TestUtil.DataPath + "Demo/MacroSample.xls"
    let outputFile = TestUtil.OutputPath + "Demo/XLSToXLSM.xlsm"

    let workbook = try Workbook()
    try workbook.LoadFromFile(inputFile)
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2007)
    try workbook.Dispose()

    // Check data in xlsm
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/XLSToXLSM.xlsm"
    // Compare.CompareFile(baseLineFile, outputFile)
  }
}
