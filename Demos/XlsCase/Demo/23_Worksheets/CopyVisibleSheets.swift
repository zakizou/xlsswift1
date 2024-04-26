import XCTest
@testable import Spire_Xls

class CopyVisibleSheetsTests: TestCaseBase {
    func testCopyVisibleSheets() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CopyVisibleSheets.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopyVisibleSheets.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let workbookNew = try Workbook()
        try workbookNew.set_Version(ExcelVersion.Version2013)
        try workbookNew.get_Worksheets().Clear()

        for sheet in try workbook.get_Worksheets() {
            if try sheet.get_Visibility() == WorksheetVisibility.Visible {
                try workbookNew.get_Worksheets().AddCopy(sheet)
            }
        }

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CopyVisibleSheets.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

