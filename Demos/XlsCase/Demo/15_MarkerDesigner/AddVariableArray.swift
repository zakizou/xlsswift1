import XCTest
@testable import Spire_Xls

class AddVariableArrayTests: TestCaseBase {
  func testAddVariableArray() throws {
    try TestUtil.licenseKey()
    let outputFile = TestUtil.OutputPath + "Demo/AddVariableArray.xlsx"

    // Create a workbook
    let workbook = try Workbook()

    // Get the first worksheet
    let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // Set marker designer field in cell A1
    try sheet.get_Range().get_Item("A1").set_Value("&=Array")

    // Fill Array
    try workbook.get_MarkerDesigner().AddArray("Array", [SpireString("Spire.Xls"), SpireString("Spire.Doc"), SpireString("Spire.PDF"), SpireString("Spire.Presentation"), SpireString("Spire.Email")])
    try workbook.get_MarkerDesigner().Apply()
    try workbook.CalculateAllValue()

    // AutoFit
    try sheet.get_AllocatedRange().AutoFitRows()
    try sheet.get_AllocatedRange().AutoFitColumns()

    // Save the changes and validate the result.
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
    try workbook.Dispose()

    // Check data in xlsx
    // let baseLineFile = TestUtil.baseLinePath + "Demo/AddVariableArray.xlsx"
    // Compare.compareFile(baseLineFile, outputFile)
  }
}
