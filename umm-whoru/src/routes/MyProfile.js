import "../styles/styles.scss";

import SearchBar from "../components/SearchBar";
import SideBar from "../components/SideBar";
import Profile from "../components/Profile";

function MyProfile() {
  return (
    <div className="columns-3">
      <SearchBar />
      <Profile />
      <SideBar />
    </div>
  );
}

export default MyProfile;
