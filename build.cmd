@echo off

setlocal enabledelayedexpansion
:: �汾�б�
set "PROJECTS[0]=forge_1_7_10"
set "PROJECTS[1]=forge_1_12_2"
set "PROJECTS[2]=forge_1_14_4"
set "PROJECTS[3]=forge_1_15_2"
set "PROJECTS[4]=forge_1_16_5"
set "PROJECTS[5]=forge_1_17_1"
set "PROJECTS[6]=forge_1_18_2"
set "PROJECTS[7]=forge_1_19_2"
set "PROJECTS[8]=forge_1_19_3"
set "PROJECTS[9]=forge_1_20"
set "PROJECTS[10]=forge_1_20_4"
set "PROJECTS[11]=forge_1_20_6"
set "PROJECTS[12]=forge_1_21"
set "PROJECTS[13]=fabric_1_14_4"
set "PROJECTS[14]=fabric_1_15_2"
set "PROJECTS[15]=fabric_1_16_5"
set "PROJECTS[16]=fabric_1_17_1"
set "PROJECTS[17]=fabric_1_18_2"
set "PROJECTS[18]=fabric_1_19"
set "PROJECTS[19]=fabric_1_19_3"
set "PROJECTS[20]=fabric_1_19_4"
set "PROJECTS[21]=fabric_1_20"
set "PROJECTS[22]=fabric_1_20_6"
set "PROJECTS[23]=fabric_1_21"
set "PROJECTS[24]=fabric_1_21_3"
set "PROJECTS[25]=fabric_1_21_5"
set "PROJECTS[26]=fabric_1_21_6"
set "PROJECTS[27]=neoforge_1_20_4"
set "PROJECTS[28]=neoforge_1_20_6"
set "PROJECTS[29]=neoforge_1_21"
set "PROJECTS[30]=neoforge_1_21_3"
set "PROJECTS[31]=neoforge_1_21_5"
set "PROJECTS[32]=neoforge_1_21_6"
set "PROJECTS[33]=fabric_1_21_1"

set /a ARRAY_LENGTH=33

cls

set "LINK_SCRIPT=link.cmd"
echo ����ִ��Ԥ�����ű�: %LINK_SCRIPT%
call "%LINK_SCRIPT%" || (
    echo Ԥ�����ű�ʧ�ܣ��˳���������
    pause
    exit /b 1
)

:menu
cls
echo AllMusic�ͻ��˱���
echo ѡ����Ҫ�����İ汾��
echo ----------------------------

:: ���ɲ˵�ѡ��
for /L %%i in (0,1,%ARRAY_LENGTH%) do (
    call echo  [%%i] - %%PROJECTS[%%i]%%
)
echo ----------------------------
echo ������Ҫ�������Ŀ��� (0-%ARRAY_LENGTH%):
set /p SELECTION=?

:: ��֤�����Ƿ�Ϊ����
if not defined SELECTION (
    echo ����δ������
    pause
    goto :menu
)
if not "%SELECTION%" == "" (
    set /a SELECTION=%SELECTION%
    if %SELECTION% LSS 0 (
        echo �������벻��С��0
        pause
        goto :menu
    )
    if %SELECTION% GEQ %ARRAY_LENGTH%+1 (
        echo �������볬���������%ARRAY_LENGTH%
        pause
        goto :menu
    )
)

:: ��ȡѡ��·��������̷�/·��
call set "SELECTED_PATH=%%PROJECTS[%SELECTION%]%%"

:: ���·��������
if not exist "%SELECTED_PATH%" (
    echo ����·�������� - %SELECTED_PATH%
    pause
    goto :menu
)

:: ִ��Ŀ¼�л�
cd /D "%SELECTED_PATH%"

:: ��ʾ��ǰ·����ִ�б���
echo ��ǰ����Ŀ¼��
cd
echo ����ִ��Gradle����...
call gradlew build

:: ����������
if %ERRORLEVEL% EQU 0 (
    echo ����ɹ�������λ�ã�build\libs
) else (
    echo ����ʧ�ܣ����������Ϣ
)
pause

goto :menu