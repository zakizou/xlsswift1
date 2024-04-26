import XCTest
@testable import Spire_Xls

class PageBreakPreviewTests: TestCaseBase {
    func testPageBreakPreview() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_4.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/PageBreakPreview.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set the scale of PageBreakView mode in Excel file.
        try sheet.set_ZoomScalePageBreakView(80)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/PageBreakPreview.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

