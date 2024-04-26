import XCTest
@testable import Spire_Xls

class FormattingAppearanceTests: TestCaseBase {
    func testFormattingAppearance() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTableExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FormattingAppearance.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item("PivotTable") as! Worksheet
        let pt = try sheet.get_PivotTables().get_Item(0)

        try pt.set_BuiltInStyle(PivotBuiltInStyles.PivotStyleLight10)
        try pt.get_Options().set_ShowGridDropZone(true)
        try pt.get_Options().set_RowLayout(PivotTableLayoutType.Tabular)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/FormattingAppearance.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

