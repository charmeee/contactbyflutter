import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {  faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";

import "./SearchBar.css";

function SearchBar() {
  return (
    <div id="SearchBar">
      <a id="SearchBarIcon" href="/search" onClick={(event)=>{
        event.preventDefault();
      }}><FontAwesomeIcon icon={faMagnifyingGlass}/></a>
  </div>
  );
}

export default SearchBar;
