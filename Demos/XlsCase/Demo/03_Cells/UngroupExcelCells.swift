import XCTest
@testable import Spire_Xls

class UngroupExcelCellsTests: TestCaseBase {
  func testUngroupExcelCells() throws {

    try TestUtil.licenseKey()
    let inputFile = TestUtil.DataPath + "Demo/Template_Xls_3.xlsx"
    let outputFile = TestUtil.OutputPath + "Demo/UngroupExcelCells.xlsx"

    // Create a workbook.
    let workbook = try Workbook()

    // Load the file from disk.
    try workbook.LoadFromFile(inputFile)

    // Get the first worksheet.
    let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // Ungroup the row 10 to 12.
    try sheet.UngroupByRows(10, 12)

    // Ungroup the row 16 to 19.
    try sheet.UngroupByRows(16, 19)

    // Save to file.
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
    try workbook.Dispose()

    // Check data
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/UngroupExcelCells.xlsx"
    // Compare.CompareFile(baseLineFile, outputFile)

  }
}
