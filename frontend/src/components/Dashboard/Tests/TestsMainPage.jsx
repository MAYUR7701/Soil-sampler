import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { getAllSampleTests, resetNotificationState } from "../../../reducers/sampleTestSlice";
import Button from "../../../utils/Button";
import SoilDetailsLabel from "../Scan/ScanSoilDetail";
import LastLocationDetails from "../Locator/LastLocationDetails";
import AddTestModal from "../TestForm/AddTestModal";
import Table from "../../../utils/Table";
import { notifyError, notifyMessage } from "../../../utils/notify";
import Loader from "../../Loader/Loader";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import ReactPaginate from "react-paginate";
import { useParams } from "react-router-dom";
const TestsMainPage = () => {
  const { sample } = useSelector((state) => state.sample);
  const { user } = useSelector((state) => state.auth);
  const {
    sampleLocation,
  } = useSelector((state) => state.sampleLocator);
  const {
    loading,
    error,
    message,
    sampleTest,
    sampleTests,
    pagination,
  } = useSelector((state) => state.sampleTest);
  const [isEditOrView, setIsEditOrView] = useState("");
  const [currentSelectedSample, setCurrentSelectedSample] = useState(null);
  const [showModal, setShowModal] = useState(false)
  const [searchQuery, setSearchQuery] = useState("");
  const closeModal = () => {
    setShowModal(false)
    setCurrentSelectedSample(null);
    setIsEditOrView("");
  }
  const dispatch = useDispatch();
  const {sampleIdOrsampleLocatorId:sampleLocatorId}=useParams();
  const tableColumnHeadings = [{ icon: 'tabler:number', label: "Test No." }, { icon: 'lets-icons:status', label: "Status" }, { icon: 'mdi:interaction-tap', label: "Action" }]
  const [filteredSampleTests, setFilteredSampleTests] = useState([]);

  useEffect(() => {
    const filteredData = sampleTests.filter((data) =>
      Object.values(data).some((value) =>
        value.toString().toLowerCase().includes(searchQuery.toLowerCase())
      )
    );
    setFilteredSampleTests(filteredData);
  }, [searchQuery, sampleTests]);
  useEffect(() => {
    if(sampleLocatorId)
    dispatch(getAllSampleTests({ locatorId: sampleLocatorId }));
  }, [])
  useEffect(() => {
    if (error) {
      notifyError("Error", error);
      dispatch(resetNotificationState());
    }
    if (message) {
      notifyMessage("Success", message);
      dispatch(resetNotificationState());
      dispatch(getAllSampleTests({ locatorId: sampleLocation?.id }));
    }
  }, [error, message, dispatch]);
  return (
    <div className="py-2">
      <div className="px-10 lg:justify-start m-4">
        <div className="">
          <SoilDetailsLabel sample={sample} />
          <div className="lg:relative flex justify-end -left-14">
          {!sample?.is_completed &&
            user?.station_master?.station?.id === sampleLocation?.station_id && !sampleLocation?.is_completed &&
            <Button  label={"Add Test"} handleClick={() => setShowModal(true)} />}
          </div>
          
        </div>
        <LastLocationDetails
          sample={sample}
          sampleLocation={sampleLocation}
        />
      </div>
      {showModal &&
        <AddTestModal
          closeModal={closeModal}
          sample={sample}
          sampleLocation={sampleLocation}
          isEditOrView={isEditOrView}
          sampleTestDetails={currentSelectedSample}
        />
      }
      <div>
        <h2 className="text-left text-2xl font-semibold m-4 ">
          Soil Tests
        </h2>
        {/* <div className="relative w-full flex items-center">
              <IconTemplate
                icon={"codicon:search"}
                className={
                  "absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-500 dark:text-gray-400 text-xl"
                }
              />
              <input
                type="text"
                className="input input-bordered w-full p-3 pl-10  rounded-lg dark:bg-zinc-800 focus:outline-none focus:ring focus:border-blue-300 mr-3"
                placeholder="Search"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                autoFocus
              />
            </div> */}
        <Table columnHeadings={tableColumnHeadings} >
          {loading ? (
            <Loader />
          ) : (
            <>
              {filteredSampleTests?.length > 0 ? (
                filteredSampleTests?.map((data, i) => (
                  <tr className="border-t border-zinc-700 text-center font-semibold" key={i}>
                    <td>{i + 1}</td>
                    <td>
                      <span className={`${data?.is_completed ? "bg-green-100 text-green-700" : "bg-blue-100 text-blue-700"} px-4 py-1 rounded-xl`}>
                        {data?.is_completed ? "Completed" : "Pending"}
                      </span>
                    </td>
                    <td className="flex gap-5 justify-center items-center">
                      <button onClick={() => { setCurrentSelectedSample(data); setIsEditOrView("view"); setShowModal(true) }}>
                        <IconTemplate icon={"fluent-mdl2:view"} />
                      </button>
                      {!data?.is_completed && user?.station_master?.station?.id == sampleLocation?.station_id &&
                        <button onClick={() => { setCurrentSelectedSample(data); setIsEditOrView("edit"); setShowModal(true) }}>
                          <IconTemplate icon={"basil:edit-outline"} />
                        </button>
                      }
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan={tableColumnHeadings.length} className="text-center">
                    No records found
                  </td>
                </tr>
              )}
            </>
          )}
        </Table>
      </div>
    </div>
  );
};
export default TestsMainPage