let
    Source = Excel.CurrentWorkbook(){[Name="make"]}[Content],
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"make_id", Int64.Type}, {"make", type text}})
in
    #"Changed Type"