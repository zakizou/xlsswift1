import XCTest
@testable import Spire_Xls

class GetColorArgbDataTests: TestCaseBase {

    func testGetColorArgbData() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/templateAz.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/GetColorArgbData.txt"
        try File.delete(outputFile)

        // Create a workbook
        let workbook = try Workbook()

        // Load an Excel document
        try workbook.LoadFromFile(inputFile)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        var strB = [String]()

        // Get font color
        let color1 = try sheet.get_Range().get_Item("B2").get_Style().get_Font().get_Color()

        // Read ARGB data of Color
        try strB.append("The font color of B2: ARGB=(\(color1.get_A()),\(color1.get_R()),\(color1.get_G()),\(color1.get_B()))")

        let color2 = try sheet.get_Range().get_Item("B3").get_Style().get_Font().get_Color()
        try strB.append("The font color of B3: ARGB=(\(color2.get_A()),\(color2.get_R()),\(color2.get_G()),\(color2.get_B()))")

        let color3 = try sheet.get_Range().get_Item("B4").get_Style().get_Font().get_Color()
        try strB.append("The font color of B4: ARGB=(\(color3.get_A()),\(color3.get_R()),\(color3.get_G()),\(color3.get_B()))")

        // Save to file
        try File.appendAllText(outputFile, strB)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/GetColorArgbData.txt"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
