import XCTest
@testable import Spire_Xls

class UnlockProtectSheetTests: TestCaseBase {
    func testUnlockProtectSheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/UnprotectProtectSheet.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/UnlockProtectSheet.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Unlock the worksheet in a unlocked Excel file with null string.
        try sheet.Unprotect("e-iceblue")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/UnlockProtectSheet.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

