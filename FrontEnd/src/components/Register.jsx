import { get, useForm } from "react-hook-form";
import toast, { Toaster } from "react-hot-toast";
import { useAuth } from "../context/AuthContext";

const Register = () => {
  const { signUp } = useAuth();
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();




  const commonToastStyle = {
    borderRadius: "10px",
    background: "var(--background-color-dark)",
    color: "var(--primary-color)",
  };









  const onSubmit = handleSubmit((data) => {
    let isValid = true;







    if (isValid) {
      signUp(data);
    }
  });


  return (
    <section className="register">
      <Toaster />
      <form onSubmit={onSubmit} className="register__form">

        <section className="form-group">
          <p>Nit</p>
          <input type="text" {...register("user_nit")} />
        </section>

        <section className="form-group">
          <p>Primer nombre</p>
          <input type="text" {...register("user_name")} />
        </section>

        <section className="form-group">
          <p>Segundo nombre</p>
          <input type="text" {...register("user_middle_name")} />
        </section>

        <section className="form-group">
          <p>Primer apellido</p>
          <input type="text" {...register("user_last_name")} />
        </section>

        <section className="form-group">
          <p>Segundo apellido</p>
          <input type="text" {...register("user_second_last_name")} />
        </section>

        <section className="form-group">
          <p>Fecha de nacimiento</p>
          <input type="date" {...register("user_birth_date")} />
        </section>

        <section className="form-group">
          <p>Celular</p>
          <input type="text" {...register("user_phone")} />
        </section>

        <section className="form-group">
          <p>Correo electronico</p>
          <input type="email" {...register("user_mail")} />
        </section>

        <section className="form-group">
          <p>Nombre de usuario</p>
          <input type="text" {...register("user_username")} />
        </section>

        <section className="form-group">
          <p>Password</p>
          <input type="password" {...register("user_password")} />
        </section>



        

        <button type="submit">Registrar</button>

      </form>
    </section>
  );
};

export default Register;
