import XCTest
@testable import Spire_Xls

class CopySheetWithinWorkbookTests: TestCaseBase {
    func testCopySheetWithinWorkbook() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopySheetWithinWorkbook.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let sheet1 = try workbook.get_Worksheets().Add("MySheet") as! Worksheet
        let sourceRange = try sheet.get_AllocatedRange() as! CellRange

        try sheet.Copy(sourceRange, sheet1, sheet.get_FirstRow(), sheet.get_FirstColumn(), true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CopySheetWithinWorkbook.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

