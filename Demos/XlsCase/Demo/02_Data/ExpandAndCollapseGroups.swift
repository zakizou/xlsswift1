import XCTest
@testable import Spire_Xls

class ExpandAndCollapseGroupsTests: TestCaseBase {
    func testExpandAndCollapseGroups() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_3.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ExpandAndCollapseGroups.xlsx"

        // Create a workbook.
        let workbook = try Workbook()

        // Load the file from disk.
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet

        // Expand the grouped rows with ExpandCollapseFlags set to expand parent.
        try sheet.get_Range().get_Item("A16:G19").ExpandGroup(GroupByType.ByRows, ExpandCollapseFlags.ExpandParent)

        // Collapse the grouped rows.
        try sheet.get_Range().get_Item("A10:G12").CollapseGroup(GroupByType.ByRows)

        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ExpandAndCollapseGroups.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
