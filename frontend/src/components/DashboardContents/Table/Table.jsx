// SoilTable.js
import React, { useEffect, useState } from "react";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import TableRow from "./TableRow";
import { useSelector } from "react-redux";
import Loader from "../../Loader/Loader";
import ReactPaginate from "react-paginate";
const Table = ({ fetchSamples, forTest }) => {
  const [pagination, setPagination] = useState({});
  const [result, setResult] = useState([]);
  const {
    loading: sampleLoading,
    samples,
    pagination: samplePagination,
  } = useSelector((state) => state.sample);
  const {
    loading: sampleTestLoading,
    samples: sampleTests,
    pagination: sampleTestPagination,
  } = useSelector((state) => state.sampleTest);
  const [filter, setFilter] = useState("");
  useEffect(() => {
    if (fetchSamples) fetchSamples(1, filter);
  }, [filter]);
  useEffect(() => {
    setPagination(forTest ? sampleTestPagination : samplePagination);
    setResult(forTest ? sampleTests : samples);
  }, [samples, sampleTests]);
const tableHeadings=[{icon:'tabler:number',label:"Sample No."},{icon:'mdi:location',label:"Location"},{icon:'iconoir:depth',label:"Depth"},{icon:'lets-icons:status',label:"Status"},{icon:'mdi:interaction-tap',label:"Action"}]
  return (
    <div>
      {sampleLoading || sampleTestLoading ? (
        <Loader />
      ) : (
        <div
          className=" overflow-x-auto flex-grow-0"
          style={{ height: "100%" }}
        >
          {!samples?.length && filter===""   ? (
            <div className="m-3">Sample records not found</div>
          ) : (
            <>
              <div className="join   flex  justify-start lg:justify-end items-center my-2 px-4">
                <select
                  onChange={(e) => setFilter(e.target.value)}
                  className="select dark:bg-zinc-800 select-bordered join-item"
                  defaultValue={filter}
                >
                  <option value="">All</option>
                  <option value="false">Pending</option>
                  <option value="true">Completed</option>
                </select>
                <div className="indicator">
                  <button className="btn dark:bg-zinc-800 join-item btn-neutral">Filter</button>
                </div>
              </div>

              <Table className="table   border-t   border-gray-700">
       
                <tbody className="text-center    table-body">
                  {result?.length > 0 ? (
                    result?.map((data, i) => (
                      <TableRow
                        key={data.id}
                        index={i + 1}
                        data={data}
                        forTest={forTest || false}
                      />
                    ))
                  ) : (
                    <tr>
                      <td colSpan={5} className="text-center">
                        No records found
                      </td>
                    </tr>
                  )}
                </tbody>
              </Table>
            </>
          )}
        </div>
      )}
      <div className=" flex-col flex-grow" >
        {/* <Pagination data={{ pagination: { current_page: 0, total_pages: 5 } }} fetchSamples={fetchSamples} setPage={setPage} /> */}
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
          pageLinkClassName="flex items-center justify-center w-full h-full border py-1 px-4 rounded-lg"
          previousClassName="rounded-xl border border-zinc-700 hover:text-white hover:bg-blue-500  mr-5"
          previousLinkClassName="flex items-center justify-center w-full h-full  p-2 px-3 rounded-lg  transition-transform transform hover:-translate-x-1 "
          nextClassName="rounded-xl border border-zinc-700 hover:bg-blue-500  ml-5 "
          nextLinkClassName="flex items-center justify-center w-full h-full  p-2 px-3 rounded-lg  transition-transform transform hover:translate-x-1 "
          disabledClassName="bg-gray-900 text-gray-500"
          activeClassName="bg-blue-500"
        />
        {/* <PaginatedItems  itemsPerPage={4} /> */}
      </div>
    </div>
  );
};

export default Table;
