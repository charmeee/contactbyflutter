function Profile() {
  return (
    <div className="profile-wrapper">
      <div className="profile-upper h-2/5">
        <p>Profile pic + Name + Introduction</p>
      </div>
      <div className="profile-lower h-3/5 w-4/5 mx-auto">
        <div className="profile-button-wrapper">
          <div className="flex items-center justify-center">
            <button
              className="bg-main-3 w-1/2 h-16 text-lg font-semibold border-b-4 border-main-3 text-main-0"
              active="true"
            >
              Profile
            </button>
            <button className="active:bg-main-3 w-1/2 h-16 text-lg font-semibold border-b-4 border-main-3 text-main-0">
              Friends
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Profile;
