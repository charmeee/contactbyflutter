import "./ProfileUpper.css";


function ProfileUpper({userData}){
    const user = {name: userData.name, intro: userData.intro, profileImage: ""};
    return(
        <div id="ProfileUpper">
            <div><img id="ProfileImage" src={user.profileImage}/></div>
            <p id="ProfileName">{user.name}</p>
            <p id="ProfileIntro">{user.intro}</p>
        </div>
    )
}
export default ProfileUpper;