import { Route, Routes } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import LogIn from "../pages/LogIn";
import Home from "../pages/Home";

function RoutesPG() {
  const { isAuthenticated, user } = useAuth();
  return (
    <Routes>
      <Route path="/" element={!isAuthenticated ? <LogIn /> : <Home />} />
      <Route path="/login" element={!isAuthenticated ? <LogIn /> : <Home />} />
    </Routes>
  );
}

export default RoutesPG;
