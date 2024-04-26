import XCTest
@testable import Spire_Xls

class FormatDataFieldTests: TestCaseBase {
    func testFormatDataField() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/FormatDataField.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FormatDataField.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let pt = try (sheet.get_PivotTables().get_Item(0)) as! XlsPivotTable
        let pivotDataField = try pt.get_DataFields().get_Item(0)
        try pivotDataField.set_ShowDataAs(PivotFieldFormatType.PercentageOfColumn)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/FormatDataField.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

