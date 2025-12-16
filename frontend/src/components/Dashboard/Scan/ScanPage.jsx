import React, { useEffect, useState } from "react";
import _debounce from "lodash/debounce";
import ScanSoilDetail from "./ScanSoilDetail";
import { useDispatch, useSelector } from "react-redux";
import {
  dispatchSample,
  resetNotificationState,
  scanSample,
  searchSample,
} from "../../../reducers/sampleSlice";
import { notifyError, notifyMessage } from "../../../utils/notify";
import Loader from "../../Loader/Loader";
import {
  fetchSampleLocationDetails,
  resetNotificationState as resetSampleLocatorNotificationState,
} from "../../../reducers/sampleLocatorSlice";
import LastLocationDetails from "../Locator/LastLocationDetails";
import { Link } from "react-router-dom";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import QRCodeScannerModal from "../../../utils/QRCodeScannerModal";
import {
  autoAcquireThunk,
  autoGenerateAndDispatchThunk,
  autoGenerateThunk,
} from "../../../reducers/settingSlice";

const ScanPage = () => {
  const { loading, error, scannedSample, message } = useSelector(
    (state) => state.sample
  );
  const [cameraModal, setCameraModal] = useState(false);
  const [qrCodeScannerResult, setQrCodeScannerResult] = useState([]);
  // const {
  //   loading: sampleLocationLoading,
  //   sampleLocation: lastSampleStationLocation,
  //   error: sampleLocationError,
  //   message: sampleLocationMessage,
  // } = useSelector((state) => state.sampleLocator);
  const { user } = useSelector((state) => state.auth);
  const {
    autoAcquire,
    autoGenerate,
    dispatch: sampleDispatch,
  } = useSelector((state) => state.settings);

  const [sampleId, setSampleId] = useState("");
  // const extractInformation = (inputText) => {
  //   const regexPattern =
  //     /Project No: (\S+)\nLocation: (\S+)\nSample No: (\S+)\nTop Depth: (\S+)/;

  //   const match = inputText.match(regexPattern);

  //   if (match) {
  //     const [, project_no, location, sample_no, top_depth] = match;

  //     const resultJSON = {
  //       location: location,
  //       top_depth: top_depth,
  //       project_no: project_no,
  //       sample_no: sample_no,
  //     };

  //     return resultJSON;
  //   } else {
  //     console.log("No match found.");
  //     return null;
  //   }
  // };
  const extractInformation = (inputText) => {
    const regexPatternWithNextLine =
      /Project No: (\S+)\nLocation: (\S+)\nSample No: (\S+)\nTop Depth: (\S+)/;
    const regexPatternWithWhitespace =
      /Project No: (\S+) Location: (\S+) Sample No: (\S+) Top Depth: (\S+)/;

    const matchWithTestType = inputText.match(regexPatternWithNextLine);
    const matchWithoutTestType = inputText.match(regexPatternWithWhitespace);

    if (matchWithTestType) {
      const [, project_no, location, sample_no, top_depth] = matchWithTestType;
      const resultJSON = {
        location: location,
        top_depth: parseFloat(top_depth),
        project_no: parseInt(project_no),
        sample_no: sample_no,
        test_type: matchWithTestType[5],
      };
      return resultJSON;
    } else if (matchWithoutTestType) {
      const [, project_no, location, sample_no, top_depth] =
        matchWithoutTestType;
      const resultJSON = {
        location: location,
        top_depth: parseFloat(top_depth),
        project_no: parseInt(project_no),
        sample_no: sample_no,
      };
      console.log(resultJSON);
      return resultJSON;
    } else {
      console.log("No match found.");
      return null;
    }
  };

  const dispatch = useDispatch();
  // Define a debounced function for handling form submission
  const debouncedScanSample = _debounce((value) => {
    const checkIDOrQrData = extractInformation(value);
    // console.log(checkIDOrQrData);
    if (checkIDOrQrData) {
      dispatch(
        scanSample({
          ...checkIDOrQrData,
          autoAcquire,
          autoGenerate,
          dispatch: sampleDispatch,
        })
      );
    } else {
      const data = {
        sample_id: value,
      };
      if (autoAcquire) {
        data.autoAcquire = true;
      }
      dispatch(scanSample(data));
    }

    // } else {
    //   dispatch(searchSample(value));
    // }
  }, 2000);

  const handleSubmit = () => {
    dispatch(scanSample({ sample_id: scannedSample?.id }));
  };
  const handleDispatch = () => {
    if (scannedSample)
      dispatch(dispatchSample(scannedSample?.current_station?.id));
  };
  const handleCameraCloseModal = () => setCameraModal(false);

  useEffect(() => {
    if (error) {
      if (typeof error === "object") {
        Object.keys(error).forEach((key) => {
          const errorMessage = error[key].join(", ");
          notifyError(key, errorMessage);
        });
      } else {
        notifyError("sample_not_found", error);
      }
      dispatch(resetNotificationState());
    }
    if (message) {
      notifyMessage("sample_found", message);
      dispatch(resetNotificationState());
      // if (scannedSample) dispatch(searchSample(scannedSample?.id));
    }
    // if (sampleLocationError) {
    //   notifyError("Error", sampleLocationError);
    //   dispatch(resetSampleLocatorNotificationState());
    // }
  }, [error, message]);

  useEffect(() => {
    if (sampleId) debouncedScanSample(sampleId);
  }, [sampleId]);
  // useEffect(() => {
  //   if (sampleId && scannedSample) {
  //     dispatch(
  //       fetchSampleLocationDetails({
  //         sampleId: scannedSample?.id,
  //         filter: "last",
  //       })
  //     );
  //   }
  // }, [scannedSample]);
  useEffect(() => {
    if (qrCodeScannerResult.length) {
      const decodedText = qrCodeScannerResult[0];
      if (decodedText) {
        console.log(decodedText);
        const resultJSON = extractInformation(decodedText);
        if (resultJSON) {
          // setSampleId(resultJSON.sample_no);
          // console.log(resultJSON);
          // alert(JSON.stringify(resultJSON));
          dispatch(
            scanSample({
              ...resultJSON,
              autoAcquire,
              autoGenerate,
              dispatch: sampleDispatch,
            })
          );
        }
      }
    }
  }, [qrCodeScannerResult]);

  return (
    <div>
      <div className="flex flex-col xl:flex-row mb-6 justify-center items-center gap-6 xl:gap-3 p-4">
        <div className="flex items-center w-full max-w-2xl">
          <label className="form-control flex-1 mr-2">
            <div className="label">
              <span className="label-text dark:text-white">
                Enter QR details or Sample Id
              </span>
            </div>
            <input
              type="text"
              placeholder="Enter here...."
              className="input dark:bg-zinc-800 input-bordered rounded-xl py-7 w-full pr-10"
              required
              name="sampleId"
              value={sampleId}
              onChange={(e) => setSampleId(e.target.value)}
            />
          </label>

          <span
            className="flex items-center cursor-pointer p-3.5"
            title="Scan a QR code"
            onClick={() => setCameraModal(true)}
          >
            <IconTemplate
              icon={"ant-design:camera-filled"}
              className={"text-3xl mt-7 dark:text-white text-gray-700"}
            />
          </span>
        </div>
        <div className="xl:mt-9 flex gap-2">
          {user?.station_master?.station?.id && (
            <span
              onClick={() => dispatch(autoAcquireThunk(!autoAcquire))}
              className={`p-3.5 border border-gray-700 rounded-lg cursor-pointer transition-all font-semibold ${
                autoAcquire
                  ? "bg-blue-400 text-white"
                  : "bg-transparent dark:text-white"
              }`}
              title="Auto Acquire"
            >
              <IconTemplate icon={"mdi:automatic"} className={"text-2xl"} />
            </span>
          )}
          {user?.station_master?.station?.is_storage_center && (
            <>
              <span
                onClick={() =>
                  dispatch(
                    autoGenerateThunk(
                      sampleDispatch && autoGenerate
                        ? autoGenerate
                        : !autoGenerate
                    )
                  )
                }
                // disabled={sampleDispatch}
                className={`p-3.5 border border-gray-700 rounded-lg cursor-pointer transition-all font-semibold ${
                  autoGenerate && !sampleDispatch
                    ? "bg-blue-400 text-white"
                    : "bg-transparent dark:text-white"
                }`}
                title="Auto Generate"
              >
                <IconTemplate
                  icon="lucide:git-pull-request-create"
                  className={"text-2xl"}
                ></IconTemplate>
              </span>
              <span
                onClick={() =>
                  dispatch(autoGenerateAndDispatchThunk(!sampleDispatch))
                }
                // disabled={autoGenerate}
                className={`p-3.5 border border-gray-700 rounded-lg cursor-pointer transition-all font-semibold ${
                  autoGenerate && sampleDispatch
                    ? "bg-blue-400 text-white"
                    : "bg-transparent dark:text-white"
                }`}
                title="Auto Generate and Dispatch"
              >
                <IconTemplate icon={"lucide:git-pull-request-create-arrow"} className={"text-2xl"} />
              </span>
            </>
          )}
        </div>
      </div>
      {cameraModal && (
        <>
          <QRCodeScannerModal
            handleCloseModal={handleCameraCloseModal}
            setQrCodeScannerResult={setQrCodeScannerResult}
          />
        </>
      )}
      {loading && <Loader />}

      {scannedSample?.id && (
        <div>
          <h1 className="text-gray-500 text-lg flex justify-center my-5">
            Scanned sample
          </h1>
          <ScanSoilDetail sample={scannedSample} />
          {/* <Table forTest={true} /> */}
          {scannedSample && (
            <>
              <div className="mt-5">
                <LastLocationDetails
                  sample={scannedSample}
                  sampleLocation={scannedSample?.current_station}
                />
              </div>

              <div className="flex flex-col justify-center items-center mt-5">
                {scannedSample?.is_completed ? (
                  <div>This sample is completed.</div>
                ) : (
                  <>
                    {scannedSample?.current_station?.is_completed &&
                    scannedSample?.current_station?.is_dispatched ? (
                      scannedSample?.current_station?.station_id ===
                      user?.station_master?.station?.id ? (
                        <div>
                          This sample is dispatched successfully from this
                          station.
                        </div>
                      ) : (
                        <button
                          type="button"
                          className="border  p-2 rounded-lg bg-blue-700"
                          onClick={handleSubmit}
                        >
                          Acquire Sample
                        </button>
                      )
                    ) : (
                      ""
                    )}

                    {scannedSample?.current_station?.is_completed &&
                      !scannedSample?.current_station?.is_dispatched &&
                      scannedSample?.current_station?.station_id ===
                        user?.station_master?.station?.id && (
                        <button
                          type="button"
                          className="border  p-2 rounded-lg bg-green-700"
                          onClick={handleDispatch}
                        >
                          Dispatch
                        </button>
                      )}
                    <Link
                      to={`/dashboard/details/${scannedSample?.id}`}
                      className="border text-white p-2 rounded-lg bg-blue-700 ms-3"
                    >
                      Show Details
                    </Link>
                  </>
                )}
              </div>
            </>
          )}
        </div>
      )}
    </div>
  );
};

export default ScanPage;
