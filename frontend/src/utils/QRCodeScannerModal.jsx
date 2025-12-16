import { Html5Qrcode } from "html5-qrcode";
import React, { useRef, useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { changeCameraId } from "../reducers/settingSlice";

const QRCodeScannerModal = ({ setQrCodeScannerResult, handleCloseModal }) => {
  const readerRef = useRef(null);
  const { cameraId } = useSelector((state) => state.settings);
  const [cameras, setCameras] = useState([]);
  const dispatch = useDispatch();

  const [qrCodeScannerObj, setQrCodeScannerObj] = useState(null);
  const config = { fps: 10, qrbox: { width: 250, height: 250 } };
  const qrCodeSuccessCallback = (decodedText, decodedResult) => {
    /* handle success */
    stopScanning(); // Stop the previous scanning session
    setQrCodeScannerResult([decodedText, decodedResult]);
    handleCloseModal();
  };
  const handleCLoseButton = () => {
    stopScanning();
    handleCloseModal();
  };
  const handleCameraChange = (selectedCameraId) => {
    stopScanning(); // Stop the previous scanning session
    dispatch(changeCameraId(selectedCameraId));
  };
  const startScanning = () => {
    console.log(qrCodeScannerObj);
    if (qrCodeScannerObj && qrCodeScannerObj.getState() == 1) {
      qrCodeScannerObj
        .start(
          { deviceId: { exact: cameraId } },
          config,
          qrCodeSuccessCallback,
          (errorMessage) => {
            // parse error, ignore it.
            console.log(errorMessage);
          }
        )
        .catch((err) => {
          // Start failed, handle it.
          console.log(err);
        });
    }
  };
  const stopScanning = async () => {
    if (qrCodeScannerObj && qrCodeScannerObj.getState() == 2) {
      try {
        await qrCodeScannerObj.stop();
      } catch (error) {
        console.log(error);
      }
    }
  };
  useEffect(() => {
    if (readerRef.current) {
      if (!qrCodeScannerObj && readerRef.current.id) {
        setQrCodeScannerObj(new Html5Qrcode(readerRef.current.id));
      }
    }
  }, [readerRef]);

  useEffect(() => {
    Html5Qrcode.getCameras()
      .then((devices) => {
        if (devices && devices.length) {
          console.log(devices);
          if (!cameraId) dispatch(changeCameraId(devices[0].id));
          setCameras(devices);
        }
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);
  useEffect(() => {
    startScanning();
  }, [cameraId, qrCodeScannerObj]);

  return (
    <div>
      <dialog
        id="camera-modal"
        className={`modal modal-open backdrop-blur px-4 transition-all`}
      >
        <div className="modal-box dark:bg-zinc-900 w-full lg:w-3/12 max-w-5xl">
          <h1 className="text-xl ml-2">Scan QR</h1>
          {/* Use the ref attribute to assign the ref to the div */}
          <div className="flex flex-wrap mt-4 justify-center">
            <span className="mr-2">Choose Camera:</span>
            <select
              className="border border-gray-300 rounded-md px-2 py-1"
              onChange={(e) => handleCameraChange(e.target.value)}
              value={cameraId}
            >
              {cameras.map((camera) => (
                <option key={camera.id} value={camera.id}>
                  {camera.label}
                </option>
              ))}
            </select>
          </div>
          <div
            className="flex flex-wrap mt-4 justify-center"
            id="reader"
            ref={readerRef}
          ></div>
          <div className="flex items-center justify-center">
            <button
              className="btn text-lg mt-8 px-8 hover:text-black dark:hover:text-white text-white dark:text-zinc-800  bg-zinc-800 dark:bg-white"
              onClick={handleCLoseButton}
              type="button"
            >
              Close
            </button>
          </div>
        </div>
      </dialog>
    </div>
  );
};

export default QRCodeScannerModal;
