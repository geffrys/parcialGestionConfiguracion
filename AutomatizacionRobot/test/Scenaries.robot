*** Settings ***
Resource          ../config/settings.robot
Documentation     Ejemplo de base de escenarios en Robot Framework
Library           SeleniumLibrary
Library    Collections

*** Variables ***
${URL}            http://localhost:5173
${REGISTRARSE_HIPERVINCULO_LOCATOR}            /html/body/div/main/section/section/section/section[2]/a
${REGISTRARSE_BUTTON_LOCATOR}            /html/body/div/main/section/section/section/section[1]/section/form/button
${LOGIN_BUTTON_LOCATOR}        /html/body/div/main/section/section/section/section[1]/form/button
${NIT_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[1]/div/input
${NOMBRE_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[2]/div/input
${SEGUNDO_NOMBRE_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[3]/div/input
${APELLIDO_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[4]/div/input
${SEGUNDO_APELLIDO_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[5]/div/input
${FECHA_NACIMIENTO_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[6]/div/input
${CELULAR_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[7]/div/input
${CORREO_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[8]/div/input
${NOMBRE_USUARIO_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[9]/div/input
${CONTRASENA_LOCATOR}         /html/body/div/main/section/section/section/section[1]/section/form/section[10]/div/input

${EXCEL_SUCCESSFUL_TEST_CASES}            CasosExitosos.xlsx
${EXCEL_FAILED_TEST_CASES}        CasosFallidos.xlsx




    

*** Test Cases ***
Caso de prueba exitoso
    Orquestador de pruebas       1020304050    Juan    Carlos    Perez    Gomez    01/01/1990    3001234567        geffy.ospi@gmail.com    Geffion1    12345678
    Orquestador de pruebas       1020304051    Juan    Carlos    Perez    Gomez    01/01/1990    3001234568        geffry.ospi@gmail.com    Geffion2    12345678
    Orquestador de pruebas       1020304052    Maria    Fernanda    Lopez    Garcia    01/01/1990    3009876543        maria.lopez@gmail.com    MariaLopez1    87654321
    Orquestador de pruebas       1020304053    Pedro    Pablo    Ramirez    Rodriguez    01/01/1990    3012345678        pedro.ramirez@gmail.com    PedroRamirez1    98765432
    Orquestador de pruebas       1020304054    Laura    Sofia    Hernandez    Martinez    01/01/1990    3023456789        laura.hernandez@gmail.com    LauraHernandez1    76543210
    Orquestador de pruebas       1020304055    Carlos    Alberto    Castro    Sanchez    01/01/1990    3034567890        carlos.castro@gmail.com    CarlosCastro1    65432109
    Orquestador de pruebas       1020304056    Ana    Maria    Gomez    Rodriguez    01/01/1990    3045678901        ana.gomez@gmail.com    AnaGomez1    54321098
    Orquestador de pruebas       1020304057    Luis    Felipe    Torres    Herrera    01/01/1990    3056789012        luis.torres@gmail.com    LuisTorres1    43210987
    Orquestador de pruebas       1020304058    Sofia    Alejandra    Vargas    Castro    01/01/1990    3067890123        sofia.vargas@gmail.com    SofiaVargas1    32109876
    Orquestador de pruebas       1020304059    Juan    David    Rios    Morales    01/01/1990    3078901234        juan.rios@gmail.com    JuanRios1    21098765

    





*** Keywords ***
Orquestador de pruebas
    [Arguments]   ${NIT}    ${NOMBRE}    ${SEGUNDO_NOMBRE}    ${APELLIDO}    ${SEGUNDO_APELLIDO}    ${FECHA_NACIMIENTO}    ${CELULAR}    ${CORREO}    ${NOMBRE_USUARIO}    ${CONTRASENA}
    Run keyword    Abrir navegador
    Run keyword    Ir a formulario de registro
    Run keyword    Diligenciar el nit    ${NIT}
    Run keyword    Diligenciar el nombre    ${NOMBRE}
    Run keyword    Diligenciar el segundo nombre    ${SEGUNDO_NOMBRE}
    Run keyword    Diligenciar el apellido    ${APELLIDO}
    Run keyword    Diligenciar el segundo apellido    ${SEGUNDO_APELLIDO}
    Run keyword    Diligenciar la fecha de nacimiento    ${FECHA_NACIMIENTO}
    Run keyword    Diligenciar el celular    ${CELULAR}
    Run keyword    Diligenciar el correo    ${CORREO}
    Run keyword    Diligenciar el nombre de usuario    ${NOMBRE_USUARIO}
    Run keyword    Diligenciar la contraseña    ${CONTRASENA}
    Run keyword    Enviar formulario
    Run keyword    Comprobar registro exitoso
    Run keyword    Cerrar navegador


    




Abrir navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    5

Ir a formulario de registro
    Click Element    xpath=${REGISTRARSE_HIPERVINCULO_LOCATOR}
    Sleep    5

Diligenciar el nit
    [Arguments]    ${NIT}
    Click Element    xpath=${NIT_LOCATOR}
    Input Text    xpath=${NIT_LOCATOR}    ${NIT}
    
Diligenciar el nombre
    [Arguments]    ${NOMBRE}
    Click Element    xpath=${NOMBRE_LOCATOR}
    Input Text    xpath=${NOMBRE_LOCATOR}     ${NOMBRE}

Diligenciar el segundo nombre
    [Arguments]    ${SEGUNDO_NOMBRE}
    Click Element    xpath=${SEGUNDO_NOMBRE_LOCATOR}
    Input Text    xpath=${SEGUNDO_NOMBRE_LOCATOR}    ${SEGUNDO_NOMBRE}

Diligenciar el apellido
    [Arguments]    ${APELLIDO}
    Click Element    xpath=${APELLIDO_LOCATOR}
    Input Text    xpath=${APELLIDO_LOCATOR}    ${APELLIDO}

Diligenciar el segundo apellido
    [Arguments]    ${SEGUNDO_APELLIDO}
    Click Element    xpath=${SEGUNDO_APELLIDO_LOCATOR}
    Input Text    xpath=${SEGUNDO_APELLIDO_LOCATOR}    ${SEGUNDO_APELLIDO}

Diligenciar la fecha de nacimiento
    [Arguments]    ${FECHA_NACIMIENTO}
    Click Element    xpath=${FECHA_NACIMIENTO_LOCATOR}
    Input Text    xpath=${FECHA_NACIMIENTO_LOCATOR}    ${FECHA_NACIMIENTO}

Diligenciar el celular
    [Arguments]    ${CELULAR}
    Click Element    xpath=${CELULAR_LOCATOR}
    Input Text    xpath=${CELULAR_LOCATOR}    ${CELULAR}
Diligenciar el correo
    [Arguments]    ${CORREO}
    Click Element    xpath=${CORREO_LOCATOR}
    Input Text    xpath=${CORREO_LOCATOR}        ${CORREO}

Diligenciar el nombre de usuario
    [Arguments]    ${NOMBRE_USUARIO}
    Click Element    xpath=${NOMBRE_USUARIO_LOCATOR}
    Input Text    xpath=${NOMBRE_USUARIO_LOCATOR}    ${NOMBRE_USUARIO}

Diligenciar la contraseña
    [Arguments]    ${CONTRASENA}
    Click Element    xpath=${CONTRASENA_LOCATOR}
    Input Text    xpath=${CONTRASENA_LOCATOR}      ${CONTRASENA}

Enviar formulario
    Sleep    5
    Click Element    xpath=${REGISTRARSE_BUTTON_LOCATOR}
    Sleep    5

Comprobar registro exitoso
    Page Should Contain Button    locator

Cerrar navegador
    Close Browser
    