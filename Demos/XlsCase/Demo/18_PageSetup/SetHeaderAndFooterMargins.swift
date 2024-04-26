import XCTest
@testable import Spire_Xls

class SetHeaderAndFooterMarginsTests: TestCaseBase {
    func testSetHeaderAndFooterMargins() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetHeaderAndFooterMargins.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the PageSetup object of the first worksheet
        let pageSetup = try sheet.get_PageSetup()

        // Set the margins of header and footer
        try pageSetup.set_HeaderMarginInch(2)
        try pageSetup.set_FooterMarginInch(2)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetHeaderAndFooterMargins.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
