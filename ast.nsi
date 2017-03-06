; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "Конвертер тестов из АСТ-Тест в MoodleXML"
!define APPNAMEANDVERSION "Конвертер тестов из АСТ-Тест в MoodleXML (20170307)"

; Main Install settings
Name "${APPNAMEANDVERSION}"
RequestExecutionLevel user
InstallDir "$LOCALAPPDATA\AST-Test to MoodleXML converter for Word"
InstallDirRegKey HKCU "Software\${APPNAME}" ""
OutFile "Install converter.exe"

Section "AST-Test to MoodleXML converter for Word"

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$APPDATA\Microsoft\Word\STARTUP\"
	File "AST.dotm"
	SetOutPath "$INSTDIR\"
	File "Examples.docx"
	File "User manual.docx"
	CreateDirectory "$LOCALAPPDATA\AST-Test to MoodleXML converter for Word"
	CreateDirectory "$SMPROGRAMS\Конвертер тестов из АСТ-Тест в MoodleXML"
	CreateShortCut "$SMPROGRAMS\Конвертер тестов из АСТ-Тест в MoodleXML\Руководство пользователя.lnk" "$INSTDIR\User manual.docx"
	CreateShortCut "$SMPROGRAMS\Конвертер тестов из АСТ-Тест в MoodleXML\Примеры использования.lnk" "$INSTDIR\Examples.docx"
	CreateShortCut "$SMPROGRAMS\Конвертер тестов из АСТ-Тест в MoodleXML\Удалить конвертер.lnk" "$INSTDIR\uninstall.exe"

SectionEnd

Section -FinishSection

	WriteRegStr HKCU "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

;Uninstall section
Section Uninstall

	;Remove from registry...
	DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKCU "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$SMPROGRAMS\Конвертер тестов из АСТ-Тест в MoodleXML\Руководство пользователя.lnk"
	Delete "$SMPROGRAMS\Конвертер тестов из АСТ-Тест в MoodleXML\Примеры использования.lnk"
	Delete "$SMPROGRAMS\Конвертер тестов из АСТ-Тест в MoodleXML\Удалить конвертер.lnk"

	; Clean up AST-Test to MoodleXML converter for Word
	Delete "$APPDATA\Microsoft\Word\STARTUP\AST.dotm"
	Delete "$INSTDIR\User manual.docx"
	Delete "$INSTDIR\Examples.docx"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\Конвертер тестов из АСТ-Тест в MoodleXML"
	RMDir "$INSTDIR"

SectionEnd

Function un.onInit

	MessageBox MB_YESNO|MB_DEFBUTTON2|MB_ICONQUESTION "Удалить ${APPNAMEANDVERSION}?" IDYES DoUninstall
		Abort
	DoUninstall:

FunctionEnd

; eof