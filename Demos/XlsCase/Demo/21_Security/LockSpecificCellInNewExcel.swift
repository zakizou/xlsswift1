import XCTest
@testable import Spire_Xls

class LockSpecificCellInNewExcelTests: TestCaseBase {
    func testLockSpecificCellInNewExcel() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/LockSpecificCellInNewExcel.xlsx"

        let workbook = try Workbook()

        try workbook.CreateEmptySheet()

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        for i in 0..<255 {
            try sheet.get_Rows().get_Item(Int32(i)).get_Style().set_Locked(false)
        }

        try sheet.get_Range().get_Item("A1").set_Text("Locked")
        try sheet.get_Range().get_Item("A1").get_Style().set_Locked(true)

        try sheet.get_Range().get_Item("C1:E3").set_Text("Locked")
        try sheet.get_Range().get_Item("C1:E3").get_Style().set_Locked(true)

        try sheet.Protect("123", SheetProtectionType.All)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/LockSpecificCellInNewExcel.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

