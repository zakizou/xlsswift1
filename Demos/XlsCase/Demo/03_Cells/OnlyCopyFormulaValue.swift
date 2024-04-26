import XCTest
@testable import Spire_Xls

class OnlyCopyFormulaValueTests: TestCaseBase {
    func testOnlyCopyFormulaValue() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CopyOnlyFormulaValue1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/OnlyCopyFormulaValue.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        guard let sheet = try workbook.get_Worksheets().get_Item(0) as? Worksheet else {
            return
        }

        // Set the copy option
        let copyOptions = CopyRangeOptions.OnlyCopyFormulaValue

        let sourceRange = try sheet.get_Range().get_Item("A6:E6") as! CellRange
        try sheet.Copy(sourceRange, sheet.get_Range().get_Item("A8:E8") as! CellRange, copyOptions)

        try sourceRange.Copy(sheet.get_Range().get_Item("A10:E10") as! CellRange, copyOptions)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/OnlyCopyFormulaValue.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }
}
