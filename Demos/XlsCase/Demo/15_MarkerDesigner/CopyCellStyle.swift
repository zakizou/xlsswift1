// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// # from Compare.Compare import Compare

// ##not support:AddDataTable
// #class CopyCellStyle_(unittest.TestCase):
// #
// #    def testCopyCellStyle(self):

// #        TestUtil.LicenseKey()
// #        inputFile =  TestUtil.DataPath + "Demo/MarkerDesigner1.xlsx"
// #        outputFile=  TestUtil.OutputPath + "Demo/CopyCellStyle.xlsx"

// #        #Create a workbook
// #        workbook = Workbook()

// #        #Load the document from disk
// #        workbook.LoadFromFile(inputFile)

// #        # Create Students DataTable
// #        dt = DataTable("data")

// #        # Define a field in it
// #        dt.Columns.Add(DataColumn("name", typeof(string)))
// #        dt.Columns.Add(DataColumn("age", typeof(int)))

// #        # Add three rows to it
// #        drName1 = dt.NewRow()
// #        drName2 = dt.NewRow()
// #        drName3 = dt.NewRow()

// #        drName1["name"] = "John"
// #        drName1["age"] = 15
// #        drName2["name"] = "Jess"
// #        drName2["age"] = 22
// #        drName3["name"] = "Alan"
// #        drName3["age"] = 36

// #        dt.Rows.Add(drName1)
// #        dt.Rows.Add(drName2)
// #        dt.Rows.Add(drName3)

// #        sheet = workbook.Worksheets[0]
// #        #Fill DataTable
// #        workbook.MarkerDesigner.AddDataTable("data", dt)
// #        workbook.MarkerDesigner.Apply()

// #        #Save to file
// #        workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
// #        workbook.Dispose()

// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/CopyCellStyle.xlsx"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
