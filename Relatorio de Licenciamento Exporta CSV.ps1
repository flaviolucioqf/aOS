Connect-MsolService

Get-MsolUser -userprincipalname flavio@synit.com.br | FL

$a = Get-MsolUser -All | ft DisplayName, UserPrincipalName, ProxyAddresses, IsLicensed, Licenses, LastLogon
out-file -filepath C:\temp\report-usuarios.csv -inputobject $a -encoding ASCII -Width 1000