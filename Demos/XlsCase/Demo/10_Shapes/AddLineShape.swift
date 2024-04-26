import XCTest
@testable import Spire_Xls

class AddLineShapeTests: TestCaseBase {
    func testAddLineShape() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/AddLineShape.xlsx"
        
        // Create a workbook
        let workbook = try Workbook()
        
        // Load the document from disk
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Add shape line1
        let line1 = try sheet.get_Lines().AddLine(10, 2, 200, 1, LineShapeType.Line)
        // Set dash style type
        try line1.set_DashStyle(ShapeDashLineStyleType.Solid)
        // Set color
        try line1.set_Color(Color.get_CadetBlue())
        // Set weight
        try line1.set_Weight(2)
        // Set end arrow style type
        try line1.set_EndArrowHeadStyle(ShapeArrowStyleType.LineArrow)
        
        // Add shape line2
        let line2 = try sheet.get_Lines().AddLine(12, 2, 200, 1, LineShapeType.CurveLine)
        try line2.set_DashStyle(ShapeDashLineStyleType.Dotted)
        try line2.set_Color(Color.get_OrangeRed())
        try line2.set_Weight(2)
        
        // Add shape line3
        let line3 = try sheet.get_Lines().AddLine(14, 2, 200, 1, LineShapeType.ElbowLine)
        try line3.set_DashStyle(ShapeDashLineStyleType.DashDotDot)
        try line3.set_Color(Color.get_Purple())
        try line3.set_Weight(2)
        
        // Add shape line4
        let line4 = try sheet.get_Lines().AddLine(16, 2, 200, 1, LineShapeType.LineInv)
        try line4.set_DashStyle(ShapeDashLineStyleType.Dashed)
        try line4.set_Color(Color.get_Green())
        try line4.set_Weight(2)
        
        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/AddLineShape.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
