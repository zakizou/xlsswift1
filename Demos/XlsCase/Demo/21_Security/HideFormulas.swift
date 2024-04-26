import XCTest
@testable import Spire_Xls

class HideFormulasTests: TestCaseBase {
    func testHideFormulas() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/FormulasSample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideFormulas.xlsx"
        let workbook = try Workbook()

        try workbook.LoadFromFile(inputFile)

        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        try sheet.get_AllocatedRange().set_IsFormulaHidden(true)

        try sheet.Protect("e-iceblue")
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/HideFormulas.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

