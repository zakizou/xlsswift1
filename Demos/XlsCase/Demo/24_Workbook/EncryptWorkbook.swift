import XCTest
@testable import Spire_Xls

class EncryptWorkbookTests: TestCaseBase {
    func testEncryptWorkbook() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/EncryptWorkbook.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/EncryptWorkbook.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        try workbook.Protect("eiceblue")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
}

