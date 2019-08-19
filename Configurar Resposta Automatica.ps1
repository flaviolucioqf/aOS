########################################################################################
#                                                                                      #
#                                                                                      #
#                           DESENVOLVIDO POR FLAVIO FERREIRA                           #
#                                                                                      #
#                                  FLAVIO@SYNIT.COM.BR                                 #
#                                                                                      #
#                                    www.SynIT.com.br                                  #
#                                  www.TIComUai.com.br                                 #
#                                                                                      #
#                                                                                      #
########################################################################################

#Referencia: https://technet.microsoft.com/pt-br/library/dd638217(v=exchg.160).aspx


#Conecta no Office 365
$LiveCred = Get-Credential 
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell/ -Credential $LiveCred -Authentication Basic -AllowRedirection
Import-PSSession $Session

#Libera execução de script em seu computador
Set-ExecutionPolicy unrestricted

#Exibe informações referente a resposta automatica
get-MailboxAutoReplyConfiguration flavio@synit.com.br


############################## CONFIGURA RESPOSTA AUTOMATICA ##############################

#Configura Resposta Automatica para cada usuário
Set-MailboxAutoReplyConfiguration flavio@synit.com.br –AutoReplyState Scheduled –StartTime “08/13/2019 00:00:00” –EndTime “08/13/2019 23:59:00” –InternalMessage “<html><body>Caros parceiros,<br> Estarei participando do evento aOS Sao Paulo hoje. Para assuntos urgentes favor entrar em contato através do WhatsApp (34) 98848-8195.<br>Um grande abraço e um excelente final de dia!<br></body></html>” –ExternalMessage “<html><body>Caros parceiros,<br> Estarei participando do evento aOS Sao Paulo hoje. Para assuntos urgentes favor entrar em contato através do WhatsApp (34) 98848-8195.<br>Um grande abraço e um excelente final de dia!<br></body></html"


#Configura Resposta Automatica para usuarios que estão no arquivo CSV
Import-Csv c:\o365\ConfigRespAutomatica.csv | ForEach-Object {Set-MailboxAutoReplyConfiguration -UserPrincipalName $_.UserPrincipalName –AutoReplyState Scheduled –StartTime “12/23/2017” –EndTime “01/01/2018” –InternalMessage “<html><body>Caros parceiros,<br> A SYN IT estará em recesso entre os dias 24/12/17 a 01/01/2018. Para assuntos urgentes favor entrar em contato através do WhatsApp (34) 98848-8195.<br>Um ótimo natal e um feliz Ano Novo!<br></body></html>” –ExternalMessage “<html><body>Caros parceiros,<br> A SYN IT estará em recesso entre os dias 24/12/17 a 01/01/2018. Para assuntos urgentes favor entrar em contato através do WhatsApp (34) 98848-8195.<br>Um ótimo natal e um feliz Ano Novo!<br></body></html>”}


############################## ATENÇÃO ##############################
#Para usar o arquivo CSV crie a pasta C:\O365\ e descompacte o dois arquivos na pasta.
#Preencha o arquivo CSV com todos os e-mails (não apague a primeira linha)
#Execute o script para criação de resposta automatica através do CSV