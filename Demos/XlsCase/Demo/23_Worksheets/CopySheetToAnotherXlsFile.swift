import XCTest
@testable import Spire_Xls

class CopySheetToAnotherXlsFileTests: TestCaseBase {
    func testCopySheetToAnotherXlsFile() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/CopySheetToAnotherXlsFile.xlsx"
        let outputFile_ = TestUtil.OutputPath + "Demo/sourceFile.xlsx"

        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        for i in 1...5 {
            try sheet.get_Range().get_Item("A\(i)").set_Text("Header Row \(i)")
        }

        for i in 5...99 {
            try sheet.get_Range().get_Item("A\(i)").set_Text("Detail Row \(i)")
        }

        let pageSetup = try sheet.get_PageSetup()
        try pageSetup.set_PrintTitleRows("$1:$5")

        let workbook1 = try Workbook()
        let sheet1 = try workbook1.get_Worksheets().get_Item(0) as! Worksheet
        try sheet1.CopyFrom(sheet)

        try workbook.SaveToFile(outputFile_, ExcelVersion.Version2013)
        try workbook1.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile_ = TestUtil.BaseLinePath + "Demo/sourceFile.xlsx"
        // Compare.compareFile(baseLineFile_, outputFile_)

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/CopySheetToAnotherXlsFile.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

