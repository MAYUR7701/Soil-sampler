import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import Aside from "./Sidebar/Aside";
import DashboardNavbar from "./DashboardNavbar";
import SearchPage from "./Search/SearchPage";
import DetailPage from "../DashboardContents/Table/DetailsPage";
import DefaultPage from "./Default/Default";
import ScanPage from "./Scan/ScanPage";
import { useDispatch, useSelector } from "react-redux";
import {
  getUserDetails,
  resetNotificationState,
} from "../../reducers/authSlice";
import Loader from "../Loader/Loader";
import StationMasterNotFound from "./StationMaster/StationMasterNotFound";
import TestsMainPage from "./Tests/TestsMainPage";
import FileUpload from "./Upload/FileUpload";
// import { resetNotificationState as resetSampleTestNotificationState } from "../../reducers/sampleTestSlice";
// import { notifyError, notifyMessage } from "../../utils/notify";
// import { getAllSamples } from "../../reducers/sampleSlice";

const Dashboard = () => {
  const { loading, isAuthenticated, error, user } = useSelector(
    (state) => state.auth
  );
  // const { error: sampleTestError, message: sampleTestMessage } = useSelector(
  //   (state) => state.sampleTest
  // );

  const navigate = useNavigate();
  const { slug } = useParams();
  const [isSidebarOpen, setIsSidebarOpen] = useState(false);
  const [activeMenu, setActiveMenu] = useState(slug || "dashboard");
  const dispatch = useDispatch();
  let ActiveComponents;
  switch (slug) {
    case "search":
      ActiveComponents = SearchPage;
      break;
    case "details":
      ActiveComponents = DetailPage;
      break;
    case "scan":
      ActiveComponents = ScanPage;
      break;
    case "tests":
      ActiveComponents = TestsMainPage;
      break;
    case "upload":
      if (user?.station_master?.station?.is_storage_center)
      ActiveComponents = FileUpload;
    else
    ActiveComponents = DefaultPage;
      break;
    default:
      ActiveComponents = DefaultPage;
      break;
  }
  const toggleSidebar = () => {
    setIsSidebarOpen((prevIsSidebarOpen) => !prevIsSidebarOpen);
  };
  useEffect(() => {
    dispatch(getUserDetails());
  }, []);

  useEffect(() => {
    if (!isAuthenticated || error) {
      resetNotificationState();
      navigate("/login");
    }
  }, [isAuthenticated, error]);

  return (
    <>
      {loading ? (
        <Loader />
      ) : (
        <div>
          <Aside
            isSidebarOpen={isSidebarOpen}
            toggleSidebar={toggleSidebar}
            setActiveMenu={setActiveMenu}
            activeMenu={activeMenu}
          />
          <div className="ml-auto lg:w-[75%] xl:w-[80%] 2xl:w-[85%]">
            <DashboardNavbar slug={slug} toggleSidebar={toggleSidebar} />
            <div className=" bg-white h-screen dark:bg-black">
              <div className=" ">
                <div className="  dark:border-gray-800">
                  <span className="dark:text-white">
                    {user?.station_master || user?.is_staff || user?.can_view ? (
                      <ActiveComponents
                      />
                    ) : (
                      <StationMasterNotFound />
                    )}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default Dashboard;
