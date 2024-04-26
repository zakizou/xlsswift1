import XCTest
@testable import Spire_Xls

class SetPrintAreaOfXlsFileTests: TestCaseBase {

    func testSetPrintAreaOfXlsFile()throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetPrintAreaOfXlsFile.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the reference of the PageSetup of the worksheet.
        let pageSetup = try sheet.get_PageSetup() as! PageSetup

        // Specify the cells range of the print area.
        try pageSetup.set_PrintArea("A1:E5")

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetPrintAreaOfXlsFile.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
