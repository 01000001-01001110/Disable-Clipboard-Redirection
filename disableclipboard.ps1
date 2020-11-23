<#
Created: Alan Newingham
Date: 11/11/2020
Completed for: http://automateanddeploy.com/index.php/2020/11/23/powershell-questions-answers-series/?preview_id=196&preview_nonce=02997c7e79&preview=true
#>
$path = "C:\scripts\server.txt"
$servers = Get-Content $path
foreach($s in $servers){
    Write-Host Currently Working $s Server from
 $path
    if (-not (Test-Connection -comp $s -quiet)){
       Write-host "$s is down" -ForegroundColor Red
    } else {
        REG ADD "\\$s\HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp" /v fDisableClip /t REG_DWORD /d 1 /f 
    }
}
