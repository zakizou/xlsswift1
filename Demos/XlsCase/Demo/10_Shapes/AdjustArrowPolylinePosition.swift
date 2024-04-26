import XCTest
@testable import Spire_Xls

class AdjustArrowPolylinePositionTests: TestCaseBase {
    func testAdjustArrowPolylinePosition() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/AdjustArrowPolylinePosition.xlsx"
        let workbook = try Workbook()
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Draw an elbow arrow
        let line = try worksheet.get_TypedLines().AddLine(5, 5, 100, 100, LineShapeType.ElbowLine) as! XlsLineShape
        try line.set_EndArrowHeadStyle(ShapeArrowStyleType.LineNoArrow)
        try line.set_BeginArrowHeadStyle(ShapeArrowStyleType.LineArrow)
        let ad = try line.get_ShapeAdjustValues().AddAdjustValue(GeomertyAdjustValueFormulaType.LiteralValue)

        // When the parameter value is less than 0, the focus of the line is on the left side of the left point, when it is equal to 0, the position is the same as the left point, it is equal to 50 in the middle of the graph, and when it is equal to 100, it is the same as the right point.
        try ad.SetFormulaParameter([-50])

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AdjustArrowPolylinePosition.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
