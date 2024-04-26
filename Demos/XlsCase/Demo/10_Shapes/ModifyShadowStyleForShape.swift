import XCTest
@testable import Spire_Xls

class ModifyShadowStyleForShapeTests: TestCaseBase {
    func testModifyShadowStyleForShape() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_5.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/ModifyShadowStyleForShape.xlsx"

        // Create a workbook.
        let workbook = try Workbook()

        // Load the file from disk.
        try workbook.LoadFromFile(inputFile)

        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Get the third shape from the worksheet.
        let shape = try sheet.get_PrstGeomShapes().get_Item(2)

        // Set the shadow style for the shape.
        try shape.get_Shadow().set_Angle(90)
        try shape.get_Shadow().set_Transparency(30)
        try shape.get_Shadow().set_Distance(10)
        try shape.get_Shadow().set_Size(130)
        try shape.get_Shadow().set_Color(Color.get_Yellow())
        try shape.get_Shadow().set_Blur(30)
        try shape.get_Shadow().set_HasCustomStyle(true)

        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/ModifyShadowStyleForShape.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
