import XCTest
@testable import Spire_Xls

class UnlockSimpleSheetTests: TestCaseBase {
    func testUnlockSimpleSheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/UnlockSimpleSheet.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Unlock the worksheet in a unlocked Excel file with null string.
        try sheet.Unprotect()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/UnlockSimpleSheet.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}