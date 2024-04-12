import RoutesPG from "./routes/RoutesPG";
import { useAuth } from "./context/AuthContext";


function App() {
  const { isAuthenticated } = useAuth();
  return (
    <main>
      <section className="content">
        {isAuthenticated}
        <section className="each_page">
          <RoutesPG />
        </section>
      </section>
    </main>
  );
}

export default App;
