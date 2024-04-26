import XCTest
@testable import Spire_Xls

class ReplaceAndHighlightTests: TestCaseBase {

    func testReplaceAndHighlight() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReplaceAndHighlight.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ReplaceAndHighlight.xlsx"

        // Load the workbook and worksheet
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Find all occurrences of "Total" (case-sensitive, whole words only) and replace with "Sum"
        let ranges = try worksheet.FindAllString("Total", true, true)
        for range in ranges {
            // Replace the text
            try range.set_Text("Sum")

            // Set the highlight color to yellow
            try range.get_Style().set_Color(Color.get_Yellow())
        }

        // Save the workbook and dispose of resources
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
    }
}
