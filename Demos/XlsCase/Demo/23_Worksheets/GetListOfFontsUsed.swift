import XCTest
@testable import Spire_Xls

class GetListOfFontsUsedTests: TestCaseBase {
    func testGetListOfFontsUsed() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/templateAz.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetListOfFontsUsed.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()

        // Load an Excel document
        try workbook.LoadFromFile(inputFile)

        var fonts:[ExcelFont] = []
        let size = try workbook.get_Worksheets().get_Count()

        // Loop through all sheets of the workbook
        for i in 0...size-1 {
            var r: Int32 = 0
            let sheet = try workbook.get_Worksheets().get_Item(i) as! Worksheet
            while try r < sheet.get_Rows().get_Count() {
                for cell in try sheet.get_Rows().get_Item(r).get_Cells() {
                    // Get the font of the cell and add it to the list
                    try fonts.append(try cell.get_Style().get_Font() as! ExcelFont)
                }
                r += 1
            }
        }

        var strB = [String]()
        for font in fonts {
            try strB.append("FontName:\(font.get_FontName()); FontSize:\(font.get_Size())")
        }

        try File.appendAllText(outputFile, strB)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/GetListOfFontsUsed.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}

