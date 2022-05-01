import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPhone, faAt, faComment } from "@fortawesome/free-solid-svg-icons";
import {signInWithPopup} from 'firebase/auth';
import { auth, db, provider } from "../firebase.config";

import ProfileUpper from "./ProfileUpper";
import { doc, getDoc, setDoc } from "firebase/firestore";
import { useEffect, useState } from "react";


function Profile({userData}) {
  const signInWithGoogle = async () =>{
    signInWithPopup(auth, provider).then(() => {
      localStorage.setItem("isAuth", true);
      setDoc(doc(db, "users", auth.currentUser.uid), {
        name: auth.currentUser.displayName,
        email: auth.currentUser.email,
        phoneNumber:"010-0000-0000",
        uid: auth.currentUser.uid,
        intro: "안녕하세요, SW마에스트로 13기 연수생"+auth.currentUser.displayName+"입니다:)"
      });
    }).catch(error => console.log("signinwithgoogle error:"+error));
  }//로그인 가능

  return (
    <div className="profile-wrapper">
      <div className="profile-upper h-1/2">
        <ProfileUpper userData={userData}></ProfileUpper>
      </div>
      <div className="profile-login">
        <button className="googleLoginButton" onClick={()=>signInWithGoogle}>
          {userData.name? <h3 className="subhead100">{userData.name}</h3> : <h3 className="subhead100">구글 로그인</h3> }
        </button>
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
              {userData.phoneNumber? userData.phoneNumber : 'none'}
            </span>
          </div>
          <div className="info-row grid grid-cols-6 p-5 border-solid border-b-2 border-main-3">
            <FontAwesomeIcon
              className="text-main-0 p-4"
              icon={faAt}
              size="2x"
            />
            <span className="col-span-5 p-4 text-xl font-semibold text-main-0">
              {userData.email? userData.email : 'none'}
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
