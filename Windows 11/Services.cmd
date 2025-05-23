net stop spooler
sc config spooler start= disabled 

net stop bthserv
sc config bthserv start= disabled

net stop fax
sc config fax start= disabled

net stop XblAuthManager
sc config XblAuthManager start= disabled
net stop XblGameSave
sc config XblGameSave start= disabled
net stop XboxNetApiSvc
sc config XboxNetApiSvc start= disabled

net stop lfsvc
sc config lfsvc start= disabled

et stop RemoteRegistry
sc config RemoteRegistry start= disabled

net stop AJRouter
sc config AJRouter start= disabled

net stop NetTcpPortSharing
sc config NetTcpPortSharing start= disabled

net stop WiaRpc
sc config WiaRpc start= disabled

net stop BDESVC
sc config BDESVC start= disabled

net stop TabletInputService
sc config TabletInputService start= disabled

net stop TouchKeyboardAndHandwritingPanelService
sc config TouchKeyboardAndHandwritingPanelService start= disabled

net stop WSearch
sc config WSearch start= disabled

net stop SCardSvr
sc config SCardSvr start= disabled

net stop WpcMonSvc
sc config WpcMonSvc start= disabled

net stop HvHost
sc config HvHost start= disabled

net stop Browser
sc config Browser start= disabled

net stop WMPNetworkSvc  
sc config WMPNetworkSvc start= disabled  

net stop DiagTrack  
sc config DiagTrack start= disabled  

net stop SensorDataService  
sc config SensorDataService start= disabled  

net stop SensrSvc  
sc config SensrSvc start= disabled  









