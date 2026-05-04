let
    Source = Excel.CurrentWorkbook(){[Name="emissiontype"]}[Content],
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"emissiontype", Int64.Type}, {"emissiontype_name", type text}, {"emissiontype_description", type text}})
in
    #"Changed Type"