import XCTest
@testable import Spire_Xls

class HideOrShowWorksheetTests: TestCaseBase {
    func testHideOrShowWorksheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample3.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideOrShowWorksheet.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Hide the sheet named "Sheet1"
        try (workbook.get_Worksheets().get_Item("Sheet1") as! Worksheet).set_Visibility(WorksheetVisibility.Hidden)

        // Show the second sheet
        try (workbook.get_Worksheets().get_Item(1) as! Worksheet).set_Visibility(WorksheetVisibility.Visible)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/HideOrShowWorksheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

