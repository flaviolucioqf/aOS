#Baixe e instale o Assistente de Conexão do Microsoft Online Services e o Módulo Microsoft Azure Active Directory para Windows PowerShell 
#https://technet.microsoft.com/library/dn975125.aspx


#Conecta ao Microsoft Online Services
Connect-MsolService

#Exibe licenças do tenant
Get-MsolAccountSku

#Exibe produtos da Licença
Get-MsolAccountSku | Where-Object {$_.SkuPartNumber -eq "ENTERPRISEPREMIUM"} | ForEach-Object {$_.ServiceStatus}

#Cria um unico usuario
New-MsolUser -DisplayName "Flavio Ferreira" -FirstName Flavio -LastName Ferreira -UserPrincipalName flavio@mctday.com.br -UsageLocation pt-br -LicenseAssignment "ENTERPRISEPREMIUM"

#Cria e licencia Usuários baseado em arquivo CSV
Import-Csv -Path "C:\O365\ListaUsuarios.csv" | foreach {New-MsolUser -DisplayName $_.DisplayName -FirstName $_.FirstName -LastName $_.LastName -UserPrincipalName $_.UserPrincipalName -UsageLocation $_.UsageLocation -LicenseAssignment $_.AccountSkuId} | Export-Csv -Path "C:\O365\Resultados.csv"

#Cria Usuarios baseado em arquivo CSV
Import-Csv -Path "C:\O365\ListaUsuarios2.csv" | foreach {New-MsolUser -DisplayName $_.DisplayName -FirstName $_.FirstName -LastName $_.LastName -UserPrincipalName $_.UserPrincipalName -UsageLocation $_.UsageLocation} | Export-Csv -Path "C:\O365\Resultados.csv"
