import XCTest
@testable import Spire_Xls

class DrawOneLineThroughTwoPointsTests: TestCaseBase {
    func testDrawOneLineThroughTwoPoints() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/DrawOneLineThroughTwoPoints.xlsx"
        let workbook = try Workbook()
        let worksheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // 1) Draw a line according to relative position
        let line1 = try worksheet.get_TypedLines().AddLine() as! XlsLineShape
        try line1.set_LeftColumn(3)
        try line1.set_TopRow(3)
        try line1.set_LeftColumnOffset(0)
        try line1.set_TopRowOffset(0)
        try line1.set_RightColumn(4)
        try line1.set_BottomRow(5)
        try line1.set_RightColumnOffset(0)
        try line1.set_BottomRowOffset(0)

        // 2) Draw a line according to absolute position(pixels).
        let line2 = try worksheet.get_TypedLines().AddLine() as! XlsLineShape
        try line2.set_StartPoint(Point(30, 50))
        try line2.set_EndPoint(Point(20, 80))

        // Save to file
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DrawOneLineThroughTwoPoints.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
