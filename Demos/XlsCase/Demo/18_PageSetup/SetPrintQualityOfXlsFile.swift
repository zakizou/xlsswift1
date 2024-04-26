import XCTest
@testable import Spire_Xls


class SetPrintQualityOfXlsFileTests: TestCaseBase {

    func testSetPrintQualityOfXlsFile() throws{

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetPrintQualityOfXlsFile.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set the print quality of the worksheet to 180 dpi.
        try sheet.get_PageSetup().set_PrintQuality(180)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetPrintQualityOfXlsFile.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

