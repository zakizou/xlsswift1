import XCTest
@testable import Spire_Xls

class MergeCellsTests: TestCaseBase {
    func testMergeCells() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/MergeCells.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Merge the seventh column in Excel file
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        try sheet.get_Columns().get_Item(6).Merge()

        // Merge the particular range in Excel file
        try sheet.get_Range().get_Item("A14:D14").Merge()

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/MergeCells.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }
}
