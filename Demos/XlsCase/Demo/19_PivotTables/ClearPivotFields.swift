import XCTest
@testable import Spire_Xls

class ClearPivotFieldsTests: TestCaseBase {
    func testClearPivotFields() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTableExample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ClearPivotFields.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load an Excel file including a pivot table
        try workbook.LoadFromFile(inputFile)
        // Get the sheet in which the pivot table is located
        let sheet = try workbook.get_Worksheets().get_Item("PivotTable") as! Worksheet

        let pt = try sheet.get_PivotTables().get_Item(0) as? XlsPivotTable 

        // Clear all the data fields
        try pt?.get_DataFields().Clear()

        try pt?.CalculateData()

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ClearPivotFields.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

