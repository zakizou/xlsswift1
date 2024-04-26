import XCTest
@testable import Spire_Xls

class ShowLeaderLineTests: TestCaseBase {

    func testShowLeaderLine() throws {
        try TestUtil.licenseKey()
        let outputFile = TestUtil.OutputPath + "Demo/ShowLeaderLine.xlsx"

        // Create a workbook
        let workbook = try Workbook()
        try workbook.set_Version(ExcelVersion.Version2013)

        // Get the first sheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

        // Set value of specified range
        try sheet.get_Range().get_Item("A1").set_Value("1")
        try sheet.get_Range().get_Item("A2").set_Value("2")
        try sheet.get_Range().get_Item("A3").set_Value("3")
        try sheet.get_Range().get_Item("B1").set_Value("4")
        try sheet.get_Range().get_Item("B2").set_Value("5")
        try sheet.get_Range().get_Item("B3").set_Value("6")
        try sheet.get_Range().get_Item("C1").set_Value("7")
        try sheet.get_Range().get_Item("C2").set_Value("8")
        try sheet.get_Range().get_Item("C3").set_Value("9")

        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).Add(ExcelChartType.BarStacked) as! Chart
        try chart.set_DataRange(try sheet.get_Range().get_Item("A1:C3"))
        try chart.set_TopRow(4)
        try chart.set_LeftColumn(2)
        try chart.set_Width(450)
        try chart.set_Height(300)

        for i in try 0..<chart.get_Series().get_Count() {
            let cs  = try chart.get_Series().get_Item(i)
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_HasValue(true)
            try cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels().set_ShowLeaderLines(true)
        }

        try workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
        try workbook.Dispose()

        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/ShowLeaderLine.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }

}
