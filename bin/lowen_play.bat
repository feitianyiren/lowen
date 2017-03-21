title Lowen
@echo version 2.1
@echo off

::set basePath=g:\lwh\xwandou\code\monkeytest\
set basePath=%1
echo basePath:%basePath%
set mr=%2
set mrconfig=%3
set mrname=%4
set deviceid=%5
echo mr:%mr%
echo mrconfig:%mrconfig%
echo mrname:%mrname%
echo deviceid:%deviceid%



echo -
echo -
echo -

::-------------------------------------------------------step-1-----------------------------------------------------------------------------
echo ----%time%----1.��ʼ��·����ʱ��-------------

::>>>> �˴�·����Ҫ�޸� >>>>
echo                 pkg           ��ʾ���Ե�apk����
::set pkg=com.ebest.sfa
CALL %basePath%bin\readConfig %mrconfig% pkgkey pkg 
ECHO %pkg%
echo                 apkPath       ��ʾ���Ե�apk·��
::set apkPath=E:/lwh/apk/SFADali-2.1.0.1-1230-03-beta.apk
CALL %basePath%bin\readConfig %mrconfig% apkPathkey apkPath 
echo                 act           ��ʾ���Ե�apk����activity
::set act=com.ebest.sfa/com.ebest.sfa.login.activity.LoginActivity
CALL %basePath%bin\readConfig %mrconfig% actkey act 
echo                 mr            ��ʾ���Ե�apk¼�ƵĽű�·��
CALL %basePath%bin\readConfig %mrconfig% moudlekey moudleName 
::<<<< �˴�·����Ҫ�޸� <<<<

set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set currentTestName=%moudleName%_%mrname%_%deviceid%_%date:~0,4%%date:~5,2%%date:~8,2%_%currentHour%%time:~3,2%%time:~6,2%
set starttime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
::set basePath=g:\lwh\xwandou\code\monkeytest\
if not exist %basePath%out\%currentTestName% mkdir %basePath%out\%currentTestName%


copy %apkPath% %basePath%out\%currentTestName%\
::-------------------------------------------------------step-1-----------------------------------------------------------------------------


echo ----------------------��ʼ���� %currentTestName%------------------------------------

::-------------------------------------------------------step-2-----------------------------------------------------------------------------
echo ----%time%----2.�����̼߳�¼cpu���ڴ����־-------------
start %basePath%\bin\apkinfo.bat %pkg% %basePath%out\%currentTestName% %deviceid%
::-------------------------------------------------------step-2-----------------------------------------------------------------------------


::-------------------------------------------------------step-3-----------------------------------------------------------------------------
echo ----%time%----3.�����̼߳�¼adb log��־-------------
start %basePath%\bin\log.bat %basePath%out\%currentTestName% %deviceid%
::-------------------------------------------------------step-3-----------------------------------------------------------------------------


::-------------------------------------------------------step-4-----------------------------------------------------------------------------
echo ----%time%----4.ִ��py�ű�-------------
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\sfadaka2.mr  %currentTestName%  %basePath%
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\kasfa_huawei_c199.mr  %currentTestName%  %basePath%
::call monkeyrunner %basePath%tools\monkey_playbackNew.py %basePath%mr\kasfa_huawei_c199_qingjia.mr  %currentTestName%  %basePath%
call monkeyrunner %basePath%tools\monkey_playbackNew.py pkg=%pkg% apkPath=%apkPath% act=%act%  mr=%mr%  name=%currentTestName%  basePath=%basePath% scale=scale screen=480.800 deviceid=%deviceid%  
::-------------------------------------------------------step-4-----------------------------------------------------------------------------


::-------------------------------------------------------step-5-----------------------------------------------------------------------------
echo ----%time%-----5.����Ƭ���ˮӡ------------------
java -jar %basePath%bin\ImageMarkClickLogo.jar  -cl c=#000000 s=50 out=%basePath%out\%currentTestName%\
::-------------------------------------------------------step-5-----------------------------------------------------------------------------


::-------------------------------------------------------step-6-----------------------------------------------------------------------------
echo ----%time%----6.�رռ�¼��־���̣߳��رմ��ڣ�-------------
taskkill  /FI "WINDOWTITLE eq AndroidInfo_%deviceid%"
taskkill  /FI "WINDOWTITLE eq AndroidMonkeyLog_%deviceid%"
::-------------------------------------------------------step-6-----------------------------------------------------------------------------


::-------------------------------------------------------step-7-----------------------------------------------------------------------------
echo ----%time%----7.��ȡadb log��־ �ж��Ƿ�crash-------------
set rrrstr=�ɹ�
findstr   %pkg% %basePath%out\%currentTestName%\androidlog.txt
set rrr=%errorlevel%
::if %rrr%==0 echo --------------------�ű�(%currentTestName%)������Crash------------------- else echo �ű�(%currentTestName%)����ok
if %rrr%==0 set rrrstr=ʧ��|echo --------------------�ű�(%currentTestName%)������Crash------------------- else echo �ű�(%currentTestName%)����ok
::-------------------------------------------------------step-7-----------------------------------------------------------------------------


::-------------------------------------------------------step-8-----------------------------------------------------------------------------
echo ----%time%----8.���html����-------------
set currentHour=%time:~0,2%
if "%time:~0,1%"==" " set currentHour=0%time:~1,1%
set endtime=%date:~0,4%-%date:~5,2%-%date:~8,2%_%currentHour%:%time:~3,2%:%time:~6,2%
java -jar %basePath%\bin\HtmlOutPutCore.jar   out=%currentTestName% path=%basePath%  apkPath=%apkPath% aaptPath=%basePath%bin\aapt.exe result=%rrrstr% starttime=%starttime% endtime=%endtime%
::-------------------------------------------------------step-8-----------------------------------------------------------------------------

echo ----------------------�������� %currentTestName%------------------------------------






