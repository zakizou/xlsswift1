import XCTest
@testable import Spire_Xls

class SetExcelPageOrderTypeTests: XCTestCase {

    func testSetExcelPageOrderType() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetExcelPageOrderType.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the reference of the PageSetup of the worksheet.
        let pageSetup = try sheet.get_PageSetup()

        // Set the order type of the pages to over then down.
        try pageSetup.set_Order(OrderType.OverThenDown)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetExcelPageOrderType.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
