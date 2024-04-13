
import { Toaster, toast } from "react-hot-toast";
import { useForm } from "react-hook-form";
import { useAuth } from "../context/AuthContext";

const Login = () => {


    const { logIn } = useAuth();

    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm();

    const onSubmit = handleSubmit(async (data) => {
        let key = true;
        if (!data.user_password) {
            toast("Contraseña requerida", {
                className: "toast"
            });
            key = false;
        }
        if (!data.user_username) {
            toast("Nombre de usuario requerido", {
                className: "toast",
            });
            key = false;
        }
        if (key) {
            await logIn(data);
        }
    });


    return (
        <>
            <Toaster />
            <form action="" onSubmit={onSubmit}>
                <section className="form-group">
                    <p>Nombre de usuario</p>
                    <input type="text" maxLength={8} {...register("user_username")} />
                </section>
                <section className="form-group">
                    <p>Contraseña</p>
                    <input type="password" maxLength={20} {...register("user_password")} />
                </section>

                <button type="submit" className="submit_button">
                    Login
                </button>
            </form>
        </>
    );
};

export default Login;