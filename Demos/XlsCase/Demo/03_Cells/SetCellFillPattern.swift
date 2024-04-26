import XCTest
@testable import Spire_Xls

class SetCellFillPatternTests: TestCaseBase {
    func testSetCellFillPattern() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CommonTemplate.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetCellFillPattern.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        guard let worksheet = try workbook.get_Worksheets().get_Item(0) as? Worksheet else {
            return
        }

        // Set cell color
        try worksheet.get_Range().get_Item("B7:F7").get_Style().set_Color(Color.get_Yellow())

        // Set cell fill pattern
        try worksheet.get_Range().get_Item("B8:F8").get_Style().set_FillPattern(ExcelPatternType.Percent10)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetCellFillPattern.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }
}
