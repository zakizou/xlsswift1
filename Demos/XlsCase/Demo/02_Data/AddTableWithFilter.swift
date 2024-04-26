import XCTest
@testable import Spire_Xls

class AddTableWithFilterTests: TestCaseBase {
    func testAddTableWithFilter() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddTableWithFilter.xlsx"

        // Load the document and perform necessary operations.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet

        // Create a ListObject and set its properties.
        let table = try sheet.get_ListObjects().Create("Table", sheet.get_Range().get_Item(1, 1, sheet.get_LastRow(), sheet.get_LastColumn()))
        try table.set_BuiltInTableStyle(TableBuiltInStyles.TableStyleLight9)

        // Save the changes and validate the result.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddTableWithFilter.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}