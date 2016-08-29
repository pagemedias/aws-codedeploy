@echo off

REM Make temp directory for MSI
if not exist "c:\temp" mkdir c:\temp

REM Get MSI
powershell.exe -Command Read-S3Object -BucketName aws-codedeploy-ap-southeast-2 -Key latest/codedeploy-agent.msi -File c:\temp\codedeploy-agent.msi

REM Install MSI
c:\temp\codedeploy-agent.msi /quiet /l c:\temp\host-agent-install-log.txt

REM Check that installed
powershell.exe -Command Get-Service -Name codedeployagent
