import XCTest
@testable import Spire_Xls

class FreezePanesTests: TestCaseBase {
    func testFreezePanes() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/FreezePanes.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FreezePanes.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Freeze Top Row
        try sheet.FreezePanes(2, 1)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FreezePanes.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

