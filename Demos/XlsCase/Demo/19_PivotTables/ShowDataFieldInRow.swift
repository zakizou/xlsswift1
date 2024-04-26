import XCTest
@testable import Spire_Xls

class ShowDataFieldInRowTests: TestCaseBase {
    func testShowDataFieldInRow() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTableExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ShowDataFieldInRow.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let pivotTable = try workbook.get_Worksheets().get_Item(1).get_PivotTables().get_Item(0) as? XlsPivotTable

        try pivotTable?.set_ShowDataFieldInRow(true)
        try pivotTable?.CalculateData()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2016)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = "Demo/ShowDataFieldInRow.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

