import XCTest
@testable import Spire_Xls

class CheckDialogSheetInXlsFileTests: TestCaseBase {
    func testCheckDialogSheetInXlsFile() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CheckDialogSheetInXlsFile.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CheckDialogSheetInXlsFile.txt"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        var content = [String]()

        if try sheet.get_Type() == ExcelSheetType.DialogSheet {
            content.append("Worksheet is a Dialog Sheet!")
        } else {
            content.append("Worksheet is not a Dialog Sheet!")
        }

        try File.appendAllText(outputFile, [content.joined(separator: "\n")])
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CheckDialogSheetInXlsFile.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

