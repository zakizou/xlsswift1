import XCTest
@testable import Spire_Xls

class GetSpecificNamedRangeTests: TestCaseBase {
    func testGetSpecificNamedRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AllNamedRanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetSpecificNamedRange.txt"

        try File.delete(outputFile)
        var sb = [String]()

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let name1 = try workbook.get_NameRanges().get_Item(1).get_Name()
        sb.append("Get the specific named range \(name1) by index")

        let name2 = try workbook.get_NameRanges().get_Item("NameRange3").get_Name()
        sb.append("Get the specific named range \(name2) by name")

        try File.appendAllText(outputFile, [sb.joined(separator: "\n")])
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetSpecificNamedRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
