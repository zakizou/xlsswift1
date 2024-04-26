import XCTest
@testable import Spire_Xls

class SetViewModeTests: TestCaseBase {
   func testSetViewMode() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/SetViewMode.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/SetViewMode.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Set the view mode
       try workbook.get_Worksheets().get_Item(0).set_ViewMode(ViewMode.Preview)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetViewMode.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

