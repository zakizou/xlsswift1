// import XCTest
// @testable import Spire_Xls

// class XLSBTests: TestCaseBase {
//   func testXLSB() throws {
//     try TestUtil.licenseKey()
//     let outputFile = TestUtil.OutputPath + "Demo/XLSB.xlsb"
//     let dt = self.getData()

//     let workbook = try Workbook()
//     // Initialize worksheet
//     let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet

//     try sheet.InsertDataTable(dt, true, 1, 1, -1, -1)

//     // Set body style
//     let oddStyle = try workbook.get_Styles().Add("oddStyle")
//     try oddStyle.get_Borders().set_Item(BordersLineType.EdgeLeft, LineStyleType.Thin)
//     try oddStyle.get_Borders().set_Item(BordersLineType.EdgeRight, LineStyleType.Thin)
//     try oddStyle.get_Borders().set_Item(BordersLineType.EdgeTop, LineStyleType.Thin)
//     try oddStyle.get_Borders().set_Item(BordersLineType.EdgeBottom, LineStyleType.Thin)
//     oddStyle.KnownColor = ExcelColors.LightGreen1

//     let evenStyle = try workbook.get_Styles().Add("evenStyle")
//     try evenStyle.get_Borders().set_Item(BordersLineType.EdgeLeft, LineStyleType.Thin)
//     try evenStyle.get_Borders().set_Item(BordersLineType.EdgeRight, LineStyleType.Thin)
//     try evenStyle.get_Borders().set_Item(BordersLineType.EdgeTop, LineStyleType.Thin)
//     try evenStyle.get_Borders().set_Item(BordersLineType.EdgeBottom, LineStyleType.Thin)
//     evenStyle.KnownColor = ExcelColors.LightTurquoise

//     for range in sheet.get_AllocatedRange().get_Rows() {
//       if fmod(range.get_Row(), 2) == 0 {
//         range.CellStyleName = oddStyle.Name
//       } else {
//         range.CellStyleName = evenStyle.Name
//       }
//     }

//     // Set header style
//     var styleHeader = sheet.get_Rows().get_Item(0).get_Style()
//     styleHeader.get_Borders().set_Item(BordersLineType.EdgeLeft, LineStyleType.Thin)
//     styleHeader.get_Borders().set_Item(BordersLineType.EdgeRight, LineStyleType.Thin)
//     styleHeader.get_Borders().set_Item(BordersLineType.EdgeTop, LineStyleType.Thin)
//     styleHeader.get_Borders().set_Item(BordersLineType.EdgeBottom, LineStyleType.Thin)
//     styleHeader.VerticalAlignment = VerticalAlignType.Center
//     styleHeader.KnownColor = ExcelColors.Green
//     styleHeader.get_Font().KnownColor = ExcelColors.White
//     styleHeader.get_Font().set_IsBold(true)

//     try sheet.get_AllocatedRange().AutoFitColumns()
//     try sheet.get_AllocatedRange().AutoFitRows()
//     sheet.get_Rows().get_Item(0).RowHeight = 20

//     try workbook.SaveToFile(outputFile, ExcelVersion.Xlsb2010)
//     try workbook.Dispose()

//     // Check data in xlsb
//     // let baseLineFile = TestUtil.baseLinePath + "Demo/XLSB.xlsb"
//     // Compare.compareFile(baseLineFile, outputFile)
//   }

//   func getData() throws -> DataTable {
//     let inputFile = TestUtil.DataPath + "Demo/XLSB.xlsb"
//     let workbook = try Workbook()
//     try workbook.LoadFromFile(inputFile)
//     // Initialize worksheet
//     let sheet = try workbook.get_Worksheets().get_Item(0) as! Worksheet
//     let dt = try sheet.ExportDataTable()
//     return dt
//   }
// }
