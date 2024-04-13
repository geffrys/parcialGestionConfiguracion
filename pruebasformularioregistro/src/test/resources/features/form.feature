Feature: probar formulario de registro.

  @success
  Scenario Outline: Validar registro exitoso
    Given Usuario esta en el formulario de registro
    When Usuario diligencia el formulario
      | nit   | name   | middleName   | lastName   | secondLastName   | birthDate   | phone   | mail   | userName   | password   |
      | <nit> | <name> | <middleName> | <lastName> | <secondLastName> | <birthDate> | <phone> | <mail> | <userName> | <password> |
    Then deberia ver que se registro correctamente
    Examples:

      | nit        | name                 | middleName         | lastName     | secondLastName       | birthDate  | phone      | mail                    | userName | password  |
      | 1039425658 | Beatriz              | Enriqueta          | Montecristo  | Fernandez            | 01/04/2005 | 3102459822 | betty125@example.com    | Emontec3 | C1234556  |
      | 1039425632 | Juan                 | Andres             | Alvarez      | Gomez                | 01/04/2006 | 3102459822 | mariagarcia@example.com | Marials1 | Guitaar2  |
      | 1039425888 | Mariangel            | delasmercedes      | Gonzalez     | Rodriguez            | 01/04/2000 | 3102459777 | maria@gmail.com         | Emontec4 | 67667fsss |
      | 1039425658 | Mariangel            | Enriqueta          | Rodriguez    | Alvarez              | 01/04/2000 | 3102459822 | maria@gmail.com         | Marials4 | dfdfwdf4r |
      | 1039425888 | Beatriz              | delasmercedes      | Fernandez    | Montecristo          | 01/04/2005 | 3102459777 | mariagarcia@example.com | Marials7 | arfefddd  |
      | 1039425632 | Andres               | Juan               | Gomez        | Gonzalez             | 01/04/2006 | 3102459777 | betty125@example.com    | Emontec7 | dfdfwdf4r |
      | 1039535632 | Carlos               | Manuel             | Montemayor   | Villanueva           | 01/04/2001 | 3147589633 | Manu52365779@gmail.com  | Emontec8 | dfdfwdf4r |
      | 1129535632 | cccaaarlosssssssssta | Meritaaa           | Florez       | Valle                | 01/01/1965 | 3221459855 | c12c@example.com        | Emontec9 | dfdfwdf4r |
      | 9854246321 | Guadalupe            | Consuelo           | Guzman       | delaRosa             | 01/04/2000 | 3112458755 | delar.54@hotmail.com    | Emontec0 | dfdfwdf4r |
      | 5211123987 | Adolph               | fsvonhinzwischenst | Yuzeptamente | Wolfeschlegelsteinan | 12/07/1990 | 3541258963 | ado.154loi@gmail.com    | Marials2 | dfdfwdf4r |


  @error
  Scenario Outline: Validar registro con campos incorrectos
    Given Usuario esta en el formulario de registro
    When Usuario diligencia el formulario
      | nit   | name   | middleName   | lastName   | secondLastName   | birthDate   | phone   | mail   | userName   | password   |
      | <nit> | <name> | <middleName> | <lastName> | <secondLastName> | <birthDate> | <phone> | <mail> | <userName> | <password> |
    Then deberia ver que el mensaje de error <messageError>
    Examples:

      | nit        | name                  | middleName            | lastName     | secondLastName       | birthDate  | phone      | mail                    | userName | password     | messageError                                                             |
      | 1039       | cccaaarlosssssssssta  | Meritaaa              | Florez       | Valle                | 01/01/1965 | 3221459855 | c12c@example.com        | Fedretr1 | dgfdfgdf     | El nit debe tener 10 carácteres.                                         |
      | 1039425632 | jkmanjklifgnlduuujjjj | anaklkijmjukloijhyhjm | 66rincon     | lmajiklmjanmadjdk    | 01/04/2006 | 3221459855 | mariagarcia@example.com | Manujkw2 | fdsfsdfdsfds | Solo se permiten letras.                                                 |
      | 1039425632 | Andres                | Juan                  | Gomez        | Gonzalez             | 01/04/2006 | 3221459855 | betty125@example        | Manujkw2 | fsdfsdfsdf   | El email debe cumplir con todos los requisitos para ser un email valido. |
      | 1039425634 | Beatriz               | Enriqueta             | Montecristo  | Fernandez            | 01/04/2005 | 3221459855 | angel12.gmail.com       | Manujkw2 | wfdsdgsg23   | El email debe cumplir con todos los requisitos para ser un email valido. |
      | 1039425633 | Mariangel             | delasmercedes         | rincon       | Plata                | 21/04/2024 | 3209852148 | mariagarcia@example.com | Manujkw5 | wfdsdgsg23   | La fecha de nacimiento no puede ser mayor a la fecha actual.             |
      | 1039425645 | jkmanjklifgnlduuujjj  | anaklkijmjukloijhyhl  | Gomez        | Gonzalez             | 01/04/2000 | 3227459855 | betty125@example.com    | Manujkwd | wfdsdgsg23   | El nombre de usuario debe seguir el formato especificado.                |
      | 7689076543 | Adolph                | fsvonhinzwischenst    | Yuzeptamente | Wolfeschlegelsteinan | 12/07/1990 | 3259855    | ado.154loi@gmail.com    | Manujkw9 | hyu76thjki   | El número de teléfono debe tener 10 carácteres.                          |
      | 1039425698 | Juan                  | Andres                | Alvarez      | Gomez                | 13/04/2024 | 3221459855 | mariagarcia@example.com | Manujkw7 | hyu76thjki   | La fecha de nacimiento no puede ser mayor a la fecha actual.             |
      | 1039425698 | Mariangel             | mercedes              | rincon       | soto                 | 21/04/1990 | 3146678766 | mariagarcia@example.com | cvfrght7 | hjkmng7uio   | El nombre de usuario debe seguir el formato especificado.                |
      | 1038725632 | Juan                  | 12j                   | rincon       | lascurin             | 12/04/2000 | 3224567899 | maria@gmail.com         | Manujkw7 | jk98uikj     | Solo se permiten letras.                                                 |

