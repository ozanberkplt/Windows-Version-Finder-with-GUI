# powershell

If you need to find the version of Windows running on a remote computer, you can use PowerShell to quickly get the information you need. In this blog post, we will look at a PowerShell script that will allow you to find the version of Windows running on a remote computer.

The script uses the Get-AdComputer cmdlet to get the computer object for the specified hostname. It then checks the OperatingSystemVersion property to determine the version of Windows running on the computer.

![image](https://user-images.githubusercontent.com/126490367/221594191-3e002b4d-998f-4a02-ad53-05589dc36f0e.png)
![image](https://user-images.githubusercontent.com/126490367/221594250-90f873db-23d8-47fb-bb65-ffe8d944eda3.png)
