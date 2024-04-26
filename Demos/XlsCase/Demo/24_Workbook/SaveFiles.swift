import XCTest
@testable import Spire_Xls

class SaveFilesTests: TestCaseBase {
   func testSaveFiles_ToXls() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
       let outputFile_xls = TestUtil.OutputPath + "Demo/SaveFiles.xls"

       // Create a workbook
       let workbook = try Workbook()

       // Load the document from disk
       try workbook.LoadFromFile(inputFile)

       // Save in Excel 97-2003 format
       try workbook.SaveToFile(outputFile_xls, ExcelVersion.Version97to2003)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SaveFiles.xls"
       // Compare.compareFile(baseLineFile, outputFile_xls)
   }

   func testSaveFiles_ToXlsx() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
       let outputFile_xlsx = TestUtil.OutputPath + "Demo/SaveFiles.xlsx"

       // Create a workbook
       let workbook = try Workbook()

       // Load the document from disk
       try workbook.LoadFromFile(inputFile)

       // Save in Excel2010 xlsx format
       try workbook.SaveToFile(outputFile_xlsx, ExcelVersion.Version2010)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SaveFiles.xlsx"
       // Compare.compareFile(baseLineFile, outputFile_xlsx)
   }

   func testSaveFiles_ToXlsb() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
       let outputFile_xlsb = TestUtil.OutputPath + "Demo/SaveFiles.xlsb"

       // Create a workbook
       let workbook = try Workbook()

       // Load the document from disk
       try workbook.LoadFromFile(inputFile)

       // Save in XLSB format
       try workbook.SaveToFile(outputFile_xlsb, ExcelVersion.Xlsb2010)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SaveFiles.xlsb"
       // Compare.compareFile(baseLineFile, outputFile_xlsb)
   }

   func testSaveFiles_ToOds() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
       let outputFile_ods = TestUtil.OutputPath + "Demo/SaveFiles.ods"

       // Create a workbook
       let workbook = try Workbook()

       // Load the document from disk
       try workbook.LoadFromFile(inputFile)

       // Save in ODS format
       try workbook.SaveToFile(outputFile_ods, ExcelVersion.ODS)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SaveFiles.ods"
       // Compare.compareFile(baseLineFile, outputFile_ods)
   }

   func testSaveFiles_ToPdf() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
       let outputFile_pdf = TestUtil.OutputPath + "Demo/SaveFiles.pdf"

       // Create a workbook
       let workbook = try Workbook()

       // Load the document from disk
       try workbook.LoadFromFile(inputFile)

       // Save in PDF format
       try workbook.SaveToFile(outputFile_pdf, FileFormat.PDF)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SaveFiles.pdf"
       // Compare.compareFile(baseLineFile, outputFile_pdf)
   }

   func testSaveFiles_ToXml() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
       let outputFile_xml = TestUtil.OutputPath + "Demo/SaveFiles.xml"

       // Create a workbook
       let workbook = try Workbook()

       // Load the document from disk
       try workbook.LoadFromFile(inputFile)

       // Save in XML format
       try workbook.SaveToFile(outputFile_xml, FileFormat.XML)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SaveFiles.xml"
       // Compare.compareFile(baseLineFile, outputFile_xml)
   }

   func testSaveFiles_ToXps() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
       let outputFile_xps = TestUtil.OutputPath + "Demo/SaveFiles.xps"

       // Create a workbook
       let workbook = try Workbook()

       // Load the document from disk
       try workbook.LoadFromFile(inputFile)

       // Save in XPS format
       try workbook.SaveToFile(outputFile_xps, FileFormat.XPS)
       try workbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/SaveFiles.xps"
       // Compare.compareFile(baseLineFile, outputFile_xps)
   }
}