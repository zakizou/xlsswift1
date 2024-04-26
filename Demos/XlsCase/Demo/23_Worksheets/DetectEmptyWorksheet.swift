import XCTest
@testable import Spire_Xls

class DetectEmptyWorksheetTests: TestCaseBase {
    func testDetectEmptyWorksheet() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ReadImages.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DetectEmptyWorksheet.txt"
        try File.delete(outputFile)

        // Create a workbook and load a file
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let worksheet1 = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Detect if the first worksheet is empty or not
        let detect1 = try worksheet1.get_IsEmpty()

        // Get the second worksheet
        let worksheet2 = try workbook.get_Worksheets().get_Item(1) as! Worksheet

        // Detect if the second worksheet is empty or not
        let detect2 = try worksheet2.get_IsEmpty()

        // Create StringBuilder to save
        var content = [String]()

        // Set string format for displaying
        let result = "The first worksheet is empty or not: \(detect1)\r\nThe second worksheet is empty or not: \(detect2)"

        // Add result string to StringBuilder
        content.append(result)

        // Save the document
        try File.appendAllText(outputFile, content)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DetectEmptyWorksheet.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

