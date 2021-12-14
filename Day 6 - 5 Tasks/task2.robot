*** Settings ***
Library  SeleniumLibrary
Library     String

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
    wait until page contains element    dt_core_account-switcher_demo-tab
    click element       dt_core_account-switcher_demo-tab
    click element   ${demo_balance}
    reload page

Clear Input
    [arguments]     ${text_field}
    wait until page contains element     ${text_field}    5
    ${current_value}    GET ELEMENT ATTRIBUTE   ${text_field}   value
    ${value_length}     Get Length  ${current_value}
    Repeat Keyword  ${value_length}     Press Keys  ${text_field}   DELETE

Buy Contract
    wait until page does not contain element    dt_core_header_acc-info-preloader   20
    wait until page does not contain element     //*[@class="chart-container__loader"]   20
    wait until page contains element    //*[@class="cq-symbol-select-btn"]     20
    click element       //*[@class="cq-symbol-select-btn"]
    set selenium implicit wait  2
    click element   //*[@id="trade"]/div/div[1]/div/div/div[1]/div[1]/div/div[2]/div/div/div[1]/div[2]/div/div[2]
    wait until page contains element    //*[text()="Volatility 10 (1s) Index"]  20
    click element   //*[text()="Volatility 10 (1s) Index"]


Set Values
    wait until page contains element    //*[@id="dt_contract_dropdown"]/div[1]  20
    click element   //*[@name="contract_type"]
    click element   //*[@id="dt_contract_rise_fall_item"]
    click element   //*[@id="dc_t_toggle_item"]
    wait until page contains element    //*[@data-value="5"]  20
#    click element   //*[@data-value="5"]
#    Clear Input     //*[@id="dt_amount_input"]
#    input text  //*[@id="dt_amount_input"]  10

Buy Contract
    set selenium implicit wait  3
    wait until page does not contain element    //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]     20
    wait until page contains element    //*[@id="dt_purchase_call_button"]   20
    click element   //*[@id="dt_purchase_call_button"]


*** Test Cases ***
Deriv Login
    Login   ${my_email}     ${my_pw}

Check Account
    Check Account

Buy Contract
    Buy Contract

Setting Values
    Set Values

Buying Contract
    Buy Contract