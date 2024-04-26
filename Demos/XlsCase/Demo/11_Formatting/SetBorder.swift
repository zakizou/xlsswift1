import XCTest
@testable import Spire_Xls

class SetBorderTests: TestCaseBase {
    func testSetBorder() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SetBorder.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetBorder.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the file from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the cell range where you want to apply border style
        let cr = try sheet.get_Range().get_Item(sheet.get_FirstRow(), sheet.get_FirstColumn(), sheet.get_LastRow(), sheet.get_LastColumn()) as! CellRange

        // Apply border style
        try cr.get_Borders().set_LineStyle(LineStyleType.Double)
        try cr.get_Borders().get_Item(BordersLineType.DiagonalDown).set_LineStyle(LineStyleType.None)
        try cr.get_Borders().get_Item(BordersLineType.DiagonalUp).set_LineStyle(LineStyleType.None)
        try cr.get_Borders().set_Color(Color.get_CadetBlue())

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetBorder.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
