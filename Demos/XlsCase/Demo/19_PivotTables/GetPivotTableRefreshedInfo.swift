import XCTest
@testable import Spire_Xls

class GetPivotTableRefreshedInfoTests: TestCaseBase {
    func testGetPivotTableRefreshedInfo() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/PivotTable.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetPivotTableRefreshedInfo.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)

        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let pivotTable = try worksheet.get_PivotTables().get_Item(0) as! XlsPivotTable

        let dateTime = try pivotTable.get_Cache().get_RefreshDate()
        let refreshedBy = try pivotTable.get_Cache().get_RefreshedBy()

        var sb = [String]()
        let result = try "Pivot table refreshed by:  \(refreshedBy)\r\nPivot table refreshed date: \(dateTime.ToString())"
        sb.append(result)
        try File.appendAllText(outputFile, [sb.joined(separator: "\n")])
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetPivotTableRefreshedInfo.txt"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}

