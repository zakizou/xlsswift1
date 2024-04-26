import XCTest
@testable import Spire_Xls

class CreateAnExcelWithFiveSheetsTests: TestCaseBase {

    func testCreateAnExcelWithFiveSheets() throws {
        try TestUtil.licenseKey()
        let outputPath = TestUtil.OutputPath + "Demo/CreateAnExcelWithFiveSheet.xlsx"
        let outputPathTxt = TestUtil.OutputPath + "Demo/CreateAnExcelWithFiveSheet.txt"
        try File.delete(outputPathTxt)

        let start = Date()
        let workbook = try Workbook()
        try workbook.CreateEmptySheets(5)
        for i:Int32 in 0..<5 {
            let sheet = try workbook.get_Worksheets().get_Item(i)
            try sheet.set_Name("Sheet\(i)")
            for row:Int32 in 1...150 {
                for col:Int32 in 1...50 {
                    try sheet.get_Range().get_Item(row, col).set_Text("row\(row) col\(col)")
                }
            }
        }

        try workbook.SaveToFile(outputPath, ExcelVersion.Version2010)
        try workbook.Dispose()

        let end = Date()
        let time = end.timeIntervalSince(start)
        try File.appendText(outputPathTxt, "File has been created successfully! \nTime consumed (Seconds): \(time)")

        // region check data xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CreateAnExcelWithFiveSheet.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
        // endregion
    }
}
