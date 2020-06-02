$time = Measure-Command{
$serverFeature = @()
$serverDomain = @()
$serverVersion = @()
$serverIp = @()
$serverDhcp = @()
$serverDhcpIp = @()
$serverDhcpVerify = @()
$serverLoad = @()
$serverBoot = @()

$serverList = @("HGIF-DC1.hgifrederick.net","ADFSDEV.hgifrederick.net","HGIF-CA.hgifrederick.net")
#Just add servers to the list above and the script will add them to the output table.


[string[]]$knownDhcpServers = @("255.255.255.255")
#used to verify Dhcp server 


#pulls entire list of installed features from servers in args, and trims whitespace
#returns 2d array
function Get-Features{
    try{
    
        $list = $args[0]
        for($y=0; $y -lt $list.length; $y++){
	        $selection = Get-WindowsFeature -ComputerName $list[$y] | Where Installed 
            [string[]]$serverFeatures = @() 
            for($x = 0; $x -lt $selection.length; $x++){
                [string[]]$serverFeatures += $selection[$x].DisplayName.Trim()       
            } 
            [string[][]]$serverFeaturesOutput += , [array]$serverFeatures
        }
    }catch
    {"Error getting features"}
    #Returns a 2d Array
    return ,$serverFeaturesOutput
}
$serverFeature = Get-Features $serverList


#pulls domain info
#returns array
function Get-Domain{
$list = $args[0]
    try{
        for($y=0; $y -lt $list.length; $y++){
            $selection =  Get-WmiObject Win32_ComputerSystem -Computername $list[$y] 
            [string[]]$serverDomain += $selection.Domain
        }
    }catch
    {"Error getting domain info"} 
    #returns array of server domains
    return ,$serverDomain
}
$serverDomain = Get-Domain $serverList

    
#pulls OS version info from args
#returns array
function Get-Version{ 
    try{
        $list = $args[0]
        for($y=0; $y -lt $list.length; $y++){
            $formattedString = ("`"" + $list[$y] + "`"")
            $selection = Get-ADComputer -Filter "DNSHostName -like $formattedString" -Properties OperatingSystemVersion 
            [string[]]$serverVersion += $selection.OperatingSystemVersion
        }
    }
    catch{"Error getting version info"}
    #Returns array of server versions
    return ,$serverVersion
}
$serverVersion = Get-Version $serverList


#pulls ipv4 info 
#returns array
function Get-Ip{
    try{
        $list = $args[0]
        for($y=0; $y -lt $list.length; $y++){
            $formattedString = ("`"" + $list[$y] + "`"")
            $selection = Get-ADComputer -Filter "DNSHostName -like $formattedString" -Properties IPv4Address 
            [string[]]$serverIp += $selection.IPv4Address 
        }
    }
    catch{"Error getting Ip info"}
    #returns array of server Ips
    return ,$serverIp
}
$serverIp = Get-Ip $serverList


#pulls DHCP status 
#returns array
function Get-Dhcp{
    try{
        $list = $args[0]
        for($y=0; $y -lt $list.length; $y++){
            $selection = gsv -Name *dhcp* -ComputerName $list[$y]
            [string[]]$serverDhcp += $selection.Status
        }
    }
    catch{"Error getting Dhcp status"}
    #returns array of server Dhcp status
    return ,$serverDhcp
}
$serverDhcpStatus = Get-Dhcp $serverList


#pulls DHCP server ip
#returns array
function Get-DhcpServerIp{
    try{
        $list = $args[0]
        $serverDhcpIp = @()
        for($y=0; $y -lt $list.length; $y++){
            $selection = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName $list[$y] | Select-Object -Property DHCPServer 
                if(!$selection.DHCPServer){
                    [string[]]$serverDhcpIp += "Not found"
                }else{
                    [string[]]$serverDhcpIp += [string]$selection.DHCPServer
                }
        }
    #trims out whitespace
    for($x=0;$x -lt $serverDhcpIp.length;$x++){
        $serverDhcpIp[$x] = $serverDhcpIp[$x].Trim()
    }
    }catch
    {"Error occured getting DHCP server ip"}

    return ,$serverDhcpIp
}
$serverDhcpIp = Get-DhcpServerIp $serverList


#verifies that the server is checking in with one of the known dhcp servers
#returns arrray
function Verify-Dhcp(){
    try{
        $list = $args[0]
        for($y=0;$y -lt $list.length;$y++){ 
            if($list[$y] -in $knownDhcpServers){  
                [string[]]$dhcpVerification += "Verified"
            }else{
                [string[]]$dhcpVerification += "Unverified"
            }
        }
    }
    catch{"Error occured verifying DHCP server ip"}
    return ,$dhcpVerification
}
$serverDhcpVerify = Verify-Dhcp $serverDhcpIp


#pulls current cpu load percentage
#returns array
function Get-Cpu{
    try{
        $list = $args[0]
        for($y=0; $y -lt $list.length; $y++){
            $selection = Get-WmiObject -ComputerName $list[$y] win32_processor
            [string[]]$serverDhcp += $selection.LoadPercentage                                   
        }
    }catch
    {"Error getting cpu info"}
    #returns array of server cpu info
    return ,$serverDhcp
}
$serverLoad = Get-Cpu $serverList


#pulls last boot up time/date
#returns array 
function Get-Boot{
    try{
        $list = $args[0]
        for($y=0; $y -lt $list.length; $y++){
            $selection = Get-CimInstance  -ClassName win32_OperatingSystem -ComputerName $list[$y]
            [string[]]$serverBoot += $selection.LastBootUpTime
        }
    }
    catch{"Error getting boot time"}
    #returns array of server boot times
    return ,$serverBoot
}
$serverBoot = Get-Boot $serverList


#creates the table object with data
function Create-Table{
    #Creating the columns
    $table = New-Object System.Data.DataTable
    $table.Columns.Add("ServerName", "string") | Out-Null
    $table.Columns.Add("Domain", "string") | Out-Null
    $table.Columns.Add("Feature", "string") | Out-Null
    $table.Columns.Add("DhcpStatus", "string") | Out-Null
    $table.Columns.Add("DhcpServerIp","string") | Out-Null
    $table.Columns.Add("ServerVerification","string") | Out-Null
    $table.Columns.Add("IPv4", "string") | Out-Null
    $table.Columns.Add("OsVersion", "string") | Out-Null
    $table.Columns.Add("CpuLoad","string") | Out-Null
    $table.Columns.Add("LastBoot", "string") | Out-Null


    #loads data into rows and adds them to the table
    for($y = 0; $y -lt $serverList.length; $y++){
        foreach($feature in $serverFeature[$y]){
            $r = $table.NewRow()
            $r.ServerName = $serverList[$y]
            $r.Domain = $serverDomain[$y]
            $r.Feature = $feature
            $r.DhcpStatus = $serverDhcpStatus[$y]
            $r.DhcpServerIp = $serverDhcpIp[$y]
            $r.ServerVerification = $serverDhcpVerify[$y]
            $r.IPv4 = $serverIp[$y]
            $r.OsVersion = $serverVersion[$y]
            $r.CpuLoad = $serverLoad[$y]
            $r.LastBoot = $serverBoot[$y]
            $table.Rows.Add($r)
        }
    }
    return $table
} 
$outputTable = Create-Table 
}

#outputs table for viewing 
$outputTable | Format-Table -AutoSize
write-host "Run time: $time"