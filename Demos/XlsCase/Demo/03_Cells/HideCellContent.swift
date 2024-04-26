import XCTest
@testable import Spire_Xls

class HideCellContentTests: TestCaseBase {
    func testHideCellContent() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/HideCellContent.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Hide the area by setting the number format as ";;;"
        try sheet.get_Range().get_Item("C5:D6").set_NumberFormat(";;;")

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // region check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/HideCellContent.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }
}
