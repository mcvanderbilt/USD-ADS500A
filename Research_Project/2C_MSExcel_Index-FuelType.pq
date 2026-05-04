let
    Source = Excel.CurrentWorkbook(){[Name="fueltype"]}[Content],
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"fueltype", Int64.Type}, {"fuelType1", type text}})
in
    #"Changed Type"