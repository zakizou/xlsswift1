import XCTest
@testable import Spire_Xls

class RemovePageBreakTests: TestCaseBase {
    func testRemovePageBreak() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PageBreak.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/RemovePageBreak.xlsx"

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet from the workbook
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Clear all the vertical page breaks
        try (sheet.get_VPageBreaks() as! VPageBreaksCollection).Clear()

        // Remove the first horizontal Page Break
        try (sheet.get_HPageBreaks() as! HPageBreaksCollection).RemoveAt(0)

        // Set the ViewMode as Preview to see how the page breaks work
        try sheet.set_ViewMode(ViewMode.Preview)

        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/RemovePageBreak.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

