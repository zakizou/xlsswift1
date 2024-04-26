import XCTest
@testable import Spire_Xls

class SetPrintTitleOfXlsFileTests: TestCaseBase {

    func testSetPrintTitleOfXlsFile() throws{

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetPrintTitleOfXlsFile.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        let pageSetup = try sheet.get_PageSetup() as! PageSetup

        // Define column numbers A & B as title columns.
        try pageSetup.set_PrintTitleColumns("$A:$B")

        // Defining row numbers 1 & 2 as title rows.
        try pageSetup.set_PrintTitleRows("$1:$2")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetPrintTitleOfXlsFile.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
