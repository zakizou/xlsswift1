import XCTest
@testable import Spire_Xls

class LockSpecificRowInNewExcelTests: TestCaseBase {
    func testLockSpecificRowInNewExcel() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/LockSpecificRowInNewExcel.xlsx"

        let workbook = try Workbook()

        try workbook.CreateEmptySheet()

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        for i in 0..<255 {
            try sheet.get_Rows().get_Item(Int32(i)).get_Style().set_Locked(false)
        }

        try sheet.get_Rows().get_Item(2).set_Text("Locked")
        try sheet.get_Rows().get_Item(2).get_Style().set_Locked(true)

        try sheet.Protect("123", SheetProtectionType.All)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/LockSpecificRowInNewExcel.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
