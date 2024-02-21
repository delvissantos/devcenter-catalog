# Installs the Azure Monitor Agent via client MSI

$packagePath = [System.IO.Path]::GetTempFileName() + ".msi"
  try {
    Invoke-RestMethod -Uri https://delvisstorageeast.blob.core.windows.net/ama/AzureMonitorAgentClientSetupDevboxSupport.msi -OutFile $packagePath
    $logPath = "C:\DevboxAgent\Temp\Logs\AMALogs\0.log"
    New-Item -Force -Path $logPath
    $ArgumentList=@("/i", $packagePath, "/qn", "/li", $logPath)
    Start-Process msiexec -ArgumentList $ArgumentList -Wait -Verbose
} 
catch {
        $streamReader = [System.IO.StreamReader]::new($_.Exception.Response.GetResponseStream())
        $ErrResp = $streamReader.ReadToEnd() | ConvertFrom-Json
        $streamReader.Close()
      }
  $ErrResp
