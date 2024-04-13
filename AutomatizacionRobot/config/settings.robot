*** Settings ***
Library    OperatingSystem

*** Variables ***
${OUTPUT_DIR}    ../reports
${OUTPUT_FILE}    output.xml
${LOG_FILE}    log.html
${REPORT_FILE}    report.html

*** Keywords ***
Set Output Paths
    ${CUR_DIR}=    Get File    __file__
    ${ROBOT_OUTPUT_DIR}=    Join Path    ${CUR_DIR}    ${OUTPUT_DIR}
    Set Suite Variable    ${ROBOT_OUTPUT_DIR}
    Set Suite Variable    ${ROBOT_OUTPUT_FILE}    ${ROBOT_OUTPUT_DIR}/${OUTPUT_FILE}
    Set Suite Variable    ${ROBOT_LOG_FILE}    ${ROBOT_OUTPUT_DIR}/${LOG_FILE}
    Set Suite Variable    ${ROBOT_REPORT_FILE}    ${ROBOT_OUTPUT_DIR}/${REPORT_FILE}