import XCTest
@testable import Spire_Xls

class SetShapeOrderTests: TestCaseBase {
    func testSetShapeOrder() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/SetShapeOrder.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetShapeOrder.xlsx"

        let wb = try Workbook()
        // Load an excel file
        try wb.LoadFromFile(inputFile)

        // Bring the picture forward one level
        try ((wb.get_Worksheets().get_Item(0) as! Worksheet).get_Pictures() as! PicturesCollection).get_Item(0).ChangeLayer(ShapeLayerChangeType.BringForward)

        // Bring the image in front of all other objects
        try ((wb.get_Worksheets().get_Item(1) as! Worksheet).get_Pictures() as! PicturesCollection).get_Item(0).ChangeLayer(ShapeLayerChangeType.BringToFront)

        // Send the shape back one level
        var shape = try wb.get_Worksheets().get_Item(2).get_PrstGeomShapes().get_Item(1) as! XlsShape
        try shape.ChangeLayer(ShapeLayerChangeType.SendBackward)

        // Send the shape behind all other objects
        shape = try wb.get_Worksheets().get_Item(3).get_PrstGeomShapes().get_Item(1) as! XlsShape
        try shape.ChangeLayer(ShapeLayerChangeType.SendToBack)

        // Save to file.
        try wb.SaveToFile(outputFile, ExcelVersion.Version2010)
        try wb.Dispose()

        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetShapeOrder.xlsx"
        // Compare.CompareFile(baseLineFile, outputFile)
    }
}
