import XCTest
@testable import Spire_Xls

class ZoomFactorTests: TestCaseBase {
   func testZoomFactor() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ZoomFactor.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/ZoomFactor.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Get the first worksheet
       let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
       // Set the zoom factor of the sheet to 85
       try sheet.set_Zoom(85)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/ZoomFactor.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}