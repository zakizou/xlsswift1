import XCTest
@testable import Spire_Xls

class AutoFitRowInRangeTests: TestCaseBase {
  func testAutoFitRowInRange() throws {

    try TestUtil.licenseKey()
    let inputFile = TestUtil.DataPath + "Demo/AutoFitSample.xlsx"
    let outputFile = TestUtil.OutputPath + "Demo/AutoFitRowInRange.xlsx"

    // Create a workbook
    let workbook = try Workbook()

    // Load the document from disk
    try workbook.LoadFromFile(inputFile)

    // Get the first worksheet
    let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // Autofit the second row of the worksheet
    try sheet.AutoFitRow(2, 1, 2, false)

    // Save the document
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
    try workbook.Dispose()

    // Check data
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/AutoFitRowInRange.xlsx"
    // Compare.CompareFile(baseLineFile, outputFile)

  }
}
