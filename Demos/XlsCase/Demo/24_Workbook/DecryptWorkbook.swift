import XCTest
@testable import Spire_Xls

class DecryptWorkbookTests: TestCaseBase {
    func testDecryptWorkbook() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DecryptWorkbook.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DecryptWorkbook.xlsx"

        let value = try Workbook.IsPasswordProtected(inputFile)

        if value {
            let workbook = try Workbook()
            try workbook.set_OpenPassword("eiceblue")
            try workbook.LoadFromFile(inputFile)

            try workbook.UnProtect()

            try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
            try workbook.Dispose()
        }
    }
}

