#Ref. https://docs.microsoft.com/pt-br/office365/enterprise/powershell/add-a-domain-to-a-client-tenancy-with-windows-powershell-for-delegated-access-pe
#Ref. https://devblogs.microsoft.com/scripting/powertip-use-powershell-to-list-all-domains-in-office-365-subscription/


#Conecta ao Microsoft Online Services
Connect-MsolService

#Listar dominios
Get-MsolDomain

#Cria o Dominio
New-MsolDomain -Name synit.com.br

#Lista TXTRecord
Get-MsolDomainVerificationDNS -DomainName synit.com.br -Mode DnsTxtRecord

#Valida Registro DNS
nslookup -type=TXT synit.com.br

#Concluir a criaçao do dominio
Confirm-MsolDomain -DomainName synit.com.br

#Validar se o dominio foi criado
Get-MsolDomain -DomainName synit.com.br

#Exportar resultado
Get-MsolDomain | Export-CSV C:\o365\o365domains.csv