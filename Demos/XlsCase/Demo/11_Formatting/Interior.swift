import XCTest
@testable import Spire_Xls

class InteriorTests: TestCaseBase {
    func testInterior() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/Interior.xlsx"

        // Create a workbook
        let workbook = try Workbook()

        // Initialize the workbook
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Specify the version
        try workbook.set_Version(ExcelVersion.Version2007)

        // Define the number of colors
        let maxColor = ExcelColors.None.rawValue

        for i in 2..<40 {
            // Random backKnownColor
            let backKnownColor = ExcelColors(rawValue:Int32(arc4random_uniform(UInt32(maxColor / 2)-1)+1))!

            // Add text
            try sheet.get_Range().get_Item("A1").set_Text("Color Name")
            try sheet.get_Range().get_Item("B1").set_Text("Red")
            try sheet.get_Range().get_Item("C1").set_Text("Green")
            try sheet.get_Range().get_Item("D1").set_Text("Blue")

            // Merge the sheet "E1-K1"
            try sheet.get_Range().get_Item("E1:K1").Merge()
            try sheet.get_Range().get_Item("E1:K1").set_Text("Gradient")
            try (sheet.get_Range().get_Item("A1:K1").get_Style().get_Font()).set_IsBold(true)
            try (sheet.get_Range().get_Item("A1:K1").get_Style().get_Font()).set_Size(11)

            // Set the text of color in sheetA-sheetD
            let colorName = "\(backKnownColor)"
            try sheet.get_Range().get_Item("A\(i)").set_Text(colorName)
            try sheet.get_Range().get_Item("B\(i)").set_NumberValue(Double(workbook.GetPaletteColor(backKnownColor).get_R()))
            try sheet.get_Range().get_Item("C\(i)").set_NumberValue(Double(workbook.GetPaletteColor(backKnownColor).get_G()))
            try sheet.get_Range().get_Item("D\(i)").set_NumberValue(Double(workbook.GetPaletteColor(backKnownColor).get_B()))

            // Merge the sheets
            try sheet.get_Range().get_Item("E\(i):K\(i)").Merge()

            // Set the text of sheetE-sheetK
            try sheet.get_Range().get_Item("E\(i):K\(i)").set_Text(colorName)

            // Set the interior of the color
            let range = try sheet.get_Range().get_Item("E\(i):K\(i)") as! CellRange
            let interior = try (range.get_Style() as! CellStyle).get_Interior() as! ExcelInterior
            try interior.set_FillPattern(ExcelPatternType.Gradient)
            try interior.get_Gradient().set_BackKnownColor(backKnownColor)
            try interior.get_Gradient().set_ForeKnownColor(ExcelColors.White)
            try interior.get_Gradient().set_GradientStyle(GradientStyleType.Vertical)
            try interior.get_Gradient().set_GradientVariant(GradientVariantsType.ShadingVariants1)
        }

        // AutoFit Column
        try sheet.AutoFitColumn(1)

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.baseLinePath + "Demo/Interior.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
