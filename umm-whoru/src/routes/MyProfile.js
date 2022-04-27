import "../styles/styles.scss";

import SearchBar from "../components/SearchBar";
import SideBar from "../components/SideBar";
import Profile from "../components/Profile";

function MyProfile() {
  return (
    <div className="grid grid-cols-3 h-screen">
      <SearchBar />
      <Profile />
      <SideBar />
    </div>
  );
}

export default MyProfile;
