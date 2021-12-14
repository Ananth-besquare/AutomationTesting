*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${login_btn}    dt_login_button
${submit}   //*[text()="Log in"]
${dropdown}     dt_core_account-info_acc-info
&{real_active}  //*[@class="dc-tabs__item dc-tabs__active dc-tabs__active--acc-switcher__list-tabs dc-tabs__item--top dc-tabs__item--acc-switcher__list-tabs"]
${demo_acc}     //*[@id="dt_core_account-switcher_demo-tab"]
${demo_balance}     //*[@id="dt_VRTC4795352"]/span

*** Keyword ***
Login
    [arguments]     ${email}        ${pw}
    open browser        https://app.deriv.com/      chrome
    maximize browser window
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    wait until page contains element    ${login_btn}     60
    click element   ${login_btn}
    wait until page contains element    ${submit}     60
    input text      txtEmail     ${email}
    input password      txtPass     ${pw}
    click element       ${submit}

Check Account
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    click element       ${dropdown}
    click element       dt_core_account-switcher_demo-tab
    click element   ${demo_balance}


*** Test Cases ***
Deriv Login
    Login   ${my_email}     ${my_pw}

Check Account
    Check Account