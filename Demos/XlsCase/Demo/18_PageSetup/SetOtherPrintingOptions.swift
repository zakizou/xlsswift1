import XCTest
@testable import Spire_Xls

class SetOtherPrintingOptionsTests: TestCaseBase {

    func testSetOtherPrintingOptions() throws {

        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetOtherPrintingOptions.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the reference of the PageSetup of the worksheet.
        let pageSetup = try sheet.get_PageSetup() as! PageSetup

        // Allow to print gridlines.
        try pageSetup.set_IsPrintGridlines(true)

        // Allow to print row/column headings.
        try pageSetup.set_IsPrintHeadings(true)

        // Allow to print worksheet in black & white mode.
        try pageSetup.set_BlackAndWhite(true)

        // Allow to print comments as displayed on worksheet.
        try pageSetup.set_PrintComments(PrintCommentType.InPlace)

        // Allow to print worksheet with draft quality.
        try pageSetup.set_Draft(true)

        // Allow to print cell errors as N/A.
        try pageSetup.set_PrintErrors(PrintErrorsType.NA)

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetOtherPrintingOptions.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
