import XCTest
@testable import Spire_Xls

class TextDirectionTests: TestCaseBase {

    func testTextDirection() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/TextDirection.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Add a new worksheet to the Excel object
        let sheet = try workbook.get_Worksheets().get_Item(0)

        // Access the "B5" cell from the worksheet
        let cell = try sheet.get_Range().get_Item("B5")

        // Add some value to the "B5" cell
        try cell.set_Text("Hello Spire!")

        // Set the reading order from right to left of the text in the "B5" cell
        try cell.get_Style().set_ReadingOrder(ReadingOrderType.RightToLeft)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/TextDirection.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
