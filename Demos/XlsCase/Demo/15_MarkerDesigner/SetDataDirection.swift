// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// #from Compare.Compare import Compare

// ##not support:DataTable
// #class SetDataDirection_(unittest.TestCase):
// #
// #    def testSetDataDirection(self):

// #        TestUtil.LicenseKey()
// #        inputFile =  TestUtil.DataPath + "Demo/MarkerDesigner3.xlsx"
// #        outputFile=  TestUtil.OutputPath + "Demo/SetDataDirection.xlsx"

// #        #Create a workbook
// #        workbook = Workbook()

// #        #Load the document from disk
// #        workbook.LoadFromFile(inputFile)

// #        # Create a DataTable
// #        dt = DataTable("data")

// #        #Define a field in it
// #        dt.Columns.Add(DataColumn("value", typeof(string)))

// #        # Add three rows to it
// #        drName1 = dt.NewRow()
// #        drName2 = dt.NewRow()
// #        drName3 = dt.NewRow()

// #        drName1["value"] = "Text1"
// #        drName2["value"] = "Text2"
// #        drName3["value"] = "Text3"

// #        dt.Rows.Add(drName1)
// #        dt.Rows.Add(drName2)
// #        dt.Rows.Add(drName3)

// #        #Fill DataTable
// #        workbook.MarkerDesigner.AddDataTable("data", dt)
// #        workbook.MarkerDesigner.Apply()

// #        #Save to file
// #        workbook.SaveToFile(outputFile, ExcelVersion.Version2013)
// #        workbook.Dispose()
// #
// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/SetDataDirection.xlsx"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
