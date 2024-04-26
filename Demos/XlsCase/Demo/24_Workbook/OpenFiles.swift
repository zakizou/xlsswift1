import XCTest
@testable import Spire_Xls

class OpenFilesTests: TestCaseBase {
   func testOpenFiles() throws {
       try TestUtil.licenseKey()
       let inputFile = TestUtil.DataPath + "Demo/ExcelSample_N1.xlsx"
       let inputFile_97 = TestUtil.DataPath + "Demo/ExcelSample97_N.xls"
       let inputFile_xml = TestUtil.DataPath + "Demo/OfficeOpenXML_N.xml"
       let inputFile_csv = TestUtil.DataPath + "Demo/CSVSample_N.csv"
       let outputFile = TestUtil.OutputPath + "Demo/OpenFiles.txt"

       try File.delete(outputFile)

       // Create string builder
       var builder = [String]()

       // 1. Load file by file path
       // Create a workbook
       let workbook1 = try Workbook()
       // Load the document from disk
       try workbook1.LoadFromFile(inputFile)
       builder.append("Workbook opened using file path successfully!")

       // 2. Load file by file stream
       let stream = try Stream(inputFile)
       // Create a workbook
       let workbook2 = try Workbook()
       // Load the document from disk
       try workbook2.LoadFromStream(stream)
       builder.append("Workbook opened using file stream successfully!")
       try stream.Dispose()

       // 3. Open Microsoft Excel 97 - 2003 file
       let wbExcel97 = try Workbook()
       try wbExcel97.LoadFromFile(inputFile_97, ExcelVersion.Version97to2003)
       builder.append("Microsoft Excel 97 - 2003 workbook opened successfully!")

       // 4. Open xml file
       let wbXML = try Workbook()
       try wbXML.LoadFromXml(inputFile_xml)
       builder.append("XML file opened successfully!")

       // 5. Open csv file
       let wbCSV = try Workbook()
       try wbCSV.LoadFromFile(inputFile_csv, ",", 1, 1)
       builder.append("CSV file opened successfully!")

       // Save to txt file
       try File.appendAllText(outputFile, [builder.joined(separator: "\n")])

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/OpenFiles.txt"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

