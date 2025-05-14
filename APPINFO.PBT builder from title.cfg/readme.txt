These powershell scripts:
(update_appinfo_recursive.ps1 and update_appinfo_non-recursive.ps1)
will create APPINFO.PBT if title.cfg is found. 

SAS stands for Save Application Structure
Basically apps going forward in the community will be installed into 1-3 places.
memorycard:/APPFOLDER
nonmemorycard:/APPFOLDER
nonmemorycard:/APPS/APPFOLDER

The biggest benefit now is with title.cfg parsing, one can download an AIO (All-In-One) megapack, and given that the app has a finished title.cfg, the powershell script will create or update APPINFO.PBT as needed. HOWEVER if apps are buried deeper than the above for whatever reason, you will need to move around as needed for your situation. 

add more info please.....