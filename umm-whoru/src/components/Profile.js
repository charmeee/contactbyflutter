import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPhone, faAt, faComment } from "@fortawesome/free-solid-svg-icons";

function Profile() {
  return (
    <div className="profile-wrapper">
      <div className="profile-upper h-1/2">
        <p>Profile pic + Name + Introduction</p>
      </div>
      <div className="profile-lower h-1/2 w-4/5 mx-auto">
        <div className="profile-button-wrapper">
          <div className="flex items-center justify-center">
            <button
              className="bg-main-3 w-1/2 h-16 text-xl font-semibold border-b-4 border-main-3 text-main-0"
              active="true"
            >
              Profile
            </button>
            <button className="active:bg-main-3 w-1/2 h-16 text-xl font-semibold border-b-4 border-main-3 text-main-0">
              Friends
            </button>
          </div>
        </div>
        <div className="profile-info-wrapper">
          <div className="info-row grid grid-cols-6 p-5 pt-7 border-solid border-b-2 border-main-3">
            <FontAwesomeIcon
              className="text-main-0 p-4"
              icon={faPhone}
              size="2x"
            />
            <span className="col-span-5 p-5 text-xl font-semibold text-main-0">
              010-0000-0000
            </span>
          </div>
          <div className="info-row grid grid-cols-6 p-5 border-solid border-b-2 border-main-3">
            <FontAwesomeIcon
              className="text-main-0 p-4"
              icon={faAt}
              size="2x"
            />
            <span className="col-span-5 p-4 text-xl font-semibold text-main-0">
              email@gmail.com
            </span>
          </div>
          <div className="info-row grid grid-cols-6 p-4 border-solid border-b-2 border-main-3">
            <FontAwesomeIcon
              className="text-main-0 p-4"
              icon={faComment}
              size="2x"
            />
            <span className="col-span-5 p-4 text-xl font-semibold text-main-0">
              kakaotalk
            </span>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Profile;
