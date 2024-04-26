import XCTest
@testable import Spire_Xls

class InsertShapesToExcelSheetTests: TestCaseBase {
    func testInsertShapesToExcelSheet() throws {
        try TestUtil.licenseKey()
        let inputImg = TestUtil.DataPath + "Demo/SpireXls.png"
        let outputFile = TestUtil.OutputPath + "Demo/InsertShapesToExcelSheet.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add a triangle shape.
        let triangle = try sheet.get_PrstGeomShapes().AddPrstGeomShape(2, 2, 100, 100, PrstGeomShapeType.Triangle)
        // Fill the triangle with solid color.
        try triangle.get_Fill().set_ForeColor(Color.get_Yellow())
        try triangle.get_Fill().set_FillType(ShapeFillType.SolidColor)

        // Add a heart shape.
        let heart = try sheet.get_PrstGeomShapes().AddPrstGeomShape(2, 5, 100, 100, PrstGeomShapeType.Heart)
        // Fill the heart with gradient color.
        try heart.get_Fill().set_ForeColor(Color.get_Red())
        try heart.get_Fill().set_FillType(ShapeFillType.Gradient)

        // Add an arrow shape with default color.
        _ = try sheet.get_PrstGeomShapes().AddPrstGeomShape(10, 2, 100, 100, PrstGeomShapeType.CurvedRightArrow)

        // Add a cloud shape.
        let cloud = try sheet.get_PrstGeomShapes().AddPrstGeomShape(10, 5, 100, 100, PrstGeomShapeType.Cloud)
        // Fill the cloud with custom picture.
        try cloud.get_Fill().CustomPicture(try Image.FromFile(inputImg), "SpireXls.png")
        try cloud.get_Fill().set_FillType(ShapeFillType.Picture)

        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/InsertShapesToExcelSheet.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
