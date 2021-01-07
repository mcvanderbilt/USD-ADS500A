let
    Source = Excel.CurrentWorkbook(){[Name="transtype"]}[Content],
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"transtype_id", Int64.Type}, {"transtype", type text}})
in
    #"Changed Type"