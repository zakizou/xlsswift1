import XCTest
@testable import Spire_Xls

class SetImageOffsetOfChartTests: TestCaseBase {
    func testSetImageOffsetOfChart() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/Template_Xls_1.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/SetImageOffsetOfChart.xlsx"
        
        // Create a workbook.
        let workbook = try Workbook()
        
        // Load the file from disk.
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet.
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let sheet1 = try workbook.get_Worksheets().Add("Contrast") as! Worksheet
        
        // Add chart1 and background image to sheet1 as comparison.
        let chart1 = try (sheet1.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.ColumnClustered)
        try chart1.set_DataRange(sheet.get_Range().get_Item("D1:E8"))
        try chart1.set_SeriesDataFromRange(false)
        
        // Chart Position.
        try chart1.set_LeftColumn(1)
        try chart1.set_TopRow(11)
        try chart1.set_RightColumn(8)
        try chart1.set_BottomRow(33)
        
        // Add picture as background.
        try (chart1.get_ChartArea().get_Fill() as!XlsShapeFill).CustomPicture(Image.FromFile(TestUtil.DataPath + "Demo/Background.png"), "None")
        try (chart1.get_ChartArea().get_Fill() as!XlsShapeFill).set_Tile(false)
        
        // Set the image offset.
        try chart1.get_ChartArea().get_Fill().get_PicStretch().set_Left(20)
        try chart1.get_ChartArea().get_Fill().get_PicStretch().set_Top(20)
        try chart1.get_ChartArea().get_Fill().get_PicStretch().set_Right(5)
        try chart1.get_ChartArea().get_Fill().get_PicStretch().set_Bottom(5)
        
        // Save to file.
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/SetImageOffsetOfChart.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
