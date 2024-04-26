// #
// #import unittest
// #from spire.xls import *
// from TestUtil import *
// #from spire.xls.common import *
// #from Demos import *
// #from TestUtil import *
// #from Compare.Compare import Compare

// ##not support:workbook.GetSplitPageInfo

// #class GetPageCount_(unittest.TestCase):
// #
// #    def testGetPageCount(self):

// #        TestUtil.LicenseKey()
// #        inputFile =  TestUtil.DataPath + "Demo/WorksheetSample2.xlsx"
// #        outputFile=  TestUtil.OutputPath + "Demo/GetPageCount.txt"
// #        File.Delete(outputFile)

// #        workbook = Workbook()
// #        workbook.LoadFromFile(inputFile)
// #        pageInfoList = workbook.GetSplitPageInfo()
// #        sb = []
// #        for i, unusedItem in enumerate(workbook.Worksheets):
// #            sheetname = workbook.Worksheets[i].Name
// #            pagecount = pageInfoList[i].Count
// #            sb.append(sheetname + "'s page count is: " + str(pagecount))

// #        #Save the documen
// #        File.AppendAllText(outputFile, sb)
// #        workbook.Dispose()
// #
// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/GetPageCount.txt"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
