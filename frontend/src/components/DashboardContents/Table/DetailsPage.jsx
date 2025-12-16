import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import {
  dispatchSample,
  getSampleDetails,
  resetNotificationState,
} from "../../../reducers/sampleSlice";
import { notifyError, notifyMessage } from "../../../utils/notify";
import Loader from "../../Loader/Loader";
import LastLocationDetails from "../../Dashboard/Locator/LastLocationDetails";
import {
  fetchSampleLocationDetails,
  resetNotificationState as resetSampleLocatorNotificationState,
  updateSampleLocationIsCompleted,
} from "../../../reducers/sampleLocatorSlice";
import LocatorTimeLine from "../../Dashboard/Locator/LocatorTimeLine";
import SoilDetailLabel from "../../Dashboard/Scan/ScanSoilDetail";
import { Link, useParams } from "react-router-dom";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import QrCodeModel from "../../../utils/QrCodeModel";
const DetailPage = () => {
  const { loading, sample, error, message } = useSelector(
    (state) => state.sample
  );
  const { sampleIdOrsampleLocatorId: sampleId } = useParams();
  const { user } = useSelector((state) => state.auth);

  const [showTimeLine, setTimeLine] = useState(false);
  const [showQrCode, setShowQrCode] = useState(false);
  const {
    loading: sampleLocationLoading,
    sampleLocation,
    error: sampleLocationError,
    message: sampleLocationMessage,
  } = useSelector((state) => state.sampleLocator);

  const dispatch = useDispatch();
  const handleMarkAsCompleted = () => {
    dispatch(
      updateSampleLocationIsCompleted({
        sampleLocatorId: sampleLocation?.id,
        isCompleted: true,
      })
    );
    dispatch(fetchSampleLocationDetails({ sampleId, filter: "last" }));
  };
  const handleDispatch = () => {
    dispatch(dispatchSample(sampleLocation?.id));
    dispatch(fetchSampleLocationDetails({ sampleId, filter: "last" }));
  };
  useEffect(() => {
    if (sampleId) {
      dispatch(getSampleDetails(sampleId));
      dispatch(fetchSampleLocationDetails({ sampleId, filter: "last" }));
    }
  }, [sampleId]);

  useEffect(() => {
    if (error) {
      notifyError("Error", error);
      dispatch(resetNotificationState());
    }
    if (message) {
      notifyMessage("Success", message);
      dispatch(resetNotificationState());
    }
    if (sampleLocationError) {
      if (typeof error === "object") {
        Object.keys(error).forEach((key) => {
          const errorMessage = error[key].join(", ");
          notifyError(key, errorMessage);
        });
      } else {
        notifyError("Error", error);
      }
      dispatch(resetSampleLocatorNotificationState());
    }
    if (sampleLocationMessage) {
      notifyMessage("Success", sampleLocationMessage);
      dispatch(resetSampleLocatorNotificationState());
    }
  }, [error, sampleLocationError, sampleLocationMessage, message, dispatch]);

  return (
    <div>
      {loading ? (
        <Loader />
      ) : (
        <>
          {showQrCode && (
            <QrCodeModel sample={sample} handleClose={setShowQrCode} />
          )}
          <>
            <SoilDetailLabel sample={sample} />
            {sampleLocationLoading ? (
              <div className="flex justify-center items-center mt-2">
                Loading...
              </div>
            ) : (
              <>
                {sampleLocationError ? (
                  <>
                    <h1 className="ml-7">Error : {sampleLocationError}</h1>
                  </>
                ) : (
                  <LastLocationDetails
                    sample={sample}
                    sampleLocation={sampleLocation}
                  />
                )}
              </>
            )}
            <div className="text-center my-4 flex flex-row gap-3 justify-center items-center ">
              {!sampleLocation?.is_completed &&
                user?.station_master?.station?.id ===
                  sampleLocation?.station_id && (
                  <button
                    className="btn bg-green-500 text-white"
                    onClick={handleMarkAsCompleted}
                  >
                    Complete Test
                  </button>
                )}
              {!sample?.is_archived &&
                sampleLocation?.is_completed &&
                !sampleLocation?.is_dispatched &&
                user?.station_master?.station?.id ===
                  sampleLocation?.station_id && (
                  <button
                    className="btn bg-green-500 text-white"
                    onClick={handleDispatch}
                  >
                    Dispatch
                  </button>
                )}
              <button
                onClick={() => setTimeLine((prev) => !prev)}
                className="btn bg-blue-600 text-white"
              >
                {showTimeLine ? "Hide" : "Show"} Timeline
              </button>
              <Link to={`/dashboard/tests/${sampleLocation?.id}`}>
                {" "}
                <button className="btn bg-blue-600 text-white">
                  View Tests
                </button>
              </Link>
              {/* {user?.station_master?.station?.is_storage_center && ( */}
              <div>
                <button
                  onClick={() => setShowQrCode(true)}
                  className="btn bg-purple-700 text-white"
                >
                  <IconTemplate icon="ic:baseline-qrcode" />
                  <span>Show QR</span>
                </button>
              </div>
              {/* )} */}
            </div>
            <div>
              {sampleLocation?.is_dispatched &&
                user?.station_master?.station?.id ===
                  sampleLocation?.station_id && (
                  <div className="text-center dark:text-gray-300">
                    This sample has been dispatched from this station
                  </div>
                )}
            </div>
            {showTimeLine && <LocatorTimeLine sample={sample} />}
          </>

          {/* {isError ? (
            <div className="flex justify-center items-center pt-5">Something went wrong.</div>
            // <NotFound />
          ) : (
     
          )} */}
        </>
      )}
    </div>
  );
};

export default DetailPage;
