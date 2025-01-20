run-RF:

robot --variable work_env:VM_personal_C9001947 --outputdir results\all-tests\ -e licensing -e local_user --listener allure_robotframework .\*\Tests\*
robot --variable work_env:VM_personal_C9001947 --outputdir results\all-tests\ --listener XXXXX .\*\Tests\*

robot --variable work_env:VM_local_EEIC-EATON --outputdir results\ .\*\Tests
robot --variable work_env:VM_local_personal_C9001947_EEIC --outputdir results\all-tests\ -e licensing -e local_user .\*\Tests\*

robot --outputdir C:\Users\C9001947\RF_projects\RF_VisionGuard\Results RF_projects\RF_VisionGuard\Tests\getJWT_call-API_hybrid.robot

robot --variable work_env:VM_local_personal_C9001947_EEIC --outputdir ..\..\work-tmp_RF_VG\results\test-mqtt\ -i mqtt_subscribe .\Tests\MqttTests\mqtt_test.robot
robot --variable work_env:VM_local_personal_C9001947_EEIC --outputdir ..\..\work-tmp_RF_VG\results\test-configuration_VGnameInstanceNum_CfgPageAccessRights\ -i TC6016 .\Tests\UiTests\ui_configuration_tst.robot

robot --variable work_env:VM_local_personal_C9001947_EEIC --outputdir results\backup-restore\ -i TC6956 -i TC6957 -i TC5821 .\backup-restore\Tests\ui_backup-restore_all-in-one_tst.robot

allure-report:
	robot --variable work_env:VM_personal_C9001947 --outputdir results\all-tests\ -e licensing --listener allure_robotframework .\*\Tests\*
	allure generate .\output\allure
	allure open .\allure-report


robot -A, --argumentfile <path>
			--variable work_env:VM_local_EEIC-EATON
			--outputdir results\mqtt-system-tests\
			-s 01__mqtt_system-lifesignal_tst
			-s 02__mqtt_system-edit_tst
			-s 03__ui_system-module-check_tst
			-s 04__mqtt_system-rollback-status_tst