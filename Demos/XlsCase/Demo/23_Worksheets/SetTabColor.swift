import XCTest
@testable import Spire_Xls

class SetTabColorTests: TestCaseBase {
   func testSetTabColor() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/SetTabColor.xlsx"
       let outputFile = TestUtil.OutputPath + "Demo/SetTabColor.xlsx"

       // Create a workbook and load a file
       let workbook = try Workbook()
       try workbook.LoadFromFile(inputFile)

       // Set the tab color of first sheet to be red
       let worksheet0 = try workbook.get_Worksheets().get_Item(0) as! Worksheet
       try worksheet0.set_TabColor(Color.get_Red())

       // Set the tab color of second sheet to be green
       let worksheet1 = try workbook.get_Worksheets().get_Item(1) as! Worksheet
       try worksheet1.set_TabColor(Color.get_Green())

       // Set the tab color of third sheet to be blue
       let worksheet2 = try workbook.get_Worksheets().get_Item(2) as! Worksheet
       try worksheet2.set_TabColor(Color.get_LightBlue())

       // Save the document
       try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetTabColor.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

