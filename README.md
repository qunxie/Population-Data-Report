https://datausa.io/api/data?drilldowns=State&measures=Population
Given the API link above, return a CSV with the data and a report that can be presented to a wide audience with the findings. 
The CSV must be generated via Powershell but the report can be created by hand or programmatically in any software you prefer (e.g. PowerPoint, Excel, PDF, etc).

The CSV should show per-state population change year-over-year, as well as the prime factorization of the final year's population. 
Population change should be represented as raw values and percentages in parentheses. Prime factors should be separated by semicolons.

| State Name | 2013 | 2014 | 2015 | 2016 | 2017 | 2018 | 2019 | 2019 Factors |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Squarelandia | 421349 | 589301 (39.86%) | 599103 (1.66%) | 674838 (12.64%) | 653893 (-3.10%) | 689391 (5.43%) | 741389 (7.54%) | 11;67399 |

The content of the report can be any part of the dataset given. 
The report will be evaluated biased on appearance, organization, and support from the dataset. 
The presentation should take roughly ten minutes to complete.

- To be included as a valid entry the following must be adhered to:
    - The solution must be able to run on the interviewer’s machine at the time of the interview.
    - All solutions must be submitted with a public facing git repository.
        - The report must be clearly labeled in the repository
    - During the interview you will be asked to present the report
    - All data processing from the API and into the CSV must be in Powershell
        - Nuget and additional tools are allowed
