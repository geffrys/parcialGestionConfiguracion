*** Settings ***
Resource          ../config/settings.robot
Documentation     Ejemplo de base de escenarios en Robot Framework
Library           SeleniumLibrary

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


*** Test Cases ***
Caso de prueba exitoso
    Abrir navegador
    Ir a formulario de registro
    Diligenciar el nit
    Diligenciar el nombre
    Diligenciar el segundo nombre
    Diligenciar el apellido
    Diligenciar el segundo apellido
    Diligenciar la fecha de nacimiento
    Diligenciar el celular
    Diligenciar el correo
    Diligenciar el nombre de usuario
    Diligenciar la contraseña
    Enviar formulario
    Comprobar registro exitoso


*** Keywords ***
Abrir navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    5

Ir a formulario de registro
    Click Element    xpath=${REGISTRARSE_HIPERVINCULO_LOCATOR}
    Sleep    5

Diligenciar el nit
    Click Element    xpath=${NIT_LOCATOR}
    Input Text    xpath=${NIT_LOCATOR}    123456789
    
Diligenciar el nombre
    Click Element    xpath=${NOMBRE_LOCATOR}
    Input Text    xpath=${NOMBRE_LOCATOR}    Juan

Diligenciar el segundo nombre
    Click Element    xpath=${SEGUNDO_NOMBRE_LOCATOR}
    Input Text    xpath=${SEGUNDO_NOMBRE_LOCATOR}    Carlos

Diligenciar el apellido
    Click Element    xpath=${APELLIDO_LOCATOR}
    Input Text    xpath=${APELLIDO_LOCATOR}    Perez

Diligenciar el segundo apellido
    Click Element    xpath=${SEGUNDO_APELLIDO_LOCATOR}
    Input Text    xpath=${SEGUNDO_APELLIDO_LOCATOR}    Rodriguez

Diligenciar la fecha de nacimiento
    Click Element    xpath=${FECHA_NACIMIENTO_LOCATOR}
    Input Text    xpath=${FECHA_NACIMIENTO_LOCATOR}    01/01/1990

Diligenciar el celular
    Click Element    xpath=${CELULAR_LOCATOR}
    Input Text    xpath=${CELULAR_LOCATOR}    3001234567

Diligenciar el correo
    Click Element    xpath=${CORREO_LOCATOR}
    Input Text    xpath=${CORREO_LOCATOR}        geffry.ospina@gmail.com

Diligenciar el nombre de usuario
    Click Element    xpath=${NOMBRE_USUARIO_LOCATOR}
    Input Text    xpath=${NOMBRE_USUARIO_LOCATOR}    geffry

Diligenciar la contraseña
    Click Element    xpath=${CONTRASENA_LOCATOR}
    Input Text    xpath=${CONTRASENA_LOCATOR}    123456

Enviar formulario
    Sleep    5
    Click Element    xpath=${REGISTRARSE_BUTTON_LOCATOR}
    Sleep    5

Comprobar registro exitoso
    Page Should Contain Button    locator
    