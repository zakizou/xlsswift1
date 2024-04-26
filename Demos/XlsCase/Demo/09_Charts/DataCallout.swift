import XCTest
@testable import Spire_Xls

class DataCalloutTests: TestCaseBase {
    
    func testDataCallout() throws {
        try TestUtil.licenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DataCallout.xlsx"
        let outputFile = TestUtil.OutputPath + "Demo/DataCallout.xlsx"
        
        let workbook = try Workbook()
        try workbook.LoadFromFile(inputFile)
        let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
        let chart = try (sheet.get_Charts() as! WorksheetChartsCollection).get_Item(0) as! Chart

        for i in try 0..<chart.get_Series().get_Count() {
            let cs  = try chart.get_Series().get_Item(i)

            try (cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels() as! XlsChartDataLabels).set_HasValue(true)
            try (cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels() as! XlsChartDataLabels).set_HasWedgeCallout(true)
            try (cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels() as! XlsChartDataLabels).set_HasCategoryName(true)
            try (cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels() as! XlsChartDataLabels).set_HasSeriesName(true)
            try (cs.get_DataPoints().get_DefaultDataPoint().get_DataLabels() as! XlsChartDataLabels).set_HasLegendKey(true)
        }
        
        try workbook.SaveToFile(outputFile, FileFormat.Version2010)
        try workbook.Dispose()
    }
}
