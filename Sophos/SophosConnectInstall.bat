@echo off



REM ######################
REM # PRORGRAM VARIABLES #
REM #   (change this)    #
REM ######################

REM Location of SophosConnect Installer MSI
SET Sophos_Conect_Msi_Path=\\adv-fs01\Data\SophosConnect\SophosConnect_2.1.20_(IPsec_and_SSLVPN).msi

REM Location of SophosConnect Provisioning file
REM Will be copied localy and used to configure Sophos Connect
SET Sophos_Conect_Provisioning_File_Path=\\adv-fs01\Data\SophosConnect\grafixSophos.pro



REM #######################
REM #    PRORGRAM LOGIC   #
REM # (don't change this) #
REM #######################

REM Expected location of scvpn executable in ProgramFiles dir
SET Sophos_Conect_Local_Install_Path_Relative=Sophos\Connect
SET Sophos_Conect_Program_Name=scvpn.exe
SET Sophos_Conect_Local_Install_Path_Full=%ProgramFiles(x86)%\%Sophos_Conect_Local_Install_Path_Relative%

REM Change install path if 32-bit
IF "%PROCESSOR_ARCHITECTURE%" == "x86" (
	SET Sophos_Conect_Local_Install_Path_Full=%ProgramFiles%\%Sophos_Conect_Local_Install_Path_Relative%
)

SET Sophos_Conect_Import_Path=%Sophos_Conect_Local_Install_Path_Full%\import
SET Sophos_Conect_Program_Gui_Path=%Sophos_Conect_Local_Install_Path_Full%\GUI
SET Sophos_Conect_Program_Gui_Name=scgui.exe

REM Is SophosConenct already installed?
IF EXIST "%Sophos_Conect_Local_Install_Path_Full%\%Sophos_Conect_Program_Name%" (
	echo Already Installed
	exit /b 0
)
REM Install package quietly without user input
msiexec.exe /i %Sophos_Conect_Msi_Path% /QN

REM Move config into import directory for Sophos Connect to Pickup
REM Sophos Connect will auto-delete this file after importing
copy "%Sophos_Conect_Provisioning_File_Path%" "%Sophos_Conect_Import_Path%"

REM Run sophos connect
START /d "%Sophos_Conect_Program_Gui_Path%" %Sophos_Conect_Program_Gui_Name%
