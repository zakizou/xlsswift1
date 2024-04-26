import spirexls

/*
    <summary>
        Represents formatting options for the series data.
    </summary>
*/
public protocol IChartSerieDataFormat: IChartFillBorder{
    /*
    <summary>
        Returns object, that represents aera properties. Read only.
            <example>The following code illustrates how to access AreaProperties properties and set 
            color to IChartInterior.ForegroundColorIndex property:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set interior
        IChartInterior interior = chart.Series[0].Format.AreaProperties;
        //Set color
        interior.ForegroundColor = Color.Red;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_AreaProperties() throws ->IChartInterior

    /*
    <summary>
        Represents the base data format.
            <example>The following code illustrates how to set BaseFormatType.Circle to BarShapeBase:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Bar3DStacked;
        //Set Bar shape base
        chart.Series[0].Format.BarType = BaseFormatType.Circle;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_BarType() throws ->BaseFormatType

    /*

    */
    func set_BarType(_ value:BaseFormatType) throws 

    /*
    <summary>
        Represents the top data format.
            <example>The following code illustrates how to set ExcelTopFormat.Sharp to BarShapeTop property:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Bar3DStacked;
        //Set Bar shape base
        chart.Series[0].Format.BarTopType = TopFormatType.Sharp;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_BarTopType() throws ->TopFormatType

    /*

    */
    func set_BarTopType(_ value:TopFormatType) throws 

    /*
    <summary>
        Foreground color: RGB value (high byte = 0).
            <example>The following code illustrates how to set color to markers in charts:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Line;
        //Set serie format
        IChartSerieDataFormat format = chart.Series[0].Format;
        //Set marker style
        format.MarkerStyle = ChartMarkerType.Circle;
        //Set color
        format.MarkerBackgroundColor = Color.Red;
        format.MarkerForegroundColor = Color.Black;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_MarkerBackgroundColor() throws ->Color

    /*

    */
    func set_MarkerBackgroundColor(_ value:Color) throws 

    /*
    <summary>
        Background color: RGB value (high byte = 0).
            <example>The following code illustrates how to set color for markers in charts:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Line;
        //Set serie format
        IChartSerieDataFormat format = chart.Series[0].Format;
        //Set marker style
        format.MarkerStyle = ChartMarkerType.Circle;
        //Set color
        format.MarkerBackgroundColor = Color.Red;
        format.MarkerForegroundColor = Color.Black;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_MarkerForegroundColor() throws ->Color

    /*

    */
    func set_MarkerForegroundColor(_ value:Color) throws 

    /*
    <summary>
        Type of marker.
            <example>The following code illustrates how marker style can be applied to charts:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Line;
        //Set serie format
        IChartSerieDataFormat format = chart.Series[0].Format;
        //Set marker style
        format.MarkerStyle = ChartMarkerType.Star;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_MarkerStyle() throws ->ChartMarkerType

    /*

    */
    func set_MarkerStyle(_ value:ChartMarkerType) throws 

    /*
    <summary>
        Index to color of marker border.
            <example>The following code illustrates how to set a color from ExcelColors 
            enumeration to marker applied:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Line;
        //Set serie format
        IChartSerieDataFormat format = chart.Series[0].Format;
        //Set marker style
        format.MarkerStyle = ChartMarkerType.Circle;
        //Set color
        format.MarkerBackgroundKnownColor = ExcelColors.Red;
        format.MarkerForegroundKnownColor = ExcelColors.Black;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_MarkerForegroundKnownColor() throws ->ExcelColors

    /*

    */
    func set_MarkerForegroundKnownColor(_ value:ExcelColors) throws 

    /*
    <summary>
        Index to color of marker XlsFill.
            <example>The following code illustrates how to set a color from ExcelColors 
            enumeration to marker applied:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Line;
        //Set serie format
        IChartSerieDataFormat format = chart.Series[0].Format;
        //Set marker style
        format.MarkerStyle = ChartMarkerType.Circle;
        //Set color
        format.MarkerBackgroundKnownColor = ExcelColors.Red;
        format.MarkerForegroundKnownColor = ExcelColors.Black;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_MarkerBackgroundKnownColor() throws ->ExcelColors

    /*

    */
    func set_MarkerBackgroundKnownColor(_ value:ExcelColors) throws 

    /*
    <summary>
        Size of line markers.
            <example>The following code illustrates how to set MarkerSize for applied markers in charts:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Line;
        //Set serie format
        IChartSerieDataFormat format = chart.Series[0].Format;
        //Set marker style
        format.MarkerStyle = ChartMarkerType.Circle;
        //Set marker size
        format.MarkerSize = 10;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_MarkerSize() throws -> Int32

    /*

    */
    func set_MarkerSize(_ value:Int32) throws 

    /*
    <summary>
        Automatic color.
            <example>The following code illustrates how IsAutoMarker property can be used:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:F2"];
        //Set chart type
        chart.ChartType = ExcelChartType.LineMarkers;
        //Set serie data format
        IChartSerieDataFormat format = chart.Series[0].DataPoints.DefaultDataPoint.DataFormat;
        //Check auto marker
        Console.Write(format.IsAutoMarker);
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_IsAutoMarker() throws -> Bool

    /*

    */
    func set_IsAutoMarker(_ value:Bool) throws 

    /*
    <summary>
        Distance of pie slice from center of pie.
            <example>The following code illustrates how to set Percent property:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Pie;
        //Set percent
        chart.Series[0].Format.Percent = 30;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_Percent() throws -> Int32

    /*

    */
    func set_Percent(_ value:Int32) throws 

    /*
    <summary>
        True to draw bubbles with 3D effects.
            <example>The following code illustrates how Is3DBubbles property can be used:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Bubble3D;
        //Set serie format
        IChartSerieDataFormat format = chart.Series[0].Format;
        //Check type
        Console.WriteLine(format.Is3DBubbles);
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_Is3DBubbles() throws -> Bool

    /*

    */
    func set_Is3DBubbles(_ value:Bool) throws 

    /*
    <summary>
        Gets common serie options. Read-only.
            <example>The following code illustrates how IChartFormat.GapWidth can be set by accessing 
            CommonSerieOptions property:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Column3DStacked;
        //Set options
        IChartFormat options = chart.Series[0].Format.Options;
        //Set Gap width
        options.GapWidth = 400;
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_Options() throws ->IChartFormat

    /*
    <summary>
        Indicates whether marker is supported by this chart/series.
            <example>The following code illustrates how set ExcelTreeMapLabelOption.Banner to TreeMapLabelOption:
            <code>
        //Create worksheet
        Workbook workbook = new Workbook();
        workbook.LoadFromFile("Sample.xlsx");
        Worksheet worksheet = workbook.Worksheets[0];
        //Create chart
        IChart chart = worksheet.Charts.Add();
        //Set range
        chart.DataRange = worksheet.Range["A1:C2"];
        //Set chart type
        chart.ChartType = ExcelChartType.Pie;
        //Set serie format
        IChartSerieDataFormat format = chart.Series[0].Format;
        //Check marker support
        Console.WriteLine(format.IsMarkerSupported);
        //Save to file
        workbook.SaveToFile("Chart.xlsx");
        </code>
        </example>
    </summary>
    */
    func get_IsMarkerSupported() throws -> Bool

}

