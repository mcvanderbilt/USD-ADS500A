let
    Source = RawData,
    #"Removed Alt Fuel Columns" = Table.RemoveColumns(Source,{"barrelsA08", "cityA08", "cityA08U", "co2A", "co2TailpipeAGpm", "combA08", "combA08U", "fuelCostA08", "ghgScoreA", "highwayA08", "highwayA08U", "rangeCityA", "rangeHwyA", "UCityA", "UHighwayA", "rangeA", "createdOn", "modifiedOn", "charge120", "charge240", "city08U", "co2", "comb08U", "feScore", "ghgScore", "highway08U", "phevBlended", "atvType", "fuelType2", "c240Dscr", "charge240b", "c240bDscr"}),
    #"Created volume" = Table.AddColumn(#"Removed Alt Fuel Columns","volume",each [hlv] + [hpv] + [lv2] + [pv2] + [lv4] + [pv4]),
    #"Created vehtype" = Table.AddColumn(#"Created volume", "vehtype", each if [hlv] + [hpv] > 0 then 1 else if [lv2]+[pv2] > 0 then 2 else if [lv4]+[pv4] > 0 then 3 else 0),
    #"Removed Individual Volumes" = Table.RemoveColumns(#"Created vehtype",{"hlv", "hpv", "lv2", "lv4", "pv2", "pv4"}),
    #"Merged vehtype table" = Table.NestedJoin(#"Removed Individual Volumes", {"vehtype"}, vehtype, {"vehtype"}, "vehtype.1", JoinKind.LeftOuter),
    #"Expanded vehtype table" = Table.ExpandTableColumn(#"Merged vehtype table", "vehtype.1", {"vehtype_name"}, {"vehtype_name"}),
    #"Created emissionscat" = Table.AddColumn(
        #"Expanded vehtype table", 
        "emissionscat", 
        each if [co2TailpipeGpm] >  465.538 + (2*119.88) then 6 
        else if [co2TailpipeGpm] >  465.538 +    119.88  then 5 
        else if [co2TailpipeGpm] >= 465.538 -    119.88  then 4 
        else if [co2TailpipeGpm] >= 465.538 - (2*119.88)  then 3 
        else if [co2TailpipeGpm] >= 75 * 1.609344       then 2 
        else 1),
    #"Merged emissiontype" = Table.NestedJoin(#"Created emissionscat", {"emissionscat"}, emissiontype, {"emissiontype"}, "emissiontype", JoinKind.LeftOuter),
    #"Expanded emissiontype table" = Table.ExpandTableColumn(#"Merged emissiontype", "emissiontype", {"emissiontype_name", "emissiontype_description"}, {"emissiontype_name", "emissiontype_description"}),
    #"Split trany by Delimiter" = Table.SplitColumn(#"Expanded emissiontype table", "trany", Splitter.SplitTextByEachDelimiter({" "}, QuoteStyle.Csv, false), {"transtype", "trany.2"}),
    #"Removed trany.2" = Table.RemoveColumns(#"Split trany by Delimiter",{"trany.2"}),
    #"Merged transtype" = Table.NestedJoin(#"Removed trany.2", {"transtype"}, transtype, {"transtype"}, "transtype.1", JoinKind.LeftOuter),
    #"Expanded transtype table" = Table.ExpandTableColumn(#"Merged transtype", "transtype.1", {"transtype_id"}, {"transtype_id"}),
    #"Merged fueltype" = Table.NestedJoin(#"Expanded transtype table", {"fuelType1"}, fueltype, {"fuelType1"}, "fueltypetbl", JoinKind.LeftOuter),
    #"Expanded fueltype table" = Table.ExpandTableColumn(#"Merged fueltype", "fueltypetbl", {"fueltype"}, {"prifueltype"}),
    #"Merged make" = Table.NestedJoin(#"Expanded fueltype table", {"make"}, make, {"make"}, "make.1", JoinKind.LeftOuter),
    #"Expanded make table" = Table.ExpandTableColumn(#"Merged make", "make.1", {"make_id"}, {"make_id"})
in
    #"Expanded make table"