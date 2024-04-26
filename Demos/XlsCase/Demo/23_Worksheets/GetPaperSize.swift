import XCTest
@testable import Spire_Xls

class GetPaperSizeTests: TestCaseBase {
    func testGetPaperSize() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/WorksheetSample2.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetPaperSize.txt"
        try File.delete(outputFile)

        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        // pageInfoList = workbook.GetSplitPageInfo()
        var sb = [String]()
        // Loop through all sheets of the workbook
        for i in try 0...workbook.get_Worksheets().get_Count()-1 {
            let sheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            let width = try ((sheet as! Worksheet).get_PageSetup() as! PageSetup).get_PageWidth()
            let height = try ((sheet as! Worksheet).get_PageSetup() as! PageSetup).get_PageHeight()
            sb.append(try sheet.get_Name())
            sb.append("Width: \(width)\tHeight: \(height)\r\n")
        }

        // Save the document
        try File.appendAllText(outputFile, sb)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/GetPaperSize.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

