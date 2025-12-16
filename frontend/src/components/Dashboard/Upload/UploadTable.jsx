import React, { useEffect, useState } from "react";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import { useDispatch, useSelector } from "react-redux";
import Loader from "../../Loader/Loader";
import ReactPaginate from "react-paginate";
import Table from "../../../utils/Table";
import { Link } from "react-router-dom";
import { notifyError, notifyMessage } from "../../../utils/notify";
import {
  deleteFile,
  fetchFileNames,
  resetNotificationState,
  updatePage,
} from "../../../reducers/uploadSlice";
import FilterFilesModal from "./FilterFilesModal";

const UploadTable = () => {
  const { loading, files, pagination, error, message, pageNo ,filter} = useSelector(
    (state) => state.upload
  );
  const [searchQuery, setSearchQuery] = useState("");
  const dispatch = useDispatch();
  const [showFilterFilesModal, setShowFilterFilesModal] = useState(false);
  const [filesToDisplay, setFilesToDisplay] = useState(files);

  useEffect(() => {
    const filteredData = files.filter((data) =>
      Object.values(data).some((value) =>
        value.toString().toLowerCase().includes(searchQuery.toLowerCase())
      )
    );
    setFilesToDisplay(filteredData);
  }, [searchQuery, files]);

  const tableColumnHeadings = [
    { icon: "tabler:number", label: "Sr No." },
    { icon: "mdi:file", label: "File" },
    { icon: "mdi:arrow-right", label: "Action" },
  ];

  useEffect(() => {
    if (error) {
      notifyError("Error", error);
    }
    if (message) {
      notifyMessage("Success", message);
    dispatch(fetchFileNames(pageNo));

    }
    dispatch(resetNotificationState());
  }, [error, message]);

  useEffect(() => {
    dispatch(fetchFileNames({ pageNo, filter }));
  }, [pageNo, filter,dispatch]);

  const handlePageNo = (page_no) => {
    console.log(page_no);
    if (pageNo !== page_no) dispatch(updatePage(page_no));
  };
  const handleFileDelete = (fileId) => {
  dispatch(deleteFile(fileId));
  }

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
                onClick={() => setShowFilterFilesModal(true)}
              >
                <IconTemplate
                  icon="mage:filter"
                  class=" text-gray-500 dark:text-gray-400"
                />
              </button>
            </div>
          </div>
          {showFilterFilesModal && (
            <FilterFilesModal handleCloseModal={()=>setShowFilterFilesModal(false)} />
          )}

          {loading ? (
            <Loader />
          ) : (
            <Table columnHeadings={tableColumnHeadings}>
              <>
                {filesToDisplay?.length > 0 ? (
                  filesToDisplay?.map((data, i) => (
                    <tr
                      className="border-t border-zinc-700 text-center font-semibold"
                      key={i}
                    >
                      <td>{i + 1}</td>
                      <td>
                        <a
                          href={`/media${data?.file}`}
                          download
                          className="flex items-center"
                        >
                          <IconTemplate
                            icon={"mdi:file-excel"}
                            className={"text-2xl text-green-700 mr-2"}
                          />
                          {data?.file?.split("/excel_files/")[1]}
                        </a>
                      </td>
                      <td>
                        <span className="flex items-center justify-center">
                          <button onClick={()=>handleFileDelete(data?.id)}>
                            <IconTemplate
                              icon={"mdi:delete"}
                              className={"text-2xl text-red-700 cursor-pointer"}
                            />
                          </button>
                        </span>
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
          forcePage={pageNo}
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

export default UploadTable;
