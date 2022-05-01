import { useState } from "react";
import "./ImageUploader.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faHouse } from "@fortawesome/free-solid-svg-icons";

const ImageUploader = (props) => {
  console.log(props);
  const [image, setImage] = useState({
    image_file: "",
    preview_URL: "default_image.png",
  });

  const [loaded, setLoaded] = useState(false);

  let inputRef;

  const saveImage = (e) => {
    e.preventDefault();
    const fileReader = new FileReader();

    if (e.target.files[0]) {
      setLoaded("loading");
      fileReader.readAsDataURL(e.target.files[0]);
    }
    fileReader.onload = () => {
      setImage({
        image_file: e.target.files[0],
        preview_URL: fileReader.result,
      });
      setLoaded(true);
    };
  };

  const deleteImage = () => {
    setImage({
      image_file: "",
      preview_URL: "default_image.png",
    });
    setLoaded(false);
  };

  const sendImageToServer = async () => {
    if (image.image_file) {
      const formData = new FormData();
      formData.append("file", image.image_file);
      // await axios.post("/api/image/upload", formData);
      // alert("서버에 등록이 완료되었습니다!"); 등록하는 법을 모르겠어요....
      setImage({
        image_file: "",
        preview_URL: "default_image.png",
      });
      setLoaded(false);
    } else {
      alert("사진을 등록하세요!");
    }
  };

  return (
    <div className="uploader-wrapper">
      <a class="toMenu" href="/#">
        <FontAwesomeIcon icon={faHouse} />
      </a>
      <input
        type="file"
        accept="image/*"
        onChange={saveImage}
        ref={(refParam) => (inputRef = refParam)}
        style={{ display: "none" }}
      />
      <div className="img-wrapper">
        <img src={image.preview_URL} />
        {/* {loaded === false || loaded === true ? (
         
        ) : (
           <Spin className="img-spinner" tip="이미지 불러오는중" />
        )} */}
      </div>

      <div className="upload-button">
        <button onClick={() => inputRef.click()}>Preview</button>
        <button onClick={deleteImage} danger>
          Delete
        </button>
        <button onClick={sendImageToServer}>Upload</button>
      </div>
    </div>
  );
};

export default ImageUploader;
