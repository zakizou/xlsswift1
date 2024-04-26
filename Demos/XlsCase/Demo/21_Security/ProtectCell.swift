import XCTest
@testable import Spire_Xls

class ProtectCellTests: TestCaseBase {
    func testProtectCell() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ProtectCell.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ProtectCell.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_Range().get_Item("B3").get_Style().set_Locked(true)
        try sheet.get_Range().get_Item("C3").get_Style().set_Locked(false)

        try sheet.Protect("TestPassword", SheetProtectionType.All)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ProtectCell.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}