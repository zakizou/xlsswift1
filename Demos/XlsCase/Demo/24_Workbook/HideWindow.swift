import XCTest
@testable import Spire_Xls

class HideWindowTests: TestCaseBase {
    func testHideWindow() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/HideWindowExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideWindow.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        try workbook.set_IsHideWindow(true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
}

