import React, { useEffect, useState } from "react";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import SearchResultItem from "./SearchResultItem";
import { useDispatch, useSelector } from "react-redux";
import {
  resetNotificationState,
  searchSample,
  searchSamples,
} from "../../../reducers/sampleSlice";
import { notifyError } from "../../../utils/notify";

const SearchPage = () => {
  const { loading, searchResult, error } = useSelector((state) => state.sample);
  const [show, setShow] = useState(false);
  const dispatch = useDispatch();
  const handleSearch = (e) => {
    const keyword = e.target.value;
    if (keyword.length < 1) {
      return setShow(false);
    }
    setShow(true);
    dispatch(searchSamples(keyword));
  };

  useEffect(() => {
    if (error) {
      notifyError("Error", error);
      dispatch(resetNotificationState());
    }
  }, [error]);

  return (
    <div>
      <section className="">
        <div className="items-center justify-center  p-2 md:p-12 lg:px-20 py-20 lg:py-36">
          <div className="max-w-xl mx-auto  transition-all transform   rounded-xl  ">
            <div className="relative">
              <IconTemplate
                icon="ic:baseline-search"
                className="pointer-events-none text-zinc-800 dark:text-white absolute top-3.5 left-4 h-6 w-6 md "
              />
              <input
                type="text"
                className="input input-bordered  w-full h-12 pr-4 placeholder-gray-700 dark:placeholder-gray-200 text-[#0c0c0c] dark:text-white  pl-11 sm:text-sm"
                placeholder="Enter sample id, sample number or location"
                role="combobox"
                aria-expanded="false"
                aria-controls="options"
                onChange={handleSearch}
              />
            </div>
            {show && (
              <ul
                className="p-3 space-y-3 overflow-y-auto max-h-96 scroll-py-3"
                id="options"
                role="listbox"
              >
                {loading ? (
                  <div className="flex justify-center items-center">
                    <IconTemplate
                      icon="fa6-solid:spinner"
                      className="animate-spin h-6 w-6"
                    />
                  </div>
                ) : searchResult?.length > 0 ? (
                  searchResult.map((sample, i) => (
                    <SearchResultItem
                      icon="grid-outline"
                      
                      label={`${sample.location} : ${sample.sample_no}`}
                      key={i}
                      id={sample.id}
                    />
                  ))
                ) : (
                  <p className="text-center text-gray-300 darK:text-white">No result found</p>
                )}
              </ul>
            )}
          </div>
        </div>
            {/* <div className="flex flex-wrap items-center bg-black py-2.5 px-4 text-xs text-gray-300">
              <p>content will be here</p>
            </div> */}
      </section>
    </div>
  );
};

export default SearchPage;
