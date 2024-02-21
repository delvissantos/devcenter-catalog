# Installs the Azure Monitor Agent via client MSI

$packagePath = [System.IO.Path]::GetTempFileName() + ".msi"
Invoke-RestMethod -Uri https://go.microsoft.com/fwlink/?linkid=2192409 -OutFile $packagePath
$logPath = "C:\DevboxAgent\Temp\Logs\AMALogs\0.log"
New-Item -Force -Path $logPath
$ArgumentList=@("/i", $packagePath, "/qn", "/li", $logPath)
Start-Process msiexec -ArgumentList $ArgumentList -Wait -Verbose
