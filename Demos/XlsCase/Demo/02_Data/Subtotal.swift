import XCTest
@testable import Spire_Xls

class SubtotalTests: TestCaseBase {
    func testSubtotal() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Subtotal.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/Subtotal.xlsx"

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Select data range
        let range = try sheet.get_Range().get_Item("A1:B18")

        // Subtotal selected data
        try sheet.Subtotal(range, 0, [1], SubtotalTypes.Sum, true, false, true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/Subtotal.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
