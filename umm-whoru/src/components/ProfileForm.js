import { useState } from "react";
import "./ProfileForm.css";
const ProfileForm = () => {
  return (
    <div class="edit-profile">
      <form>
        <div class="profile-input">
          <label for="name">Name</label>
          <input id="name" name="name" type="text" />
        </div>
        <div class="profile-input">
          <label for="phone">Phone</label>
          <input id="phone" name="phone" type="tel" />
        </div>
        <div class="profile-input">
          <label for="intro">Introduce</label>
          <input id="intro" name="intro" type="text" />
        </div>
        <div>
          <button
            id="save"
            type="submit"
            //onSubmit={onSubmit}
          >
            Save
          </button>
        </div>
      </form>
    </div>
  );
};

export default ProfileForm;
