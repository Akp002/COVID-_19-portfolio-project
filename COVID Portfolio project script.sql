SELECT*
FROM Portfolio_project..CovidDeaths
WHERE continent is not null
ORDER BY 3,4
--SELECT*
--FROM Portfolio_project..CovidVaccinations$
--ORDER BY 3,4

--Select Data that we are going to be using
SELECT location,date,total_cases,new_cases,total_deaths,population
FROM Portfolio_project..CovidDeaths
ORDER BY 1,2


--Total cases vs Total Deaths [shows the likelihood of death if you should be diagnosed with covid-19 in your country]
SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as Deathpercentage
FROM Portfolio_project..CovidDeaths
ORDER BY 1,2

--Total cases vs the population
SELECT location,date,total_cases,population, (total_cases/population)*100 as Percentofpopulationinfected
FROM Portfolio_project..CovidDeaths
ORDER BY 1,2

--Countries with highest infection rate compared to population
SELECT location,population,MAX(total_cases) as Highestinfectioncount, (MAX(total_cases)/population)*100 as Percentofpopulationinfected
FROM Portfolio_project..CovidDeaths
GROUP BY location,population
ORDER BY Percentofpopulationinfected DESC

--Countries with the highest death count per population
SELECT location,MAX(CAST(total_deaths as int)) as Totaldeathcount
FROM Portfolio_project..CovidDeaths
WHERE continent is not null
GROUP BY location
ORDER BY Totaldeathcount DESC

-- LET'S BREAK THINGS DOWN BY CONTINENT
--SHOWING CONTINETS WITH HIGHEST DEATH COUNT PER PUPULATION

SELECT continent,MAX(CAST(total_deaths as int)) as Totaldeathcount
FROM Portfolio_project..CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY Totaldeathcount DESC

--GLOBAL NUMBERS

SELECT date,SUM(new_cases) AS total_cases,SUM(CAST(new_deaths AS INT)) AS totsl_deaths,SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 as Deathpercentage
FROM Portfolio_project..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2

--TOTAL POPULATION VS VACCINATIONS

SELECT dea.continent,dea.location,dea.date,dea.population
FROM Portfolio_project..CovidDeaths dea
JOIN Portfolio_project..CovidVaccinations$ vac
     ON dea.location=vac.location
	 AND dea.date=vac.date
WHERE dea.continent is not null
ORDER BY 1,2,3

SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,SUM(CONVERT(int,vac.new_vaccinations))
OVER (partition by dea.Location order by dea.location,dea.date) as Rollingpeoplevaccinated
FROM Portfolio_project..CovidDeaths dea
JOIN Portfolio_project..CovidVaccinations$ vac
     ON dea.location=vac.location
	 AND dea.date=vac.date
WHERE dea.continent is not null
ORDER BY 2,3

 -- USE CTE 

WITH popvsvac (Continent,Location,Date,Population,New_vaccinations,RollingPeopleVaccinated)
as
(
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
,SUM(CONVERT(int,vac.new_vaccinations))OVER (partition by dea.Location order by dea.location
,dea.date) as Rollingpeoplevaccinated
FROM Portfolio_project..CovidDeaths dea
JOIN Portfolio_project..CovidVaccinations$ vac
     ON dea.location=vac.location
	 AND dea.date=vac.date
WHERE dea.continent is not null
--ORDER BY 2,3
)
SELECT*,(RollingPeopleVaccinated/Population)*100
FROM popvsvac

--TEMP TABLE
DROP TABLE if exists  #Percentpopulationvaccinated
Create Table #Percentpopulationvaccinated
(
continent nvarchar(255),
Location nvarchar(255),
Date datetime,
population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
Insert into #Percentpopulationvaccinated
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
,SUM(CONVERT(int,vac.new_vaccinations))OVER (partition by dea.Location order by dea.location
,dea.date) as Rollingpeoplevaccinated
FROM Portfolio_project..CovidDeaths dea
JOIN Portfolio_project..CovidVaccinations$ vac
     ON dea.location=vac.location
	 AND dea.date=vac.date
--WHERE dea.continent is not null
--ORDER BY 2,3

SELECT*,(RollingPeopleVaccinated/Population)*100
FROM #Percentpopulationvaccinated

--creating view to store data for later visualization

CREATE VIEW Percentpopulationvaccinated as
SELECT dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations
,SUM(CONVERT(int,vac.new_vaccinations))OVER (partition by dea.Location order by dea.location
,dea.date) as Rollingpeoplevaccinated
FROM Portfolio_project..CovidDeaths dea
JOIN Portfolio_project..CovidVaccinations$ vac
     ON dea.location=vac.location
	 AND dea.date=vac.date
WHERE dea.continent is not null
--ORDER BY 2,3



SELECT*
FROM Percentpopulationvaccinated











