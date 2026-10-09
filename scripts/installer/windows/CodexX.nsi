Unicode true
!include "MUI2.nsh"

!ifndef VERSION
  !define VERSION "0.0.0"
!endif
!define ROOT "..\..\.."

Name "小智助手"
OutFile "${ROOT}\dist\windows\小智助手-${VERSION}-windows-x64-setup.exe"
InstallDir "$LOCALAPPDATA\Programs\小智助手"
InstallDirRegKey HKCU "Software\小智助手" "InstallDir"
RequestExecutionLevel admin
SetCompressor /SOLID lzma

!define MUI_ICON "${ROOT}\apps\codexx-manager\src-tauri\icons\icon.ico"
!define MUI_UNICON "${ROOT}\apps\codexx-manager\src-tauri\icons\icon.ico"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "English"

Section "Install"
  SetOutPath "$INSTDIR"

  nsExec::ExecToLog 'taskkill /IM codexgo.exe /F'
  Pop $0
  nsExec::ExecToLog 'taskkill /IM codexgo-manager.exe /F'
  Pop $0

  File "${ROOT}\dist\windows\app\codexgo.exe"
  File "${ROOT}\dist\windows\app\codexgo-manager.exe"
  File "${ROOT}\dist\windows\app\WebView2Loader.dll"
  File "${ROOT}\assets\images\codex-go.ico"
  File "${ROOT}\assets\images\tray-icon.ico"

  Delete "$DESKTOP\小智助手 绠＄悊宸ュ叿.lnk"
  Delete "$SMPROGRAMS\小智助手\小智助手 绠＄悊宸ュ叿.lnk"

  CreateShortcut "$DESKTOP\小智助手.lnk" "$INSTDIR\codexgo.exe" "" "$INSTDIR\codexgo.exe" 0
  CreateDirectory "$SMPROGRAMS\小智助手"
  CreateShortcut "$SMPROGRAMS\小智助手\小智助手.lnk" "$INSTDIR\codexgo.exe" "" "$INSTDIR\codexgo.exe" 0
  CreateShortcut "$SMPROGRAMS\小智助手\卸载 小智助手.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\codexgo.exe" 0

  WriteUninstaller "$INSTDIR\uninstall.exe"
  WriteRegStr HKCU "Software\小智助手" "InstallDir" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\小智助手" "DisplayName" "小智助手"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\小智助手" "DisplayVersion" "${VERSION}"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\小智助手" "Publisher" "BigPizzaV3"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\小智助手" "DisplayIcon" "$INSTDIR\codexgo.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\小智助手" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\小智助手" "UninstallString" "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
  nsExec::ExecToLog 'taskkill /IM codexgo.exe /F'
  Pop $0
  nsExec::ExecToLog 'taskkill /IM codexgo-manager.exe /F'
  Pop $0

  Delete "$DESKTOP\小智助手.lnk"
  Delete "$DESKTOP\小智助手 Manager.lnk"
  Delete "$DESKTOP\小智助手 绠＄悊宸ュ叿.lnk"
  Delete "$SMPROGRAMS\小智助手\小智助手.lnk"
  Delete "$SMPROGRAMS\小智助手\小智助手 Manager.lnk"
  Delete "$SMPROGRAMS\小智助手\小智助手 绠＄悊宸ュ叿.lnk"
  Delete "$SMPROGRAMS\小智助手\卸载 小智助手.lnk"
  RMDir "$SMPROGRAMS\小智助手"

  Delete "$INSTDIR\codexgo.exe"
  Delete "$INSTDIR\codexgo-manager.exe"
  Delete "$INSTDIR\WebView2Loader.dll"
  Delete "$INSTDIR\codex-go.ico"
  Delete "$INSTDIR\tray-icon.ico"
  Delete "$INSTDIR\uninstall.exe"
  RMDir "$INSTDIR"

  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\小智助手"
  DeleteRegKey HKCU "Software\小智助手"
SectionEnd
