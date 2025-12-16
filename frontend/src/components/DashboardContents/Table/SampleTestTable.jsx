import React, { useEffect, useState } from "react";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import TableRow from "./TableRow";
import { useSelector } from "react-redux";
import Loader from "../../Loader/Loader";
import ReactPaginate from "react-paginate";
const Table = ({ fetchSamples, forTest }) => {
  const { loading, samples, pagination } = useSelector((state) => state.sample);
  const [filter, setFilter] = useState("");
  useEffect(() => {
    if (fetchSamples) fetchSamples(1, filter);
  }, [filter]);
  return (
    <div>
      {loading ? (
        <Loader />
      ) : (
        <div
          className=" overflow-x-auto flex-grow-0"
          style={{ height: "100%" }}
        >
          {!samples?.length ? (
            <div className="m-3">Sample records not found</div>
          ) : (
            <>
              {!forTest && (
                <div className="join flex  justify-start lg:justify-end items-center my-2 px-4">
                  <select
                    onChange={(e) => setFilter(e.target.value)}
                    className="select select-bordered join-item"
                    defaultValue={filter}
                  >
                    <option value="">
                      All
                    </option>
                    <option value="false">Pending</option>
                    <option value="true">Completed</option>
                  </select>
                  <div className="indicator">
                    <button className="btn join-item btn-neutral">Filter</button>
                  </div>
                </div>
              )}
              <table className="table   border-t   border-gray-700">
                <thead className="text-center   w-full  bg-[#191919] table-head">
                  <tr className="lg:text-lg   text-white ">
                    <th className="min-w-[50px] ">
                      <div className="flex items-center justify-center gap-3">
                        <IconTemplate
                          icon="tabler:number"
                          className="w-5  h-5"
                        />
                        Sample No.
                      </div>
                    </th>
                    <th className="min-w-[140px]">
                      <div className="flex items-center justify-center gap-3">
                        <IconTemplate
                          icon={`${forTest
                            ? "material-symbols:lab-research-outline-sharp"
                            : "mdi:location"
                            }`}
                          className="w-5  h-5"
                        />
                        {forTest ? "Station Name" : "Location"}
                      </div>
                    </th>
                    <th className="min-w-[140px]">
                      <div className="flex items-center justify-center gap-3">
                        <IconTemplate
                          icon={`${forTest
                            ? "ant-design:number-outlined"
                            : "iconoir:depth"
                            }`}
                          className="w-5  h-5"
                        />
                        {forTest ? "Sample No" : "Depth"}
                      </div>
                    </th>
                    <th className="min-w-[140px]">
                      <div className="flex  items-center justify-center gap-3">
                        <IconTemplate
                          icon="lets-icons:status"
                          className="w-5  h-5"
                        />
                        Status
                      </div>
                    </th>
                    <th className="min-w-[140px]">
                      <div className="flex items-center justify-center gap-3">
                        <IconTemplate
                          icon="mdi:interaction-tap"
                          className="w-5  h-5"
                        />
                        Action
                      </div>
                    </th>
                  </tr>
                </thead>
                <tbody className="text-center  table-body">
                  {samples?.map((data, i) => (
                    <TableRow key={data.id} index={i + 1} data={data} />
                  ))}
                </tbody>
              </table>
            </>
          )}
        </div>
      )}
      <div className=" flex-col flex-grow" style={{ boxSizing: "border-box" }}>
        <ReactPaginate
          breakLabel="..."
          nextLabel=">"
          onPageChange={(e) => fetchSamples(e.selected + 1, filter)}
          pageRangeDisplayed={3}
          pageCount={(pagination?.total_items && pagination?.total_pages) || 0}
          previousLabel="<"
          renderOnZeroPageCount={null}
          containerClassName="flex gap-3 justify-center items-center"
          pageClassName="rounded-lg hover:bg-blue-500"
          pageLinkClassName="flex items-center justify-center w-full h-full border p-2 rounded-lg"
          previousClassName="rounded-lg border hover:bg-blue-500  mr-5"
          previousLinkClassName="flex items-center justify-center w-full h-full  p-2 px-3 rounded-lg  transition-transform transform hover:-translate-x-1 "
          nextClassName="rounded-lg border hover:bg-blue-500  ml-5 "
          nextLinkClassName="flex items-center justify-center w-full h-full  p-2 px-3 rounded-lg  transition-transform transform hover:translate-x-1 "
          disabledClassName="bg-gray-900 text-gray-500"
          activeClassName="bg-blue-500"
        />
      </div>
    </div>
  );
};
export default Table;
