import XCTest
@testable import Spire_Xls

class SplitDataIntoMultipleColumnsTests: TestCaseBase {
    func testSplitDataIntoMultipleColumns() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SplitExcelDataIntoMultipleCols.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SplitExcelDataIntoMultipleCols.xlsx"

        // Create a workbook.
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Split data into separate columns by the delimited characters – space.
        var splitText: [String]? = nil
        var text: String? = nil
        var i: Int32 = 1
        while try i < sheet.get_LastRow() {
            text = try sheet.get_Range().get_Item(i + 1, 1).get_Text()
            splitText = text?.split(separator: " ").map(String.init)
            var j: Int32 = 0
            while j < (splitText?.count ?? 0) {
                try sheet.get_Range().get_Item(i + 1, 1 + j + 1).set_Text(splitText![Int(j)])
                j += 1
            }
            i += 1
        }

        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/SplitExcelDataIntoMultipleCols.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
