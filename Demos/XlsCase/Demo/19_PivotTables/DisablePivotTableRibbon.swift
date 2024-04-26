import XCTest
@testable import Spire_Xls

class DisablePivotTableRibbonTests: TestCaseBase {
    func testDisablePivotTableRibbon() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTableExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DisablePivotTableRibbon.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load an Excel file including a pivot table
        try workbook.LoadFromFile(inputFile)
        // Get the sheet in which the pivot table is located
        let sheet = try workbook.get_Worksheets().get_Item("PivotTable") as! Worksheet

        let pt = try sheet.get_PivotTables().get_Item(0) as? PivotTable
        // Disable ribbon for this pivot table
        try pt?.set_EnableWizard(false)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/DisablePivotTableRibbon.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

