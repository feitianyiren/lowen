@title bat�Զ�������

@echo off
@set version=3.1
@if '%1'=='' (
    goto help
)
@if %1==-v (
    echo  .
    python -V
    echo  .
    adb version
    echo  .
    echo Lowen�汾��:%version%
    goto endBat
)

@if %1==-h (
    :help
    echo  -------------------�����ĵ�-------------------------
    echo  
    echo                  -v     �汾��
    echo                  -h     �����ĵ�
    echo                  -p     �����Զ���ű�¼��
    echo                  -c     ���outĿ¼
    echo                  -s     �������Է���
    echo                  -monkey     ����monkey���Է���
    echo   
    echo  ----------------------------------------------------
    goto endBat
)

@if %1==-p (
    monkeyrunner %~dp0\tools\monkey_recorder.py
    goto endBat
)

@if %1==-s (
    ::call bin\main.bat %~dp0
    call python bin\launch.py %~dp0 
)
@if %1==-c (
    rm -rf out
    goto endBat
)
:: echo ��ǰ·����%cd%
:: @echo ��ǰ������ȫ·����%~f0
:: @echo ��ǰ������Ŀ¼·����!cd!
:: echo ��ǰ�̷���%~d0
:: echo ��ǰ·����%cd%
:: echo ��ǰִ�������У�%0
:: echo ��ǰbat�ļ�·����%~dp0
:: echo ��ǰbat�ļ���·����%~sdp0

    


:: pause
:endBat