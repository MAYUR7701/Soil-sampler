// LocatorItem.js
import React, { useState } from "react";
import { Link } from "react-router-dom";

const LocatorItem = ({ item }) => {
  const [isTooltipVisible, setTooltipVisible] = useState(false);
  const handleToggleTooltip = () => {
    setTooltipVisible(!isTooltipVisible);
  };

  return (
    <li className={`ms-6 step ${item?.is_dispatched ? 'step-success' : item?.is_completed ? "step-info" : "step-error"} `} data-content={`${item?.is_dispatched ? "✓" : item?.is_completed ? "✓" : "✕"}`} style={{ width: "100%" }} onClick={handleToggleTooltip}>
      {isTooltipVisible && (
        <div
          id="tooltip2"
          role="tooltip"
          className="w-64 absolute  transition duration-150 ease-in-out shadow-lg bg-white p-4 rounded-xl z-50"
        >
          <p className="font-bold b-1 text-gray-800 ">Location Status</p>
          <div className="text-gray-800">
            <div>
              Tests <span className="">{item?.is_completed ? "✓" : "✕"}</span>

            </div>
            <div>
              Dispatched <span className="">{item?.is_dispatched ? "✓" : "✕"}</span>
            </div>
          </div>
        </div>
      )}

      <div className="items-center my-5 justify-between p-4 bg-white px-10 border border-gray-200 rounded-2xl shadow-sm sm:flex dark:bg-zinc-800 dark:border-gray-700 w-full">
        <time className="dark:text-white  text-gray-500 sm:order-last sm:mb-0 font-semibold">{item?.station_name}</time>
        <div className=" text-gray-500 dark:text-gray-300">

          <span className="bg-cyan-100 text-cyan-600  me-2 px-3 py-1 rounded-lg dark:bg-gray-600 dark:text-gray-300"> {item?.user_name}</span>

          {/* <h1 className="border mt-2 text-gray-700 text-xs italic fomt-regular me-2 px-2.5 py-0.5 rounded dark:bg-gray-600 dark:text-gray-300">sent to Station Name</h1> */}
        </div>
        <div className="order-last">
          <time className="mb-1 mx-2 text-xs font-normal text-gray-400  sm:mb-0">
            {new Date(item?.created_at).toLocaleString()}
          </time>
          <Link className="btn btn-outline ml-3" to={`/dashboard/tests/${item?.id}`}>
            View tests
          </Link>
        </div>
      </div>
    </li>
  );
};

export default LocatorItem;
