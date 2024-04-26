import XCTest
@testable import Spire_Xls

class AddArrowLineToExcelFileTests: TestCaseBase {
    func testAddArrowLineToExcelFile() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/AddArrowLineToExcelFile.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Add a Double Arrow and fill the line with solid color.
        let line = try sheet.get_TypedLines().AddLine()
        try line.set_Top(10)
        try line.set_Left(20)
        try line.set_Width(100)
        try line.set_Height(0)
        try line.set_Color(Color.get_Blue())
        try line.set_BeginArrowHeadStyle(ShapeArrowStyleType.LineArrow)
        try line.set_EndArrowHeadStyle(ShapeArrowStyleType.LineArrow)
        
        // Add an Arrow and fill the line with solid color.
        let line_1 = try sheet.get_TypedLines().AddLine()
        try line_1.set_Top(50)
        try line_1.set_Left(30)
        try line_1.set_Width(100)
        try line_1.set_Height(100)
        try line_1.set_Color(Color.get_Red())
        try line_1.set_BeginArrowHeadStyle(ShapeArrowStyleType.LineNoArrow)
        try line_1.set_EndArrowHeadStyle(ShapeArrowStyleType.LineArrow)
        
        // Add an Elbow Arrow Connector.
        let line3 = try sheet.get_TypedLines().AddLine() as! XlsLineShape
        try line3.set_LineShapeType(LineShapeType.ElbowLine)
        try line3.set_Width(30)
        try line3.set_Height(50)
        try line3.set_EndArrowHeadStyle(ShapeArrowStyleType.LineArrow)
        try line3.set_Top(100)
        try line3.set_Left(50)
        
        // Add an Elbow Double-Arrow Connector.
        let line2 = try sheet.get_TypedLines().AddLine() as! XlsLineShape
        try line2.set_LineShapeType(LineShapeType.ElbowLine)
        try line2.set_Width(50)
        try line2.set_Height(50)
        try line2.set_EndArrowHeadStyle(ShapeArrowStyleType.LineArrow)
        try line2.set_BeginArrowHeadStyle(ShapeArrowStyleType.LineArrow)
        try line2.set_Left(120)
        try line2.set_Top(100)
        
        // Add a Curved Arrow Connector.
        let line4 = try sheet.get_TypedLines().AddLine() as! XlsLineShape
        try line4.set_LineShapeType(LineShapeType.CurveLine)
        try line4.set_Width(30)
        try line4.set_Height(50)
        try line4.set_EndArrowHeadStyle(ShapeArrowStyleType.LineArrowOpen)
        try line4.set_Top(100)
        try line4.set_Left(200)
        
        // Add a Curved Double-Arrow Connector.
        let line5 = try sheet.get_TypedLines().AddLine() as! XlsLineShape
        try line5.set_LineShapeType(LineShapeType.CurveLine)
        try line5.set_Width(30)
        try line5.set_Height(50)
        try line5.set_EndArrowHeadStyle(ShapeArrowStyleType.LineArrowOpen)
        try line5.set_BeginArrowHeadStyle(ShapeArrowStyleType.LineArrowOpen)
        try line5.set_Left(250)
        try line5.set_Top(100)
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/AddArrowLineToExcelFile.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
