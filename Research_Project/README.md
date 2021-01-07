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
- Tableau 2020.3

### Actions
- Data was downloaded from FuelEconomy.gov....<<TODO>>
    - [Raw Data](1_FuelEconomyData_Raw.csv "FuelEconomy.gov Download")
- CSV was opened in Microsoft Excel with no direct manipulation beyond converting data to table format
    1. [Import raw data](2A_MSExcel_FuelEconomy_Raw.pq "2A_MSExcel_FuelEconomy_Raw.pq")
    2. [Create emissions category](2B_MSExcel_Index_EmissionsType.pq "2B_MSExcel_Index_EmissionsType.pq")
    3. [Create fuel type category](2C_MSExcel_Index-FuelType.pq "2C_MSExcel_Index_FuelType.pq)
    4. [Create make category](2D_MSExcel_Index-Make.pq "2D_MSExcel_Index-Make.pq")
    5. [Create transmission type category](2E_MSExcel_Index-TransmissionType.pq "2E_MSExcel_Index-TransmissionType.pq")
    6. [Create vehicle type category](2F_MSExcel_Index-VehicleType.pq "2F_MSExcel_Index-VehicleType.pq")
    7. [Combined data to final table](2G_MSExcel_FuelEconomy_Final.pq "2G_MSExcel_FuelEconomy_Final.pq")
- Final Excel table was imported to MatLab for distribution curve fitting
    - *A normal distribution was applied for educational purposes*


### General References
- American Psychological Association. (2019). *Adapting a dissertation or thesis into a journal article*. APA Style. https://apastyle.apa.org/style-grammar-guidelines/research-publication/dissertation-thesis
- American Psychological Association. (2020a). *Publication manual of the American Psychological Association* (7th ed.). American Psychological Association.
- American Psychological Association. (2020b). *Abstract and keywords guide* (7th ed.). American Psychological Association. https://apastyle.apa.org/instructional-aids/abstract-keywords-guide.pdf
- American Psychological Association. (2020c). *JARS-Quant | Table 1 Information recommended for inclusion in manuscripts that report new data collections regardless of research design*. American Psychological Association. https://apastyle.apa.org/jars/quant-table-1.pdf
- American Psychological Association. (2020d). *JARS-Quant | Table 3 Reporting standards for nonexperimental studies using no experimental manipulation*. American Psychological Association. https://apastyle.apa.org/jars/quant-table-3.pdf
- American Psychological Association. (2020e). *JARS-Quant | Table 8 Reporting standards for studies using Bayesian techniques*. American Psychological Association. https://apastyle.apa.org/jars/quant-table-8.pdf
- U.S. Department of Energy. (2020, December). *FuelEconomy.gov web services*. https://www.fueleconomy.gov/feg/ws/index.shtml