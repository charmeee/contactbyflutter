// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
import { getAuth, GoogleAuthProvider } from "firebase/auth";
import {getFirestore} from 'firebase/firestore';
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBcrKXuh3wtrY_0o7s_TC7vzHXJGhxIq_4",
  authDomain: "umm-whoru.firebaseapp.com",
  projectId: "umm-whoru",
  storageBucket: "umm-whoru.appspot.com",
  messagingSenderId: "857609503955",
  appId: "1:857609503955:web:667839d5679e46a8610026",
  measurementId: "G-ESV2G199C4"
};

const app = initializeApp(firebaseConfig);
export const db = getFirestore(app);
export const auth = getAuth(app);
export const provider = new GoogleAuthProvider();