#Save file and run in powershell

Get-WmiObject -query "Select HotFixID  from Win32_QuickFixengineering" | sort-object -Descending -Property HotFixID|%{
	$sUpdate=$_.HotFixID.Replace("KB","")
 	write-host ("Uninstalling update "+$sUpdate);
	& wusa.exe /uninstall /KB:$sUpdate /quiet /norestart;
	# while((Get-Process "wusa" -ErrorAction SilentlyContinue).Count -ge 1){start-sleep 1}
        # Waiting until an existing Hotfix installation finish. Improved by Paul T
        Wait-Process wusa
        Start-Sleep -s 1
}
