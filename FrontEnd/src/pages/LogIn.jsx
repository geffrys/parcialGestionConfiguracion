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

        <section>
          {showLogin && <Login />}
        </section>
        <section >
          {showRegister && <Register />}
        </section>
        <section>
        {showLogin && <a onClick={showRegisterForm} className="">Register</a>}
        {showRegister && <a onClick={showLoginForm} className="">Login</a>}
        </section>

      </section>

    </>
  );
}

export default LogIn;
