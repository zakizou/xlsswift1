import XCTest
@testable import Spire_Xls

class ExpandOrCollapseRowsTests: TestCaseBase {
    func testExpandOrCollapseRows() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_7.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ExpandOrCollapseRows.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Load an Excel file including a pivot table
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the data in Pivot Table.
        let pivotTable = try sheet.get_PivotTables().get_Item(0) as! XlsPivotTable

        // Calculate Data.
        try pivotTable.CalculateData()

        // Collapse the rows.
        try (pivotTable.get_PivotFields().get_Item("Vendor No") as! XlsPivotField).HideItemDetail("3501", true)

        // Expand the rows.
        try (pivotTable.get_PivotFields().get_Item("Vendor No") as! XlsPivotField).HideItemDetail("3502", false)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ExpandOrCollapseRows.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}