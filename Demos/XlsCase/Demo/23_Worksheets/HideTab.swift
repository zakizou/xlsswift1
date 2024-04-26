import XCTest
@testable import Spire_Xls

class HideTabTests: TestCaseBase {
    func testHideTab_1() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideTab_1.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Hide worksheet tab
        try workbook.set_ShowTabs(false)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/HideTab_1.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }

    func testHideTab_2() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideTab_2.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Hide worksheet tab
        try workbook.set_ShowTabs(true)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/HideTab_2.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

