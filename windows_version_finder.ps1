Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Windows Version Finder'
$form.Size = New-Object System.Drawing.Size(320,200)
$form.StartPosition = 'CenterScreen'
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,120)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(300,20)
$label.Font = New-Object System.Drawing.Font("Calibri",14,[System.Drawing.FontStyle]::Regular)
$label.Text = 'Please enter hostname'
$form.Controls.Add($label)
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,70)
$textBox.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($textBox)
$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $VMName = $textBox.Text
}

$Computers = Get-AdComputer -Filter * -Properties Name,OperatingSystem,OperatingSystemVersion | Where Name -Like $VMName | Select-Object Name,OperatingSystem,OperatingSystemVersion

Foreach 
($Computer in $Computers){

$vmname = $Computer.Name
$build = $Computer.OperatingSystemVersion
$os = $Computer.OperatingSystem
$buildno=$build.Replace("(","").Replace(")","").Replace("10.0 ","")

#servers
if($buildno -eq 20348){$buildno = "21H2"}
if($buildno -eq 17763){$buildno = "1809"}
if($buildno -eq 16299){$buildno = "1709"}
if($buildno -eq 14393){$buildno = "1607"}
if($buildno -eq "6.3 9600"){$buildno = "NT 6.3"}
if($buildno -eq "6.3 9200"){$buildno = "NT 6.2"}
#win10
if($buildno -eq 19045){$buildno = "22H2"}
if($buildno -eq 19044){$buildno = "21H2"}
if($buildno -eq 19043){$buildno = "21H1"}
if($buildno -eq 19042){$buildno = "20H2"}
if($buildno -eq 19041){$buildno = "2004"}
if($buildno -eq 18363){$buildno = "1909"}
if($buildno -eq 18362){$buildno = "1903"}
if($buildno -eq 17134){$buildno = "1803"}
if($buildno -eq 16299){$buildno = "1709"}
if($buildno -eq 15063){$buildno = "1703"}
if($buildno -eq 14393){$buildno = "1607"}
if($buildno -eq 10586){$buildno = "1511"}
if($buildno -eq 10240){$buildno = "1507"}

[System.Windows.Forms.MessageBox]::Show($vmname +" is "+$os+" version "+$buildno, "Windows Version Found!", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

}

