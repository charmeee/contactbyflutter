import "./index.css";
import "./styles/styles.scss";

import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import { Reset } from "styled-reset";
import { isBrowser, isMobile } from "react-device-detect";
import AppMobile from "./AppMobile";
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <React.StrictMode>
    <Reset />
    {isBrowser && <App />}
    {isMobile && <AppMobile />}
  </React.StrictMode>
);
