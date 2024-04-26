import XCTest
@testable import Spire_Xls

class SetThemeTests: TestCaseBase {
    func testSetTheme() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SetTheme.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetTheme.xlsx"

        // Create a workbook
        let srcWorkbook = try Workbook()
        // Load an Excel file
        try srcWorkbook.LoadFromFile(inputFile)
        let srcWorksheet = try srcWorkbook.get_Worksheets().get_Item(0) as! Worksheet

        let workbook = try Workbook()
        try workbook.get_Worksheets().Clear()
        try workbook.get_Worksheets().AddCopy(srcWorksheet)

        // 1. Copy the theme of the workbook
        // try workbook.CopyTheme(srcWorkbook)

        // 2. Set a certain type of color of the default theme in the workbook
        try workbook.SetThemeColor(ThemeColorType.Dk1, Color.get_SkyBlue())

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetTheme.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

