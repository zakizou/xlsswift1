import XCTest
@testable import Spire_Xls

class GetWorksheetNamesTests: TestCaseBase {
    func testGetWorksheetNames() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample3.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetWorksheetNames.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        // Get the names of all worksheets
        var sb = [String]()
        for sheet in try workbook.get_Worksheets() {
            sb.append(try sheet.get_Name())
        }

        // Save the document
        try File.appendAllText(outputFile, sb)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/GetWorksheetNames.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}