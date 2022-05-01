import {
  browserSessionPersistence,
  onAuthStateChanged,
  setPersistence,
} from "firebase/auth";
import { useState } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { auth } from "./firebase.config";
import EditProfile from "./routes/EditProfile";
import MyProfile from "./routes/MyProfile";

function App() {
  const [isAuth, setIsAuth] = useState(false);
  setPersistence(auth, browserSessionPersistence).then(() => {});
  onAuthStateChanged(auth, (currentUser) => {
    if (currentUser) {
      setIsAuth(true);
    } else {
      setIsAuth(false);
    }
  });
  return (
    <Router>
      <Routes>
        <Route path="/" element={<MyProfile isAuth={isAuth} />} />
        <Route path="/profile" element={<EditProfile isAuth={isAuth} />} />
      </Routes>
    </Router>
  );
}

export default App;
