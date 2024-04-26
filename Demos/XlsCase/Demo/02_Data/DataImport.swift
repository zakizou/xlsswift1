/*
import XCTest
@testable import Spire_Xls

class DataImportTests: TestCaseBase {

    func testDataImport() throws {
        // TestUtil.LicenseKey()
        let inputFile = TestUtil.DataPath + "Demo/DataImport.xls"
        let outputFile = TestUtil.OutputPath + "Demo/DataImport.xlsx"
        
        let source = try Workbook()
        try source.LoadFromFile(inputFile)
        
        // Initialize worksheet
        let sourcesheet = try source.get_Worksheets().get_Item(0) as! XlsWorksheet
        let table = try sourcesheet.ExportDataTable()
        
        let workbook = try Workbook()
        // Initialize worksheet
        let sheet = try workbook.get_Worksheets().get_Item(0) as! XlsWorksheet
        
        try sheet.InsertDataTable(table, true, 1, 1, -1, -1)
        
        // Sets body style
        let oddStyle = try workbook.get_Styles().Add("oddStyle")
        try oddStyle.get_Borders().get_Item(lineType: .EdgeLeft).set_LineStyle(.Thin)
        try oddStyle.get_Borders().get_Item(lineType: .EdgeRight).set_LineStyle(.Thin)
        try oddStyle.get_Borders().get_Item(lineType: .EdgeTop).set_LineStyle(.Thin)
        try oddStyle.get_Borders().get_Item(lineType: .EdgeBottom).set_LineStyle(.Thin)
        oddStyle.set_KnownColor(ExcelColors.LightGreen1)
        
        let evenStyle = try workbook.get_Styles().Add("evenStyle")
        try evenStyle.get_Borders().get_Item(lineType: .EdgeLeft).set_LineStyle(.Thin)
        try evenStyle.get_Borders().get_Item(lineType: .EdgeRight).set_LineStyle(.Thin)
        try evenStyle.get_Borders().get_Item(lineType: .EdgeTop).set_LineStyle(.Thin)
        try evenStyle.get_Borders().get_Item(lineType: .EdgeBottom).set_LineStyle(.Thin)
        evenStyle.set_KnownColor(ExcelColors.LightTurquoise)
        
        for range in sheet.get_AllocatedRange().get_Rows() {
            if Double(range.get_Row()).truncatingRemainder(dividingBy: 2) == 0 {
                range.set_CellStyleName(evenStyle.get_Name())
            } else {
                range.set_CellStyleName(oddStyle.get_Name())
            }
        }
        
        // Sets header style
        let styleHeader = sheet.get_Rows().get_Item(0).get_Style()
        try styleHeader.get_Borders().get_Item(lineType: .EdgeLeft).set_LineStyle(.Thin)
        try styleHeader.get_Borders().get_Item(lineType: .EdgeRight).set_LineStyle(.Thin)
        try styleHeader.get_Borders().get_Item(lineType: .EdgeTop).set_LineStyle(.Thin)
        try styleHeader.get_Borders().get_Item(lineType: .EdgeBottom).set_LineStyle(.Thin)
        styleHeader.set_VerticalAlignment(.Center)
        styleHeader.set_KnownColor(ExcelColors.Green)
        try styleHeader.get_Font().set_KnownColor(ExcelColors.White)
        styleHeader.get_Font().set_IsBold(true)
        
        sheet.get_AllocatedRange().AutoFitColumns()
        sheet.get_AllocatedRange().AutoFitRows()
        
        sheet.get_Rows().get_Item(0).set_RowHeight(20)
        
        // Save to file.
        try workbook.SaveToFile(outputFile, format: FileFormat.Version2010)
        try workbook.Dispose()
        
        // Check data in xlsx
        // let baseLineFile = TestUtil.baseLinePath + "Demo/DataImport.xlsx"
        // Compare.compareFile(baseLineFile, outputFile)
    }
}
*/
