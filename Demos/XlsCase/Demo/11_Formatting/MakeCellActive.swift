import XCTest
@testable import Spire_Xls

class MakeCellActiveTests: TestCaseBase {
    func testMakeCellActive() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/templateAz.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/MakeCellActive.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load the file from disk
        try workbook.LoadFromFile(inputFile)

        // Get the 2nd sheet
        let sheet = try workbook.get_Worksheets().get_Item(1) as! Worksheet

        // Set the 2nd sheet as an active sheet
        try sheet.Activate()

        // Set B2 cell as an active cell in the worksheet
        try sheet.SetActiveCell(sheet.get_Range().get_Item("B2"))

        // Set the B column as the first visible column in the worksheet
        try sheet.set_FirstVisibleColumn(1)

        // Set the 2nd row as the first visible row in the worksheet
        try sheet.set_FirstVisibleRow(1)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/MakeCellActive.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
