*** Settings ***
Documentation    TestSuite related to local users
# ---------------------------------------------------------
Resource            ../../common-general/Keywords/common_kw.robot
# ---------------------------------------------------------
Variables            ../DataFiles/user_data.py


Test Setup    Login_To_VisionGuard_And_Navigate_To_UserPage
Test Teardown    Close All Browsers


*** Test Cases ***
001__Users - Create New Users
    [DOCUMENTATION]    [ 5745 ] : Users -> Create New User (also: 5747, 5760)
    [TAGS]  Users_CreateNew    TC5745    TC5747    TC5760
    FOR    ${user_data}    IN    @{UsersData}
        Create_A_New_User    ${user_data}[UserName]    ${user_data}[UserPWD]    ${user_data}[UserRole]    ${user_data}[UserLang]    ${user_data}[UserColorTheme]
    END

002__Users - Search User
    [DOCUMENTATION]    [ 5749 ] : Users -> Search User (by Username, Role, Dashboard)
    [TAGS]  Users_SearchUser    TC5749
    FOR    ${user_data}    IN    @{UsersData}
        ${user_name} =    Set variable    ${user_data}[UserName]
        ${search_user_result} =    Search_User    ${user_name}
        IF    ${search_user_result} == ${False}
            Log    \n[ WARN ] : User ${user_name} doesn't found !\n    console=${True}
        ELSE
            Clear_Text_Field_By_Clicking_On_X_Icon
        END
    END
    Reload Page
