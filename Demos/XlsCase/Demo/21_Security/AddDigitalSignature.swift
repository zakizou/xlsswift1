// #from spire.xls import *
// from TestUtil import *
// #from Spire.Xls.Core.MergeSpreadsheet.Interfaces import *
// #from spire.xls.common import *

// ##not support:X509Certificate2

// #class AddDigitalSignature_(unittest.TestCase):
// #
// #    def testAddDigitalSignature(self):

// #        TestUtil.LicenseKey()
// #        inputFile =  TestUtil.DataPath + "Demo/DigitalSignature.xlsx"
// #        outputFile=  TestUtil.OutputPath + "Demo/AddDigitalSignature.xlsx"
// #        inputFile_pfx = TestUtil.DataPath + "Demo/gary.pfx"

// #        workbook = Workbook()
// #        workbook.LoadFromFile(inputFile)
// #        cert = X509Certificate2(inputFile_pfx, "e-iceblue")
// #        #Add signature
// #        certtime = DateTime(2020, 7, 1, 7, 10, 36)
// #        dsc = workbook.AddDigitalSignature(cert, "e-iceblue", certtime)

// #        #Save to file.
// #        workbook.SaveToFile(outputFile, FileFormat.Version2013)
// #        workbook.Dispose()
// #
// #        ##region check data
// #        #baseLineFile = TestUtil.BaseLinePath + "Demo/AddDigitalSignature.xlsx"
// #        #Compare.CompareFile(baseLineFile, outputFile)
// #        ##endregion

// #if __name__ == '__main__':
// #    unittest.main()
