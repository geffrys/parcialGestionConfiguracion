import React, { useEffect } from "react";
import { toast, Toaster } from "react-hot-toast";
import { useAuth } from "../context/AuthContext";

function Home() {
  const { user, logOut } = useAuth();

  const handleLogOut = async () => {
    await logOut();
    toast.success("Sesion cerrada correctamente");
  };


  return (
    <section className="home">
      <Toaster />
      <h1>Bienvenido {user.user_name}</h1>
      <ul className="menu">
        <li>
          <article onClick={handleLogOut} className="menu_card">
            <h2>Cerrar sesion</h2>
          </article>
        </li>

        <li>
          <article className="menu_card">
            <h2>Modificar perfil</h2>
          </article>
        </li>

        <li>
          <article className="menu_card">
            <h2>Eliminar cuenta</h2>
          </article>
        </li>
      </ul>
    </section >
  );
}

export default Home;
