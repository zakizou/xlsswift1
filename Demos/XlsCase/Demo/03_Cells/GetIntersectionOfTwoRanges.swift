import XCTest
@testable import Spire_Xls

class GetIntersectionOfTwoRangesTests: TestCaseBase {
    func testGetIntersectionOfTwoRanges() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetIntersectionOfTwoRanges.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the two ranges
        let range = try sheet.get_Range().get_Item("A2:D7").Intersect(sheet.get_Range().get_Item("B2:E8"))

        var content = [String]()
        content.append("The intersection of the two ranges \"A2:D7\" and \"B2:E8\" is:")

        // Get the intersection of the two ranges
        for r in try range.get_Cells() {
            content.append("\(try r.get_Value())")
        }

        // Save to file
        try File.appendAllText(outputFile, [content.joined(separator: "\n")])

        // region check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetIntersectionOfTwoRanges.txt"
        // Compare.CompareFile(baseLineFile, outputFile)
        // endregion
    }
}
