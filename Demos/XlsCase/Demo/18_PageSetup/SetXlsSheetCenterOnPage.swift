import XCTest
@testable import Spire_Xls

class SetXlsSheetCenterOnPageTests: TestCaseBase {

    func testSetXlsSheetCenterOnPage()throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetXlsSheetCenterOnPage.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the PageSetup object of the first page.
        let pageSetup = try sheet.get_PageSetup() as! PageSetup

        // Set the worksheet center on page.
        try pageSetup.set_CenterHorizontally(true)
        try pageSetup.set_CenterVertically(true)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetXlsSheetCenterOnPage.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}