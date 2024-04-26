import XCTest
@testable import Spire_Xls

class AddRectangleShapeTests: TestCaseBase {
    func testAddRectangleShape() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddRectangleShape.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add rectangle shape 1------Rect
        let rect1 = try sheet.get_RectangleShapes().AddRectangle(11, 2, 60, 100, RectangleShapeType.Rect)
        try rect1.get_Line().set_Weight(1)
        // Fill shape with solid color
        try rect1.get_Fill().set_FillType(ShapeFillType.SolidColor)
        try rect1.get_Fill().set_ForeColor(Color.get_DarkGreen())

        // Add rectangle shape 2------RoundRect
        let rect2 = try sheet.get_RectangleShapes().AddRectangle(11, 5, 60, 100, RectangleShapeType.RoundRect)
        try rect2.get_Line().set_Weight(1)
        try rect2.get_Fill().set_FillType(ShapeFillType.SolidColor)
        try rect2.get_Fill().set_ForeColor(Color.get_DarkCyan())

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddRectangleShape.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
