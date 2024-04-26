import XCTest
@testable import Spire_Xls

class FindDataInSpecificRangeTests: TestCaseBase {
    func testFindDataInSpecificRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/FindCellsSample.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/FindDataInSpecificRange.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()

        // Load the document from disk
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Specify a range
        let range = try sheet.get_Range().get_Item(1, 1, 12, 8) as! CellRange

        // Create a string builder
        var builder: [String] = []

        // Find text from this range
        _ = try _findTextFromRange(range, &builder)

        // Find number from this range
        _ = try _findNumberFromRange(range, &builder)

        try File.appendAllText(outputFile, [builder.joined(separator: "\n")])

        // Check data in txt
        // let baseLineFile = TestUtil.baseLinePath + "Demo/FindDataInSpecificRange.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }

    func _findTextFromRange(_ range: CellRange, _ builder: inout [String]) throws {
        // Find string from this range
        let textRanges = try range.FindAllString("E-iceblue", false, false)

        // Append the address of found cells in builder
        if try textRanges.get_Count() != 0 {
            for r in textRanges {
                let address = try r.get_RangeAddress()
                builder.append("The address of found text cell is: " + address)
            }
        } else {
            builder.append("No cell contains the text")
        }
    }

    func _findNumberFromRange(_ range: CellRange, _ builder: inout [String]) throws {
        // Find number from this range
        let numberRanges = try range.FindAllNumber(100, true)

        // Append the address of found cells in builder
        if try numberRanges.get_Count() != 0 {
            for r in numberRanges {
                let address = try r.get_RangeAddress()
                builder.append("The address of found number cell is: " + address)
            }
        } else {
            builder.append("No cell contains the number")
        }
    }
}
