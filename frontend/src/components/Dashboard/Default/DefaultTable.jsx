// SoilTable.js
import React, { useEffect, useRef, useState } from "react";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import { useDispatch, useSelector } from "react-redux";
import Loader from "../../Loader/Loader";
import ReactPaginate from "react-paginate";
import Table from "../../../utils/Table";
import _debounce from "lodash/debounce";
import copy from "copy-text-to-clipboard";
import {
  getAllSamples,
  resetNotificationState,
} from "../../../reducers/sampleSlice";
import { Link } from "react-router-dom";
import { notifyError, notifyMessage } from "../../../utils/notify";
import FilterModal from "./FilterModal";
import { updatePage } from "../../../reducers/filterSlice";
const DefaultTable = ({ handleCurrentSelectedSample }) => {
  const { user } = useSelector((state) => state.auth);
  const { loading, samples, pagination, error, message } = useSelector(
    (state) => state.sample
  );
  const [searchQuery, setSearchQuery] = useState("");
  const { filters } = useSelector((state) => state.filter);
  const dispatch = useDispatch();
  const [showSampleModal, setSetshowFilterModal] = useState(false);
  const closeFilterModal = () => {
    setSetshowFilterModal(false);
  };
  const handlePageNo = (page_no) => {
    if (filters?.page != page_no) dispatch(updatePage(page_no));
  };
  const [filteredSamples, setFilteredSamples] = useState([]);

  useEffect(() => {
    const filteredData = samples.filter((data) =>
      Object.values(data).some((value) =>
        value.toString().toLowerCase().includes(searchQuery.toLowerCase())
      )
    );
    setFilteredSamples(filteredData);
  }, [searchQuery, samples]);
  // // Define a debounced function for handling form submission
  // const debouncedScanSample = useRef(
  //   _debounce((page, filter, searchQuery) => {
  //     dispatch(getAllSamples({ page, filter, searchQuery:["a","b"] }));
  //   }, 1000)
  // ).current;
  useEffect(() => {
    // debouncedScanSample(1, filter, searchQuery);
    dispatch(
      getAllSamples({
        ...filters,
        page: filters?.page + 1,
        is_archived:
          filters?.is_archived === "true"
            ? true
            : filters?.is_archived === "false"
            ? false
            : "",
      })
    );
  }, [filters]);
  const tableColumnHeadings = [
    { icon: "arcticons:tix-id", label: "Project ID" },
    { icon: "tabler:number", label: "Sample no." },
    { icon: "mdi:location", label: "Location" },
    { icon: "iconoir:depth", label: "Depth" },
    { icon: "lets-icons:status", label: "Status" },
    { icon: "material-symbols:history", label: "Current Station" },
    { icon: "mdi:interaction-tap", label: "Action" },
  ];
  useEffect(() => {
    if (error) {
      notifyError("Error", error);
    }
    if (message) {
      notifyMessage("Success", message);

      dispatch(
        getAllSamples({
          ...filters,
          page: filters?.page + 1,
          is_archived:
            filters?.is_archived === "true"
              ? true
              : filters?.is_archived === "false"
              ? false
              : "",
        })
      );
    }
    dispatch(resetNotificationState());
  }, [error, message]);
  return (
    <div>
      <div className="">
        <>
          <div className="flex justify-start lg:justify-end items-center my-2 px-4">
            <div className="relative w-full flex items-center">
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
            </div>
            <div className="flex items-center justify-center rounded-l-lg">
              <button
                className="btn dark:bg-zinc-800 text-xl"
                title="Filter"
                onClick={() => setSetshowFilterModal(true)}
              >
                <IconTemplate
                  icon="mage:filter"
                  class=" text-gray-500 dark:text-gray-400"
                />
              </button>
            </div>
          </div>
          {showSampleModal && (
            <FilterModal handleCloseModal={closeFilterModal} />
          )}

          {loading ? (
            <Loader />
          ) : (
            <Table columnHeadings={tableColumnHeadings}>
              <>
                {filteredSamples?.length > 0 ? (
                  filteredSamples?.map((data, i) => (
                    <tr
                      className="border-t border-zinc-700  text-center font-semibold  "
                      key={i}
                    >
                      <td>{data?.project_no}</td>
                      <td>{data?.sample_no}</td>
                      <td>{data?.location}</td>
                      <td>{data?.top_depth}</td>
                      <td>
                        <span
                          className={`${
                            data?.is_archived
                              ? "bg-red-100 text-red-700"
                              : "bg-blue-100 text-blue-700"
                          } px-4 py-1 rounded-xl`}
                        >
                          {data?.is_archived ? "Archived" : "In transit"}
                        </span>
                      </td>
                      <td>
                        <div className="mx-auto bg-cyan-100 text-cyan-600 py-1 rounded-lg dark:bg-gray-600 dark:text-gray-300 break-words max-w-[10rem]">
                          {data?.current_station?.station_name}
                        </div>
                      </td>

                      <td className="flex items-center justify-center gap-3 ">
                        <button
                          onClick={() => {
                            copy(data?.id);
                            notifyMessage("copy", "Sample ID Copied");
                          }}
                          title="Copy Sample ID"
                        >
                          <IconTemplate
                            icon={"lets-icons:copy-alt-light"}
                            className={"text-xl"}
                          />
                        </button>
                        <Link to={`/dashboard/details/${data?.id}`}>
                          <button className="btn  w-20  border-zinc-700 btn-ghost btn-xs">
                            Details
                          </button>
                        </Link>
                        {user?.is_staff && (
                          <button
                            onClick={() => handleCurrentSelectedSample(data)}
                            className="text-lg"
                          >
                            <IconTemplate icon={"basil:edit-outline"} />
                          </button>
                        )}
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td
                      colSpan={tableColumnHeadings.length}
                      className="text-center"
                    >
                      No records found
                    </td>
                  </tr>
                )}
              </>
            </Table>
          )}
        </>
      </div>
      <div className="flex flex-col flex-grow my-3 overflow-x-auto">
        <ReactPaginate
          breakLabel="..."
          nextLabel=">"
          forcePage={filters?.page}
          onPageChange={(e) => handlePageNo(e.selected)}
          pageRangeDisplayed={3}
          pageCount={(pagination?.total_items && pagination?.total_pages) || 0}
          previousLabel="<"
          renderOnZeroPageCount={null}
          containerClassName="flex gap-3 justify-center items-center pb-3 "
          pageClassName="rounded-lg hover:bg-blue-500"
          pageLinkClassName="flex items-center justify-center w-full h-full border py-1 px-3 rounded-lg"
          previousClassName="rounded-xl border border-zinc-700 hover:text-white hover:bg-blue-500 mr-5"
          previousLinkClassName="flex items-center justify-center w-full h-full p-2 px-3 rounded-lg transition-transform transform hover:-translate-x-1 "
          nextClassName="rounded-xl border border-zinc-700 hover:text-white hover:bg-blue-500 ml-5"
          nextLinkClassName="flex items-center justify-center w-full h-full p-2 px-3 rounded-lg transition-transform transform hover:translate-x-1 "
          disabledClassName="bg-gray-900 text-gray-500 hover:bg-gray-900 "
          disabledLinkClassName="cursor-not-allowed"
          activeClassName="bg-blue-500"
          breakAriaLabels={{
            forward: "Jump forward",
            backward: "Jump backward",
          }}
          pageRangeClassName="page-range" // Add this class for page numbers
        />
      </div>
    </div>
  );
};
export default DefaultTable;
