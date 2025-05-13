These powershell scripts:
(update_appinfo_recursive.ps1 and update_appinfo_non-recursive.ps1)
will create APPINFO.PBT if title.cfg is found. 

SAS stands for Save Application Structure
Basically apps going forward in the community will be installed into 1-3 places.
memorycard:/APPFOLDER
nonmemorycard:/APPFOLDER
nonmemorycard:/APPS/APPFOLDER

Apps found at ps2wiki.github.com come as PSUs, essentially packed file that can be exported to root of memory card and ready to go. 
Sadly due to a wildcard search bug ONLY in root of memory card, APPINFO.PBT cannot exist simply in memcorycard:/*/APPINFO.PBT
So my solution is that for memory card, apps will be installed to root, which 

add more info please.....