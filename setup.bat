@echo off

echo "Started the setup script."
REM If you used the stand Cygwin installer this will be C:\cygwin
set CYGWIN=C:\programmer\cygwin64

REM You can switch this to work with bash with %CYGWIN%\bin\bash.exe
set SH=%CYGWIN%\bin\bash.exe
set CYGWIN_VAGRANT_FOLDER=/cygdrive/c/Users/alevin/Documents/Project/NORMAP/ansible/nersc-vagrant

"%SH%" -c "/usr/bin/chmod -x %CYGWIN_VAGRANT_FOLDER%/provisioning/hosts"
"%SH%" -c "/usr/bin/sed -i 's/#\[ssh_connection]/\[ssh_connection]/g' %CYGWIN_VAGRANT_FOLDER%/ansible.cfg"
"%SH%" -c "/usr/bin/sed -i 's/#control_path/control_path/g' %CYGWIN_VAGRANT_FOLDER%/ansible.cfg"
REM "%SH%" -c "/usr/bin/sed -i 's/testconda.vm.synced_folder/#testconda.vm.synced_folder/g' %CYGWIN_VAGRANT_FOLDER%/Vagrantfile"

echo "Finished the setup script."

REM PAUSE