import "./ProfileUpper.css";


function ProfileUpper(){
    const user = {name: "이동언", intro: "안녕하세요, SW마에스트로 13기 연수생 이동언입니다:)", profileImage: ""};
    return(
        <div id="ProfileUpper">
            <div><img id="ProfileImage" src={user.profileImage}/></div>
            <p id="ProfileName">{user.name}</p>
            <p id="ProfileIntro">{user.intro}</p>
        </div>
    )
}

export default ProfileUpper;