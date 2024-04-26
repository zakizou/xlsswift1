import XCTest
@testable import Spire_Xls

class CopyOnlyFormulaValueTests: TestCaseBase {

    func testCopyOnlyFormulaValue() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CopyOnlyFormulaValue.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/CopyOnlyFormulaValue.xlsx"
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Set the copy option
        let copyOptions = CopyRangeOptions.OnlyCopyFormulaValue
        
        // Copy range
        try sheet.Copy(sheet.get_Range().get_Item("A2:C2") as! CellRange, sheet.get_Range().get_Item("A5:C5") as! CellRange, copyOptions)
        
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/CopyOnlyFormulaValue.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
