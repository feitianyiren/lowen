

@echo ִ��sfa ¼�ƽű�����
::1������2���·��
echo ----------------------��ʼ����------------------------------------
::adb shell top -n 1 -d 0.5 | grep %1>%2cpuinfo.txt
::adb shell top -n 1 -d 0.5 | grep eBest.mobile.android

::adb shell dumpsys meminfo %1 |grep "Dalvik">%2meminfo.txt
::adb shell dumpsys meminfo "eBest.mobile.android" |grep "TOTAL"


::mkdir G:\lwh\xwandou\code\monkeytest\meminfo\

::ping�������ڵȴ���������N��
::for /l %%i in (1,1,200) do  ping 13.3.0.1 -n 1 -w 4000 >nul| @echo %%i|adb shell dumpsys meminfo eBest.mobile.android |grep "Dalvik">>%2\meminfo\meminfo.txt|adb shell top -n 1 -d 0.5 | grep %1>>%2\cpuinfo\cpuinfo.txt
::for /l %%i in (1,1,200) do  ping 13.3.0.1 -n 1 -w 4000 >nul| @echo %%i_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%|adb shell dumpsys meminfo eBest.mobile.android |grep "Dalvik">>G:\lwh\xwandou\code\monkeytest\meminfo\%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%meminfo.txt

for /l %%i in (1,1,200) do  (
:start
ping 13.3.0.1 -n 1 -w 4000 >nul
@echo %%i_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
adb shell dumpsys meminfo eBest.mobile.android |grep "Dalvik">>G:\lwh\xwandou\code\monkeytest\meminfo\%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%meminfo.txt
goto start
)
echo ----------------------��������------------------------------------

pause
