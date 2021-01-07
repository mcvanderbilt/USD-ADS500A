## USD-ADS500A: Probability and Statistics for Data Science
This repository contains the development code used for creation of the Fuel Economy dataset used within University of San Diego Applied Data Science 500A, Probability and Statistics for Data Science.  Students are to use this information in their [quantitative](https://apastyle.apa.org/jars/quant-table-1.pdf "APA Quanitative Design Reporting Standards") research project providing experience in [non-experimental design](https://apastyle.apa.org/jars/quant-table-3.pdf "APA JARS-Quant Table 3") study in [Bayesian techniques](https://apastyle.apa.org/jars/quant-table-8.pdf "APA Bayesian Statistics").

### Sytems and Software
- Lenovo ThinkStation P330 Tower
    - Intel Xeon E-2186G 6 Core Processor with vPro
    - 64 GB (16GBx4) DDR 2666MHz ECC UDIMM
    - RAID 1, 1.0 Terrabyte M.2 PCIe Opal SSD (x2)
    - Windows 10 Pro for Workstations 64
- MatLab R2020b
- Microsoft Excel for Microsoft Office 365 (64-bit)
- SAS Enterprise Guide 7.1 (64-bit)

### Actions
- Data was downloaded from FuelEconomy.gov....<<TODO>>
    - [Raw Data](1_FuelEconomyData_Raw.csv "FuelEconomy.gov Download")
- CSV was opened in Microsoft Excel with no direct manipulation beyond converting data to table format
    1. [Import Raw Data](2A_MSExcel_FuelEconomy_Raw.pq "2A_MSExcel_FuelEconomy_Raw.pq")
    2. [Create Emissions Category](2B_MSExcel_EmissionsType.pq "2B_MSEXCEL_EmissionsType.pq")
- 

### Code Steps
1. Data cleanup in Microsoft Excel PowerQuery M-language
2. Distribution fitting in MatLab R2020b
3. Statistical analysis in SAS Enterprise Guide 7.1

### General References
- American Psychological Association. (2019). *Adapting a dissertation or thesis into a journal article*. APA Style. https://apastyle.apa.org/style-grammar-guidelines/research-publication/dissertation-thesis
- American Psychological Association. (2020a). *Publication manual of the American Psychological Association* (7th ed.). American Psychological Association.
- American Psychological Association. (2020b). *Abstract and keywords guide* (7th ed.). American Psychological Association. https://apastyle.apa.org/instructional-aids/abstract-keywords-guide.pdf
- American Psychological Association. (2020c). *JARS-Quant | Table 1 Information recommended for inclusion in manuscripts that report new data collections regardless of research design*. American Psychological Association. https://apastyle.apa.org/jars/quant-table-1.pdf
- American Psychological Association. (2020d). *JARS-Quant | Table 3 Reporting standards for nonexperimental studies using no experimental manipulation*. American Psychological Association. https://apastyle.apa.org/jars/quant-table-3.pdf
- American Psychological Association. (2020e). *JARS-Quant | Table 8 Reporting standards for studies using Bayesian techniques*. American Psychological Association. https://apastyle.apa.org/jars/quant-table-8.pdf
- U.S. Department of Energy. (2020, December). *FuelEconomy.gov web services*. https://www.fueleconomy.gov/feg/ws/index.shtml