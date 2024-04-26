import XCTest
@testable import Spire_Xls

class SetShadowStyleForShapeTests: TestCaseBase {
    func testSetShadowStyleForShape() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/SetShadowStyleForShape.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Add an ellipse shape.
        let ellipse = try sheet.get_PrstGeomShapes().AddPrstGeomShape(5, 5, 150, 100, PrstGeomShapeType.Ellipse)

        // Set the shadow style for the ellipse.
        try ellipse.get_Shadow().set_Angle(90)
        try ellipse.get_Shadow().set_Distance(10)
        try ellipse.get_Shadow().set_Size(150)
        try ellipse.get_Shadow().set_Color(Color.get_Gray())
        try ellipse.get_Shadow().set_Blur(30)
        try ellipse.get_Shadow().set_Transparency(1)
        try ellipse.get_Shadow().set_HasCustomStyle(true)

        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetShadowStyleForShape.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
