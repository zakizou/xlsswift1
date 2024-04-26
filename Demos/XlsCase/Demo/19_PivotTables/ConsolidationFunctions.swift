import XCTest
@testable import Spire_Xls

class ConsolidationFunctionsTests: TestCaseBase {
    func testConsolidationFunctions() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTableExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ConsolidationFunctions.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        // Load an Excel file including a pivot table
        try workbook.LoadFromFile(inputFile)
        // Get the sheet in which the pivot table is located
        let sheet = try workbook.get_Worksheets().get_Item("PivotTable") as! Worksheet
        let pt = try sheet.get_PivotTables().get_Item(0) as? PivotTable

        // Apply Average consolidation function to the first data field
        try pt?.get_DataFields().get_Item(0).set_Subtotal(SubtotalTypes.Average)
        // Apply Max consolidation function to the second data field
        try pt?.get_DataFields().get_Item(1).set_Subtotal(SubtotalTypes.Max)
        try pt?.CalculateData()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ConsolidationFunctions.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

