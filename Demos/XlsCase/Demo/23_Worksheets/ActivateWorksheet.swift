import XCTest
@testable import Spire_Xls

class ActivateWorksheetTests: TestCaseBase {
    func testActivateWorksheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ActivateWorksheet.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(1) as! Worksheet

        try sheet.Activate()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ActivateWorksheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

