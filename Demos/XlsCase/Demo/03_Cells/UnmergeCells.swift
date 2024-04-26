import XCTest
@testable import Spire_Xls

class UnmergeCellsTests: TestCaseBase {
  func testUnmergeCells() throws {

    try TestUtil.licenseKey()
    let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
    let outputFile = TestUtil.OutputPath + "Demo/UnmergeCells.xlsx"

    // Create a workbook.
    let workbook = try Workbook()

    // Load the file from disk.
    try workbook.LoadFromFile(inputFile)

    // Get the first worksheet.
    let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // Unmerge the cells.
    try sheet.get_Range().get_Item("F2").UnMerge()

    // Unmerge the cells.
    try sheet.get_Range().get_Item("F7").UnMerge()

    // Save to file.
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
    try workbook.Dispose()

    // Check data
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/UnmergeCells.xlsx"
    // Compare.CompareFile(baseLineFile, outputFile)

  }
}
