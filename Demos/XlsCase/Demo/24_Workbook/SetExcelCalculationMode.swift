import XCTest
@testable import Spire_Xls

class SetExcelCalculationModeTests: TestCaseBase {
    func testSetExcelCalculationMode() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CreateTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetExcelCalculationMode.xlsx"

        let workbook = try Workbook()

        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)

        // Set Excel calculation mode as Manual
        try workbook.set_CalculationMode(ExcelCalculationMode.Manual)

        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetExcelCalculationMode.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

