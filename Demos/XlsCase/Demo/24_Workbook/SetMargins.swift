import XCTest
@testable import Spire_Xls

class SetMarginsTests: TestCaseBase {
    func testSetMargins() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetMargins.xlsx"

        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set margins for top, bottom, left and right, here the unit of measure is Inch
        try sheet.get_PageSetup().set_TopMargin(0.3)
        try sheet.get_PageSetup().set_BottomMargin(1)
        try sheet.get_PageSetup().set_LeftMargin(0.2)
        try sheet.get_PageSetup().set_RightMargin(1)
        // Set the header margin and footer margin
        try sheet.get_PageSetup().set_HeaderMarginInch(0.1)
        try sheet.get_PageSetup().set_FooterMarginInch(0.5)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SetMargins.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

