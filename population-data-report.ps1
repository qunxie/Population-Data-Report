Function Get-PrimeFactors
{
    param([int]$number)

    # Create an array to hold the prime factors
    $factors = @()

    # Find the prime factors
    for ($i = 2; $i -le $number; $i++) {
        while (($number % $i) -eq 0) {
            $factors += $i
            $number /= $i
        }
    }

    # Output the prime factors
    $factors
}

$url = "https://datausa.io/api/data?drilldowns=State&measures=Population"
$data = Invoke-RestMethod -Uri $url

# Add a new column to the data for year-over-year population change
for ($i = 0; $i -lt $data.data.length; $i++) {
    $stateData = $data.data[$i]
    $currentState = $stateData.State
    $currentPopulation = $stateData.Population
    $currentYear = $stateData.Year
    $previousYearData = $data.data | Where-Object { $_.State -eq $currentState -and $_.Year -eq ($currentYear - 1) }
    if ($previousYearData) {
        $previousPopulation = $previousYearData.Population
        $populationChange = $currentPopulation - $previousPopulation
        $populationChangePercentage = [math]::Round(($populationChange / $previousPopulation) * 100, 2)
        $stateData | Add-Member -MemberType NoteProperty -Name "Population Change" -Value "$populationChange ($populationChangePercentage%)"
    }
    else {
        $stateData | Add-Member -MemberType NoteProperty -Name "Population Change" -Value ""
    }
}

# Add a new column to the data for prime factorization of final year's population
for ($i = 0; $i -lt $data.data.length; $i++) {
    $stateData = $data.data[$i]
    $currentState = $stateData.State
    $currentPopulation = $stateData.Population
    $currentYear = $stateData.Year
    if ($currentYear -eq $data.data[-1].Year) {
        $primeFactors = Get-PrimeFactors $currentPopulation
        $primeFactorsString = $primeFactors -join ";"
        $stateData | Add-Member -MemberType NoteProperty -Name "Prime Factors" -Value $primeFactorsString
    }
    else {
        $stateData | Add-Member -MemberType NoteProperty -Name "Prime Factors" -Value ""
    }
}

# Export the data to a CSV file
$data.data | Export-Csv -Path "population_data.csv" -NoTypeInformation

# Helper function to calculate prime factors of a number
function Get-PrimeFactors($number) {
    $factors = @()
    $factor = 2
    while ($number -gt 1) {
        if ($number % $factor -eq 0) {
            $factors += $factor
            $number /= $factor
        }
        else {
            $factor++
        }
    }
    return $factors
}

