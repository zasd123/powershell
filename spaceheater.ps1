<#
Zach Hansen
Applied Card Systems
SpaceHeater-v1.ps1
9/25/2019 

program is designed to heat your office

TODO:


#>




function CPU/RAM-Stresser{

    Start-Job -Name cpu1 -ScriptBlock{
        $result = 1; foreach ($number in 1..2147483647) {$result = $result * $number};
    }
    Start-Job -Name cpu2 -ScriptBlock{
        $result = 1; foreach ($number in 1..2147483647) {$result = $result * $number};
    }
    Start-Job -Name cpu3 -ScriptBlock{
        $result = 1; foreach ($number in 1..2147483647) {$result = $result * $number};
    }
    Start-Job -Name cpu4 -ScriptBlock{
        $result = 1; foreach ($number in 1..2147483647) {$result = $result * $number};
    }
    Start-Job -Name cpu5 -ScriptBlock{
        $result = 1; foreach ($number in 1..2147483647) {$result = $result * $number};
    }
    Start-Job -Name cpu6 -ScriptBlock{
        $result = 1; foreach ($number in 1..2147483647) {$result = $result * $number};
    }
    Start-Job -Name mem1 -ScriptBlock{
        $result = 1..50|%{$x=1}{[array]$x+=$x}
    }

    for($x = 0;$x -lt 10; $x++){
    
        $temp = Get-Temperature;
        write-host $temp;
        start-sleep -s 60;
       
        
    }


    write-host "Stopping test";

    Stop-Job -Name cpu1;
    Stop-Job -Name cpu2;
    Stop-Job -Name cpu3;
    Stop-Job -Name cpu4;
    Stop-Job -Name cpu5;
    Stop-Job -Name cpu6;
    Stop-Job -Name mem1;


    Remove-Job -Name cpu1;
    Remove-Job -Name cpu2;
    Remove-Job -Name cpu3;
    Remove-Job -Name cpu4;
    Remove-Job -Name cpu5;
    Remove-Job -Name cpu6;
    Remove-Job -Name mem1;


    
}

function Get-Temperature {
    $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $returntemp = @()

    foreach ($temp in $t.CurrentTemperature)
    {


    $currentTempKelvin = $temp / 10
    $currentTempCelsius = $currentTempKelvin - 273.15

    $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32

    $returntemp += $currentTempCelsius.ToString() + " C "
    }
    return $returntemp
}

CPU/RAM-Stresser
