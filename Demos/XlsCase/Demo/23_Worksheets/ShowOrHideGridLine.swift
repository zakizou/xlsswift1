import XCTest
@testable import Spire_Xls

class ShowOrHideGridLineTests: TestCaseBase {
   func testShowOrHideGridLine() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/WorksheetSample2.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/ShowOrHideGridLine.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first and second worksheet
       let sheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet
       let sheet2 = try workbook.get_Worksheets().get_Item(1) as! Worksheet

       // Hide grid line in the first worksheet
       try sheet1.set_GridLinesVisible(false)
       // Show grid line in the second worksheet
       try sheet2.set_GridLinesVisible(true)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/ShowOrHideGridLine.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

