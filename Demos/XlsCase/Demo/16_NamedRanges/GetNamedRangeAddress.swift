import XCTest
@testable import Spire_Xls

class GetNamedRangeAddressTests: TestCaseBase {
    func testGetNamedRangeAddress() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AllNamedRanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetNamedRangeAddress.txt"

        try File.delete(outputFile)
        var sb = [String]()

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let NamedRange = try workbook.get_NameRanges().get_Item(0)
        let address = try NamedRange.get_RefersToRange().get_RangeAddress()
        sb.append("The address of the named range \(try NamedRange.get_Name()) is \(address)")

        try File.appendAllText(outputFile, [sb.joined(separator: "\n")])
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetNamedRangeAddress.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
