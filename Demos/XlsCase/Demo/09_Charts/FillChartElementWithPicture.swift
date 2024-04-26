import XCTest
@testable import Spire_Xls

class FillChartElementWithPictureTests: TestCaseBase {
    func testFillChartElementWithPicture_A() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let inputImg = TestUtil.DataPath + "Demo/Background.png"
        let outputFile = TestUtil.OutputPath + "Demo/FillChartElementWithPicture_A.xlsx"
        
        // Create a workbook and load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet from workbook
        let ws = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the first chart
        let chart = try ws.get_Charts().get_Item(0)
        
        // A. Fill chart area with image
        try chart.get_ChartArea().get_Fill().CustomPicture(Image.FromFile(inputImg), "None")
        try chart.get_PlotArea().get_Fill().set_Transparency(0.9)
        
        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/FillChartElementWithPicture_A.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
    
    func testFillChartElementWithPicture_B() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/ChartSample1.xlsx"
        let inputImg = TestUtil.DataPath + "Demo/Background.png"
        let outputFile = TestUtil.OutputPath + "Demo/FillChartElementWithPicture_B.xlsx"
        
        // Create a workbook and load the document from disk
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        
        // Get the first worksheet from workbook
        let ws = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        
        // Get the first chart
        let chart = try ws.get_Charts().get_Item(0)
        
        // B. Fill plot area with image
        try chart.get_ChartArea().get_Fill().CustomPicture(Image.FromFile(inputImg), "None")
        
        // Save the document
        try workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
        try workbook.Dispose()
        
        // Check data
        // let baseLineFile = TestUtil.BaseLinePath + "Demo/FillChartElementWithPicture_B.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
