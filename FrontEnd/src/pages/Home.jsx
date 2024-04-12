import React, { useEffect } from "react";
import { toast, Toaster } from "react-hot-toast";
import { useAuth } from "../context/AuthContext";

function Home() {
  const { user } = useAuth();
  useEffect(() => {
    toast.success("Welcome " + user.user_name, {
      className: "toast",
    });
  }, []);
  return (
    <section className="home">
      <Toaster />
      
    </section>
  );
}

export default Home;
