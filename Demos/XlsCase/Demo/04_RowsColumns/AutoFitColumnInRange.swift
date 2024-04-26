import XCTest
@testable import Spire_Xls

class AutoFitColumnInRangeTests: TestCaseBase {
  func testAutoFitColumnInRange() throws {

    try TestUtil.licenseKey()
    let inputFile = TestUtil.DataPath + "Demo/AutoFitSample.xlsx"
    let outputFile = TestUtil.OutputPath + "Demo/AutoFitColumnInRange.xlsx"

    // Create a workbook
    let workbook = try Workbook()

    // Load the document from disk
    try workbook.LoadFromFile(inputFile)

    // Get the first worksheet
    let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // Autofit the Column of the worksheet
    try sheet.AutoFitColumn(2, 2, 5)

    // Save the document
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
    try workbook.Dispose()

    // Check data
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/AutoFitColumnInRange.xlsx"
    // Compare.CompareFile(baseLineFile, outputFile)

  }
}
