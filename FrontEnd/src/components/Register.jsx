import { get, useForm } from "react-hook-form";
import toast, { Toaster } from "react-hot-toast";
import { useAuth } from "../context/AuthContext";

const Register = ({gotologin}) => {
  const { signUp } = useAuth();
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();

  const handleKeyDown = (event) => {
    const keyCode = event.keyCode || event.which;
    const isNumericKey = (keyCode >= 48 && keyCode <= 57); 
    const isShiftKey = event.shiftKey; 

    if (!isNumericKey && !isShiftKey && keyCode !== 8 && keyCode !== 46) {
        event.preventDefault();
    }
};


  const today = new Date();
  const oneDay = 24 * 60 * 60 * 1000; // 1 día en milisegundos
  const yesterday = new Date(today.getTime() - oneDay);
  yesterday.setHours(yesterday.getHours() - 5);
  const formattedDate = yesterday.toISOString().split('T')[0];

  const yearsToMilliseconds = 18 * 365 * 24 * 60 * 60 * 1000; // 18 años en milisegundos
  const minDate = new Date(today.getTime() - yearsToMilliseconds);
  const formattedMinDate = minDate.toISOString().split('T')[0];



  const onSubmit = handleSubmit((data) => {
    
    const res = signUp(data);
    if (res) {
      toast.success("Usuario creado correctamente", {
        className: "toast",
      });
      gotologin()
    }
    
    
  });


  return (
    <section className="register">
      <Toaster />
      <form onSubmit={onSubmit} className="register__form">
        <section className="form-group">
          <p>Nit</p>
          <div>
            <input type="text" maxLength={10}  onKeyDown={handleKeyDown} autoComplete="off" {...register("user_nit", {
              pattern: {
                value: /^[0-9]*$/,
                message: "Solo se permiten números."
              }, minLength: { value: 10, message: "El nit debe tener 10 carácteres." },
              required: "El nit es requerido."
            })} />
            {errors.user_nit && <p className="error">{errors.user_nit.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Primer nombre</p>
          <div>
            <input type="text" maxLength={20} autoComplete="off" {...register("user_name",
              {
                pattern: {
                  value: /^[A-Za-z]*$/,
                  message: "Solo se permiten letras."
                }, minLength: {
                  value: 1,
                  message: "No puede estar vacío."
                }, required: "El nombre es requerido."
              })} />
            {errors.user_name && <p className="error">{errors.user_name.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Segundo nombre</p>
          <div>

            <input type="text" autoComplete="off" maxLength={20} {...register("user_middle_name", {
              pattern: {
                value: /^[A-Za-z]*$/,
                message: "Solo se permiten letras."
              }, minLength: {
                value: 1,
                message: "No puede estar vacío."
              }, required: "El segundo nombre es requerido."
            })} />
            {errors.user_middle_name && <p className="error">{errors.user_middle_name.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Primer apellido</p>
          <div>
            <input type="text" autoComplete="off" maxLength={20} {...register("user_last_name", {
              pattern: {
                value: /^[A-Za-z]*$/,
                message: "Solo se permiten letras."
              }, minLength: {
                value: 1,
                message: "No puede estar vacío."
              }, required: "El primer apellido es requerido."
            })} />
            {errors.user_last_name && <p className="error">{errors.user_last_name.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Segundo apellido</p>
          <div>
            <input type="text" autoComplete="off" maxLength={20} {...register("user_second_last_name", {
              pattern: {
                value: /^[A-Za-z]*$/,
                message: "Solo se permiten letras."
              }, minLength: {
                value: 1,
                message: "No puede estar vacío."
              }, required: "El segundo apellido es requerido."
            })} />
            {errors.user_second_last_name && <p className="error">{errors.user_second_last_name.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Fecha de nacimiento</p>
          <div>
            <input type="date" autoComplete="off" {...register("user_birth_date",
              {
                max: {
                  value: formattedDate,
                  message: "La fecha de nacimiento no puede ser mayor a la fecha actual."
                },
                min: {
                  value: formattedMinDate,
                  message: "debes tener minimo 18 años."
                },
                minDate: {
                  value: formattedMinDate,
                  message: "debes tener minimo 18 años."
                }, required: "La fecha de nacimiento es requerida."

              }

            )} />
            {errors.user_birth_date && <p className="error">{errors.user_birth_date.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Celular</p>
          <div>
            <input type="text" autoComplete="off" maxLength={10} onKeyDown={handleKeyDown} {...register("user_phone",
              {
                pattern: {
                  value: /^[0-9]*$/,
                  message: "Solo se permiten números."
                },
                minLength: {
                  value: 10,
                  message: "El número de teléfono debe tener 10 carácteres."
                }, required: "El número de celular es requerido."
              }
            )} />
            {errors.user_phone && <p className="error">{errors.user_phone.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Correo electronico</p>
          <div>
            <input type="text" autoComplete="off" maxLength={100} {...register("user_mail",
              {
                pattern: {
                  value: /^(?!.*\.\.)[^.@]+(?:\.[^.@]+)*@(?:[^.@]+\.)+[a-z]+(?:\.[a-z]{2,})?$/,
                  message: "El email debe cumplir con todos los requisitos para ser un email valido."
                },
                minLength: {
                  value: 1,
                  message: "No puede estar vacío."
                }, required: "El correo electronico es requerido."
              }

            )} />
            {errors.user_mail && <p className="error">{errors.user_mail.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Nombre de usuario</p>
          <div>
            <input type="text" autoComplete="off" maxLength={8} {...register("user_username",

              {
                pattern: {
                  value: /^[A-Z][a-z]{6}[0-9]$/,
                  message: "El nombre de usuario debe seguir el formato especificado."
                },
                minLength: {
                  value: 8,
                  message: "El nombre de usuario debe tener al menos 8 carácteres."
                }, required: "El nombre de usuario es requerido."
              }

            )} />
            {errors.user_username && <p className="error">{errors.user_username.message}</p>}
          </div>
        </section>

        <section className="form-group">
          <p>Password</p>
          <div>
            <input type="password" autoComplete="off" maxLength={20} {...register("user_password",

              {
                minLength: {
                  value: 8,
                  message: "La contraseña debe tener al menos 8 carácteres."
                }, required: "La contraseña es requerida."
              }

            )} />
            {errors.user_password && <p className="error">{errors.user_password.message}</p>}

          </div>
        </section>





        <button type="submit">Registrar</button>

      </form>
    </section>
  );
};

export default Register;
