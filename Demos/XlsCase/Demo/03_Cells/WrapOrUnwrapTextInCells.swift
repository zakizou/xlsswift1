import XCTest
@testable import Spire_Xls

class WrapOrUnwrapTextInCellsTests: TestCaseBase {
  func testWrapOrUnwrapTextInCells() throws {

    try TestUtil.licenseKey()
    let outputFile = TestUtil.OutputPath + "Demo/WrapOrUnwrapTextInCells.xlsx"

    // Create a workbook
    let workbook = try Workbook()

    // Get the first worksheet
    let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // Wrap the excel text
    try sheet.get_Range().get_Item("C1").set_Text("e-iceblue is in facebook and welcome to like us")
    try sheet.get_Range().get_Item("C1").get_Style().set_WrapText(true)
    try sheet.get_Range().get_Item("D1").set_Text("e-iceblue is in twitter and welcome to follow us")
    try sheet.get_Range().get_Item("D1").get_Style().set_WrapText(true)

    // Unwrap the excel text
    try sheet.get_Range().get_Item("C2").set_Text("http://www.facebook.com/pages/e-iceblue/139657096082266")
    try sheet.get_Range().get_Item("C2").get_Style().set_WrapText(false)
    try sheet.get_Range().get_Item("D2").set_Text("https://twitter.com/eiceblue")
    try sheet.get_Range().get_Item("D2").get_Style().set_WrapText(false)

    // Set the text color of Range["C1:D1"]
    try sheet.get_Range().get_Item("C1:D1").get_Style().get_Font().set_Size(15)
    try sheet.get_Range().get_Item("C1:D1").get_Style().get_Font().set_Color(Color.get_Blue())
    // Set the text color of Range["C2:D2"]
    try sheet.get_Range().get_Item("C2:D2").get_Style().get_Font().set_Size(15)
    try sheet.get_Range().get_Item("C2:D2").get_Style().get_Font().set_Color(Color.get_DeepSkyBlue())

    // Save to file
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
    try workbook.Dispose()

    // Check data
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/WrapOrUnwrapTextInCells.xlsx"
    // Compare.CompareFile(baseLineFile, outputFile)

  }
}
