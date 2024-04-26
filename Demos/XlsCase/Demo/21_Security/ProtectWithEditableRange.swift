import XCTest
@testable import Spire_Xls

class ProtectWithEditableRangeTests: TestCaseBase {
    func testProtectWithEditableRange() throws { // SPIREXLS-2103
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ProtectWithEditableRange.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ProtectWithEditableRange.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Define the specified ranges to allow users to edit while sheet is protected
        try sheet.AddAllowEditRange("EditableRanges", sheet.get_Range().get_Item("B4:E12") as! CellRange)

        // Protect worksheet with a password.
        try sheet.Protect("TestPassword", SheetProtectionType.All)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ProtectWithEditableRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

