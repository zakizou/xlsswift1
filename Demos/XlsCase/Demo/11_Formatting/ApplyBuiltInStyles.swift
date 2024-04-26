import XCTest
@testable import Spire_Xls

class ApplyBuiltInStylesTests: TestCaseBase {
    func testApplyBuiltInStyles() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SampleB_2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ApplyBuiltInStyles.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try (sheet.get_Range().get_Item("A1:J1") as! CellRange).set_BuiltInStyle(BuiltInStyles.Title)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ApplyBuiltInStyles.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
