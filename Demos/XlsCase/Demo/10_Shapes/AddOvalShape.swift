import XCTest
@testable import Spire_Xls

class AddOvalShapeTests: TestCaseBase {
    func testAddOvalShape() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddOvalShape.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add oval shape1
        let ovalShape1 = try sheet.get_OvalShapes().AddOval(11, 2, 100, 100)
        try ovalShape1.get_Line().set_Weight(0)
        // Fill shape with solid color
        try ovalShape1.get_Fill().set_FillType(ShapeFillType.SolidColor)
        try ovalShape1.get_Fill().set_ForeColor(Color.get_DarkCyan())

        // Add oval shape2
        let ovalShape2 = try sheet.get_OvalShapes().AddOval(11, 5, 100, 100)
        try ovalShape2.get_Line().set_Weight(1)
        // Fill shape with picture
        try ovalShape2.get_Line().set_DashStyle(ShapeDashLineStyleType.Solid)
        try ovalShape2.get_Fill().CustomPicture(TestUtil.DataPath + "Demo/Logo.png")

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddOvalShape.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
