import XCTest
@testable import Spire_Xls

class MergeExcelFilesTests: TestCaseBase {
   func testMergeExcelFiles() throws {
       try TestUtil.licenseKey()
       let outputFile = TestUtil.OutputPath + "Demo/MergeExcelFiles.xlsx"

       var files = [String]()
       files.append(TestUtil.DataPath + "Demo/MergeExcelFiles-1.xlsx")
       files.append(TestUtil.DataPath + "Demo/MergeExcelFiles-2.xls")
       files.append(TestUtil.DataPath + "Demo/MergeExcelFiles-3.xlsx")

       let newbook = try Workbook()
       try newbook.set_Version(ExcelVersion.Version2013)
       // Clear all worksheets
       try newbook.get_Worksheets().Clear()

       // Create a temporary workbook
       let tempbook = try Workbook()

       for file in files {
           // Load the file
           try tempbook.LoadFromFile(file)
           for sheet in try tempbook.get_Worksheets() {
               // Copy every sheet in a workbook
               try newbook.get_Worksheets().AddCopy(sheet, WorksheetCopyType.CopyAll)
           }
       }

       // Save the file
       try newbook.SaveToFile(outputFile, ExcelVersion.Version2010)
       try newbook.Dispose()
       try tempbook.Dispose()

       // Check data
       // let baseLineFile = TestUtil.BaseLinePath + "Demo/MergeExcelFiles.xlsx"
       // Compare.compareFile(baseLineFile, outputFile)
   }
}

