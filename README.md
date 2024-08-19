# COVID-19 Data Analysis Project


This project aims to analyze global COVID-19 data, focusing on case numbers, death rates, and vaccination progress across different countries and continents. The analysis was performed using SQL Server and covers various aspects of the pandemic's impact, including infection and death rates, as well as vaccination efforts.

## Project Overview
The project involves the following key analyses:

### Selection and Preparation:
* Extracted data from CovidDeaths and CovidVaccinations tables.
* Filtered data to exclude records where the continent is NULL.
* Ordered data by relevant fields for easier analysis.

### Total Cases vs. Total Deaths:
* Calculated the likelihood of death if diagnosed with COVID-19 in different countries.
* Added a DeathPercentage column to highlight the mortality rate per country.
  
### Total Cases vs. Population:
* Measured the percentage of the population infected with COVID-19 in each country.
* Provided insights into which countries have the highest infection rates relative to their populations.
  
### Highest Infection and Death Rates:
* Identified countries with the highest infection rates compared to their populations.
* Determined countries and continents with the highest death counts relative to their populations.
  
### Global and Continental Analysis:
* Aggregated global numbers to show the overall trend of new cases and deaths over time.
* Analyzed which continents have the highest death counts per population.
  
### Vaccination Data Analysis:
* Joined CovidDeaths and CovidVaccinations tables to analyze vaccination progress.
* Created rolling totals of vaccinated individuals and calculated the percentage of the population vaccinated.
  
### Common Table Expressions (CTEs) and Temp Tables:
* Used CTEs and temp tables to streamline the analysis and create reusable data sets.
* Created a view (PercentPopulationVaccinated) to store vaccination data for future visualization.

  
## SQL Code
The SQL code includes various queries and techniques to extract, transform, and analyze the data:

* Data Selection: Extracted relevant data for analysis from the CovidDeaths and CovidVaccinations tables.
  
* Total Cases and Deaths: Calculated total cases and deaths, and derived mortality rates.
  
* Population vs. Infection Rate: Assessed the impact of COVID-19 on different populations.
  
* Highest Infection and Death Rates: Identified countries with the most significant impact.
  
* Continental and Global Analysis: Aggregated data at the continent and global levels.
  
* Vaccination Progress: Analyzed vaccination progress using rolling totals and percentages.
  
* CTEs and Temp Tables: Implemented reusable logic using CTEs and temporary tables.
  
* View Creation: Created a view to facilitate easy visualization of vaccination progress.
  
### Getting Started
Microsoft
SQL Server or any SQL-compatible database.

Data tables: CovidDeaths and CovidVaccinations.

### Running the Project
  
Clone the repository.

Set up your SQL Server environment and import the required data tables.

Execute the SQL scripts in the order provided in this README.


## Data Sources
CovidDeaths: Contains COVID-19 death and case data by location and date.
CovidVaccinations: Contains vaccination data by location and date.

## Project Structure
SQL Scripts: All SQL queries used in this analysis.
Data: Data tables used for analysis (CovidDeaths and CovidVaccinations).
Views: SQL views created for later use in visualization tools.

#### Contributing
Contributions to this project are welcome! Feel free to fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.

# Contact
For any questions or suggestions, please contact [OBOR AKPEVWE] 

Email;oborakpevwe123@gmail.com.
