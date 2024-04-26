import XCTest
@testable import Spire_Xls

class SetPageBreakTests: TestCaseBase {
   func testSetPageBreak() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/SetPageBreak.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first worksheet
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

       // Set Excel Page Break Horizontally
       try (sheet.get_HPageBreaks() as! HPageBreaksCollection).Add(sheet.get_Range().get_Item("A8") as! CellRange)
       try (sheet.get_HPageBreaks() as! HPageBreaksCollection).Add(sheet.get_Range().get_Item("A14") as! CellRange)

       // Set Excel Page Break Vertically
       // (sheet.get_VPageBreaks() as! VPageBreaksCollection).Add(sheet.get_Range().get_Item("B1") as! CellRange)
       // (sheet.get_VPageBreaks() as! VPageBreaksCollection).Add(sheet.get_Range().get_Item("C1") as! CellRange)

       // Set view mode to Preview mode
       try workbook.get_Worksheets().get_Item(0).set_ViewMode(ViewMode.Preview)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetPageBreak.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

