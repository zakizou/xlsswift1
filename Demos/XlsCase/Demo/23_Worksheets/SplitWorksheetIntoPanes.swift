import XCTest
@testable import Spire_Xls

class SplitWorksheetIntoPanesTests: TestCaseBase {
   func testSplitWorksheetIntoPanes() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/SplitWorksheetIntoPanes.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first worksheet
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Vertical and horizontal split the worksheet into four panes
       try sheet.set_FirstVisibleColumn(2)
       try sheet.set_FirstVisibleRow(5)
       try sheet.set_VerticalSplit(4000)
       try sheet.set_HorizontalSplit(5000)

       // Set the active pane
       try sheet.set_ActivePane(1)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SplitWorksheetIntoPanes.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

