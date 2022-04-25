import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import MyProfile from "./routes/MyProfile";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<MyProfile />} />
      </Routes>
    </Router>
  );
}

export default App;
