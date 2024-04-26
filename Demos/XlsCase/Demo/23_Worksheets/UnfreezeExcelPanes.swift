import XCTest
@testable import Spire_Xls

class UnfreezeExcelPanesTests: TestCaseBase {
   func testUnfreezeExcelPanes() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/Template_Xls_2.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/UnfreezeExcelPanes.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first worksheet.
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
       // Unfreeze the panes.
       try sheet.RemovePanes()

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/UnfreezeExcelPanes.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

