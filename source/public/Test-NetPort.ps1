Function tcping {
       param (
              [Parameter(Position=0, Mandatory=$true)]
              [ValidateNotNullOrEmpty()]
              [string[]]
              $Server,

              [Parameter(Position=1, Mandatory=$true)]
              [ValidateNotNullOrEmpty()]
              [string[]]
              $Port,

              [Parameter(Position=2)]
              [int]
              $TimeOut = 2
       )

       [int]$TimeOutMS = $TimeOut*1000
       $IP = [System.Net.Dns]::GetHostAddresses($Server)
       $Address = [System.Net.IPAddress]::Parse($IP[0])
       $Socket = New-Object System.Net.Sockets.TCPClient

       Write-Host "Connecting to $Address on port $Port" -ForegroundColor Cyan
       Try {
              $Connect = $Socket.BeginConnect($Address,$Port,$null,$null)
       }
       Catch {
              Write-Host "$Server is NOT responding on port $Port" -ForegroundColor Red
              Write-Host ""
        Return $false
              Exit
       }

       Start-Sleep -Seconds $TimeOut

       if ( $Connect.IsCompleted )
       {
              $Wait = $Connect.AsyncWaitHandle.WaitOne($TimeOutMS,$false)
              if(!$Wait)
              {
                     $Socket.Close()
                     Write-Host "$Server is NOT responding on port $Port" -ForegroundColor Red
            Return $false
              }
              else
              {
                     Try {
                           $Socket.EndConnect($Connect)
                           Write-Host "$Server IS responding on port $Port" -ForegroundColor Green
                Return $true
                     }
                     Catch { Write-Host "$Server is NOT responding on port $Port" -ForegroundColor Red }
                     $Socket.Close()
            Return $false
              }
       }
       else
       {
              Write-Host "$Server is NOT responding on port $Port" -ForegroundColor Red
        Return $false
       }
       Write-Host ""

}