import XCTest
@testable import Spire_Xls

class ShrinkTextToFitInACellTests: TestCaseBase {
  func testShrinkTextToFitInACell() throws {

    try TestUtil.licenseKey()
    let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
    let outputFile = TestUtil.OutputPath + "Demo/ShrinkTextToFitInACell.xlsx"

    // Create a workbook.
    let workbook = try Workbook()

    // Load the file from disk.
    try workbook.LoadFromFile(inputFile)

    // Get the first worksheet.
    let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // The cell range to shrink text.
    let cell = try sheet.get_Range().get_Item("B13:C13")

    // Enable ShrinkToFit.
    let style = try cell.get_Style()
    try style.set_ShrinkToFit(true)

    // Save to file.
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
    try workbook.Dispose()

    // Check data
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/ShrinkTextToFitInACell.xlsx"
    // Compare.CompareFile(baseLineFile, outputFile)

  }
}
