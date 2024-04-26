import XCTest
@testable import Spire_Xls

class ShowTabTests: TestCaseBase {
   func testShowTab() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/WorksheetSample4.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/ShowTab.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)
       // Show worksheet tab
       try workbook.set_ShowTabs(true)

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/ShowTab.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

