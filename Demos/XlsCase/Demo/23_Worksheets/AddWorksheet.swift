import XCTest
@testable import Spire_Xls

class AddWorksheetTests: TestCaseBase {
    func testAddWorksheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AddWorksheet.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddWorksheet.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().Add("AddedSheet")
        try (sheet as! Worksheet).get_Range().get_Item("C5").set_Text("This is a new sheet.")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddWorksheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

