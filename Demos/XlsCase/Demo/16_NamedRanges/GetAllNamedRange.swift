import XCTest
@testable import Spire_Xls

class GetAllNamedRangeTests: TestCaseBase {
    func testGetAllNamedRange() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/AllNamedRanges.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetAllNamedRange.txt"

        try File.delete(outputFile)
        var sb = [String]()

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let ranges = try workbook.get_NameRanges()
        for i in try 0...ranges.get_Count()-1 {
            let nameRange = try ranges.get_Item(Int32(i))
            sb.append(try nameRange.get_Name())
        }

        try File.appendAllText(outputFile, [sb.joined(separator: "\n")])
        try workbook.Dispose()
        // Uncomment the following lines to compare the output file with a baseline
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetAllNamedRange.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
