import XCTest
@testable import Spire_Xls

class FindAndReplaceDataTests: TestCaseBase {
    func testFindAndReplaceData() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/CreateTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FindAndReplaceData.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()

        // Load the Excel document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        // Find the "Brazil" string
        let ranges = try worksheet.FindAllString("Area", false, false)

        // Traverse the found ranges
        for range in ranges {
            // Replace it with "China"
            try range.set_Text("Area Code")
            // Highlight the color
            try range.get_Style().set_Color(try Color.get_Yellow())
        }
        
        // Save the file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FindAndReplaceData.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
