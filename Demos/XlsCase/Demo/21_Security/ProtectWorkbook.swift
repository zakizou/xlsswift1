import XCTest
@testable import Spire_Xls

class ProtectWorkbookTests: TestCaseBase {
    func testProtectWorkbook() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ProtectWorkbook.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Protect Workbook
        try workbook.Protect("e-iceblue")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ProtectWorkbook.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile, "e-iceblue", "OpenPassword"))
    }
}

