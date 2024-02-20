# Installs the Azure Monitor Agent via client MSI

$packagePath = [System.IO.Path]::GetTempFileName() + ".msi"
#Invoke-RestMethod -Uri https://go.microsoft.com/fwlink/?linkid=2192409 -OutFile $packagePath
Invoke-RestMethod -Uri https://delvisstorageeast.blob.core.windows.net/ama/AzureMonitorAgentClientSetupDevboxSupport.msi?sp=r&st=2024-02-20T22:28:49Z&se=2024-02-25T06:28:49Z&spr=https&sv=2022-11-02&sr=b&sig=WBgETM7748%2FSf2t8%2Bvq0Qy%2B48F6jAIQi9V3xcKXAQNA%3D -OutFile $packagePath
$logPath = "C:\Temp\AMALogs\0.log"
New-Item -Force -Path $logPath
$ArgumentList=@("/i", $packagePath, "/qn", "/li", $logPath)
Start-Process msiexec -ArgumentList $ArgumentList -Wait -Verbose
