// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// #from Compare.Compare import Compare

// ##not support:CustomClass

// #class Student:
// #    def __init__(self, name, age):
// #        #instance fields found by C# to Python Converter:
// #        self.Name = None
// #        self.Age = 0

// #        self.Name = name
// #        self.Age = age

// #class AddCustomObject_(unittest.TestCase):
// #
// #    def testAddCustomObject(self):

// #        TestUtil.LicenseKey()
// #        outputFile=  TestUtil.OutputPath + "Demo/AddCustomObject.xlsx"

// #        #Create a workbook
// #        workbook = Workbook()

// #        #Get the first worksheet
// #        sheet = workbook.Worksheets[0]

// #        #Set marker designer field in cell A1
// #        sheet.Range["A1"].Value = "&=Student.Name"
// #        sheet.Range["B1"].Value = "&=Student.Age"
// #        list = []
// #        list.append(Student("John", 16))
// #        list.append(Student("Mary", 17))
// #        list.append(Student("Lucy", 17))

// #        #Fill custom object
// #        workbook.MarkerDesigner.AddParameter("Student", list)
// #        workbook.MarkerDesigner.Apply()
// #        workbook.CalculateAllValue()

// #        #AutoFit
// #        sheet.AllocatedRange.AutoFitRows()
// #        sheet.AllocatedRange.AutoFitColumns()

// #        #Save to file
// #        workbook.SaveToFile(outputFile, ExcelVersion.Version2010)
// #        workbook.Dispose()
// #
// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/AddCustomObject.xlsx"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
