import XCTest
@testable import Spire_Xls

class SetSheetFitToPagePropertyTests: TestCaseBase {

    func testSetSheetFitToPageProperty()throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetSheetFitToPageProperty.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let pageSetup = try sheet.get_PageSetup() as! PageSetup

        // Set the FitToPagesTall property.
        try pageSetup.set_FitToPagesTall(1)

        // Set the FitToPagesWide property.
        try pageSetup.set_FitToPagesWide(1)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetSheetFitToPageProperty.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
