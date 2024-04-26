import XCTest
@testable import Spire_Xls

class UseExplicitLineBreaksTests: TestCaseBase {
  func testUseExplicitLineBreaks() throws {

    try TestUtil.licenseKey()
    let outputFile = TestUtil.OutputPath + "Demo/UseExplicitLineBreaks.xlsx"

    // Create a workbook
    let workbook = try Workbook()

    // Get the first default worksheet
    let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // Specify a cell range
    let c5 = try sheet1.get_Range().get_Item("C5")

    // Set the cell width for specified range
    try sheet1.SetColumnWidth(c5.get_Column(), 70)

    // Put the string value with explicit line breaks
    try c5.set_Value("Spire.XLS for .NET is a professional Excel .NET API\n that can be used to create, read, \nwrite, convert and print Excel files in any type \nof .NET(C#, VB.NET, ASP.NET, .NET Core) application. \nSpire.XLS for .NET offers object model\n Excel API for speeding up Excel programming in .NET platform -\n create new Excel documents from template, edit existing \nExcel documents and \nconvert Excel files.")

    // Set Text wrap
    try c5.set_IsWrapText(true)

    // Save the file
    try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
    try workbook.Dispose()

    // Check data
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/UseExplicitLineBreaks.xlsx"
    // Compare.CompareFile(baseLineFile, outputFile)

  }
}
