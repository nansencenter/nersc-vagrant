@echo off
echo RUNNING SCRIPT
REM If you used the stand Cygwin installer this will be C:\cygwin
set CYGWIN=C:\programmes\cygwin64

REM You can switch this to work with bash with %CYGWIN%\bin\bash.exe
set SH=%CYGWIN%\bin\bash.exe
set cmd="%SH% -c pwd"
FOR /F %%i IN (' %cmd% ') DO SET CYGWIN_VAGRANT_FOLDER=%%i

"%SH%" -c "/usr/bin/chmod -x %CYGWIN_VAGRANT_FOLDER%/provisioning/hosts"
"%SH%" -c "/usr/bin/sed -i 's/#\[ssh_connection]/\[ssh_connection]/g' %CYGWIN_VAGRANT_FOLDER%/ansible.cfg"
"%SH%" -c "/usr/bin/sed -i 's/#control_path/control_path/g' %CYGWIN_VAGRANT_FOLDER%/ansible.cfg"
REM "%SH%" -c "/usr/bin/sed -i 's/testconda.vm.synced_folder/#testconda.vm.synced_folder/g' %CYGWIN_VAGRANT_FOLDER%/Vagrantfile"

REM PAUSE