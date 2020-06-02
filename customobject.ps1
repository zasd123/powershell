$cpu = New-Object -TypeName psobject 
$cpu | Add-Member -MemberType NoteProperty -Name ThermalState -Value 0
$cpu | Add-Member -MemberType NoteProperty -Name Speed -Value 3.25
$cpu | Add-Member -MemberType NoteProperty -Name Utilization -Value 0


$testListener = New-Object -TypeName psobject
$testListener | Add-Member -MemberType NoteProperty -Name UpTime -Value 0 
$testListener | Add-Member -MemberType NoteProperty -Name MaxTemp -Value 0
$testListener | Add-Member -MemberType NoteProperty -Name Running -Value 0



function run-test{


   
    $testListener.Running = 1
    $testListener.UpTime = Get-Date -DisplayHint Time
    $cpu.ThermalState = 30
    $cpu.Utilization = 100

    while($testListener.Running -eq 1){
        #Keeps track of MaxTemp
        if($cpu.ThermalState -gt $testListener.MaxTemp){
            $testListener.MaxTemp =  $cpu.ThermalState

        }

        start-sleep -m 500
        
        #could be a switch statement
           
        if($cpu.ThermalState -eq 30){
            Write-Host "cpu temp is good | " $cpu.ThermalState "c | "$cpu.Utilization "%"
        }

        if($cpu.ThermalState -eq 55){
            Write-Host "cpu temp is ok | " $cpu.ThermalState "c"
        }

        if($cpu.ThermalState -eq 75){
            Write-Host "cpu temp is approaching thermal max, throttling is likely occuring | "$cpu.ThermalState"c"
        }

        if($cpu.ThermalState -eq 95){
            Write-Host "cpu temp is nearing hardware tolerance, stopping test | " $cpu.ThermalState "c"
            $testListener.Running = 0   
        }

        Write-Host "..."

        $cpu.ThermalState++
    }
    $Duration = ((Get-Date -DisplayHint Time) - $testListener.UpTime) 
    Write-Host "Test is complete!"
    Write-Host "Max temp was"  $testListener.MaxTemp "c"
    Write-Host "Test ran for" $Duration "seconds"
}
run-test