import "../styles/styles.scss";

import SearchBar from "../components/SearchBar";
import SideBar from "../components/SideBar";
import Profile from "../components/Profile";
import { signInWithPopup } from "firebase/auth";
import { doc, getDoc, setDoc } from "firebase/firestore";
import { auth, db, provider } from "../firebase.config";
import { useEffect, useState } from "react";

function MyProfile({isAuth}) {
  const [userData,setUserData] = useState({});
  useEffect(()=>{
    if(isAuth){
      getDoc(doc(db,'users',auth.currentUser.uid)).then((docsnap)=>{
        setUserData({
          name: docsnap.data().name, 
          email: docsnap.data().email,
          phoneNumber: docsnap.data().phoneNumber,
          uid:auth.currentUser.uid,
          intro: "안녕하세요, SW마에스트로 13기 연수생 "+docsnap.data().name+"입니다:)"
        });
      })
    }
  },[isAuth])
  return (
    <div className="grid grid-cols-3 h-screen">
      <SearchBar />
      <Profile userData={userData}/>
      <SideBar />
    </div>
  );
}

export default MyProfile;
