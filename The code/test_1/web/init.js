// init.js
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.2/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.12.2/firebase-analytics.js";
import { getAuth, GoogleAuthProvider, signInWithPopup } from "https://www.gstatic.com/firebasejs/10.12.2/firebase-auth.js";

const firebaseConfig = {
  apiKey: "AIzaSyBJC8DpfK2H9qziqEt1TVNwtMgeeixcZ0E",
  authDomain: "edraak1-2fb39.firebaseapp.com",
  projectId: "edraak1-2fb39",
  storageBucket: "edraak1-2fb39.appspot.com",
  messagingSenderId: "738177878309",
  appId: "1:738177878309:web:db911d332084535d50f2cc",
  measurementId: "G-T98BNZC8GZ"
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);
const provider = new GoogleAuthProvider();

window.signInWithGoogle = () => {
  signInWithPopup(auth, provider)
    .then((result) => {
      const user = result.user;
      console.log(user);
    })
    .catch((error) => {
      console.error(error);
    });
};