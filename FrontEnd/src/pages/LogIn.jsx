import Register from "../components/Register";
import Login from "../components/Login";
import { useEffect, useState } from "react";
import { useAuth } from "../context/AuthContext";
import { useNavigate } from "react-router-dom";

function LogIn() {
  const [showLogin, setShowLogin] = useState(true);
  const [showRegister, setShowRegister] = useState(false);
  const { logIn, isAuthenticated, user } = useAuth();
  const navigate = useNavigate();



  const showLoginForm = () => {
    setShowLogin(true);
    setShowRegister(false);
  };

  const showRegisterForm = () => {
    setShowLogin(false);
    setShowRegister(true);
  };



  useEffect(() => {
    if (isAuthenticated) {
      navigate("/");
    }
  }, [isAuthenticated]);



  return (
    <>
      <section>

        
          {showLogin && <section className="form_container"><Login /></section>}
        
          {showRegister && <section className="form_container"><Register /></section>}
        <section className="buttons_container">
        {showLogin && <a onClick={showRegisterForm} className="button-register-login">Registrarse</a>}
        {showRegister && <a onClick={showLoginForm} className="button-register-login">Loguearse</a>}
        </section>

      </section>

    </>
  );
}

export default LogIn;
