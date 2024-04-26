import XCTest
@testable import Spire_Xls

class TraverseCellsValueTests: TestCaseBase {
  func testTraverseCellsValue() throws {

    try TestUtil.licenseKey()
    let inputFile = TestUtil.DataPath + "Demo/CellValues.xlsx"
    let outputFile = TestUtil.OutputPath + "Demo/TraverseCellsValue.txt"
    try File.delete(outputFile)

    // Create a workbook
    let workbook = try Workbook()

    // Load the Excel document from disk
    try workbook.LoadFromFile(inputFile)

    // Get first worksheet of the workbook
    let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

    // Get the cell range collection
    let cellRangeCollection = try worksheet.get_Cells()

    // Create StringBuilder to save
    var content = [String]()
    content.append("Values of the first sheet:")

    // Traverse cells value
    for case let cellRange as CellRange in cellRangeCollection {
      // Set string format for displaying
      let result = try "Cell: \(cellRange.get_RangeAddress())   Value: \(try cellRange.get_Value())"

      // Add result string to StringBuilder
      content.append(result)
    }

    // Save them to a txt file
    try File.appendAllText(outputFile, content)

    // Check data
    // let baseLineFile = TestUtil.BaseLinePath + "Demo/TraverseCellsValue.txt"
    // Compare.CompareFile(baseLineFile, outputFile)

  }
}
