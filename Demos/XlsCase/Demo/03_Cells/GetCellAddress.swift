import XCTest
@testable import Spire_Xls

class GetCellAddressTests: TestCaseBase {
    func testGetCellAddress() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetCellAddress.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        var builder = [String]()

        // Get a cell range
        let range = try sheet.get_Range().get_Item("A1:B5") as! CellRange

        // Get address of range
        let address = try range.get_RangeAddressLocal()
        builder.append("Address of range: " + address)

        // Get the cell count of range
        let count = try range.get_CellsCount()
        builder.append("Cell count of range: \(count)")

        // Get the address of the entire column of range
        let entireColAddress = try range.get_EntireColumn().get_RangeAddressLocal()
        builder.append("Address of entire column of the range: " + entireColAddress)

        // Get the address of the entire row of range
        let entireRowAddress = try range.get_EntireRow().get_RangeAddressLocal()
        builder.append("Address of entire row of the range " + entireRowAddress)
        try File.appendAllText(outputFile, [builder.joined(separator: "\n")])

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/GetCellAddress.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
