let
    Source = Excel.CurrentWorkbook(){[Name="vehtype"]}[Content],
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"vehtype", Int64.Type}, {"vehtype_name", type text}})
in
    #"Changed Type"