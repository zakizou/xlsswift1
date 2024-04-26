import XCTest
@testable import Spire_Xls

class CopyWorksheetTests: TestCaseBase {
    func testCopyWorksheet() throws {
        try TestUtil.licenseKey()
        let inputFile_1 = TestUtil.DataPath + "Demo/ReadImages.xlsx"
        let inputFile_2 = TestUtil.DataPath + "Demo/Sample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopyWorksheet.xlsx"

        let sourceWorkbook = try Workbook()
        try sourceWorkbook.LoadFromFile(inputFile_1)
        let srcWorksheet = try sourceWorkbook.get_Worksheets().get_Item(0) as! Worksheet

        let targetWorkbook = try Workbook()
        try targetWorkbook.LoadFromFile(inputFile_2)
        let targetWorksheet = try targetWorkbook.get_Worksheets().Add("added") as! Worksheet

        try targetWorksheet.CopyFrom(srcWorksheet)

        try targetWorkbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try targetWorkbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CopyWorksheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}