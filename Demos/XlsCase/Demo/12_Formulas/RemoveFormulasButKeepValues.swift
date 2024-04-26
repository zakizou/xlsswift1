import XCTest
@testable import Spire_Xls

class RemoveFormulasButKeepValuesTests: TestCaseBase {
    func testRemoveFormulasButKeepValues() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/RemoveFormulasButKeepValues.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemoveFormulasButKeepValues.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        for sheet in try workbook.get_Worksheets() {
            let worksheet = Worksheet(sheet)
            for cell in try worksheet.get_Range().get_Cells() {
                if try cell.get_HasFormula() {
                    let value = try cell.get_FormulaValue()
                    try cell.Clear(ExcelClearOptions.ClearContent)
                    try cell.set_Value2(SpireString(value))
                }
            }
        }

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/RemoveFormulasButKeepValues.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

