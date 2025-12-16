import React from "react";
const LastLocationDetails = ({ sample, sampleLocation, children }) => {
  return (
    <>
    
      <div>
        <div className="flex p-2 justify-center items-center ">
          <div className="flex  flex-wrap justify-center p-4 w-fit border-4 border-cyan-600 rounded-3xl gap-4 lg:gap-10 grid-cols-3 dark:text-white">
            <h1 className=" tracking-tighter  dark:text-zinc-200 text-gray-600 font-semibold  text-lg">
              Last Location : {sampleLocation?.station_name}{" "}
              {/* <button className="bg-blue-500 rounded-lg p-2">View More</button> */}
            </h1>
            <div className="border-r hidden lg:block border-zinc-400"></div>
            <h1 className="tracking-tighter dark:text-zinc-200 text-gray-600 font-semibold text-lg">
              Scanned by : {sampleLocation?.user_name}{" "}
            </h1>
            {children}
          </div>
        </div>
      </div>
      <div className="flex justify-center">
        {/* {JSON.stringify(sampleLocation)} */}
        <ul className="steps">
          <li
            data-content="✓"
            className={`step ${
              sample?.is_completed ? "step-accent" : "step-primary"
            }   w-32 lg:w-80 `}
          >
            Scanned
          </li>
          <li
            data-content={`${sampleLocation?.is_completed ? "✓" : "✕"}`}
            className={`step ${
              sample?.is_completed ? "step-accent" : "step-primary"
            }   w-32 lg:w-80`}
          >
            Testings
          </li>
          {sample?.is_completed ? (
            <li data-content="✓" className="step step-accent   w-32 lg:w-80 ">
              Completed
            </li>
          ) : (
            <li
              data-content={`${sampleLocation?.is_dispatched ? "✓" : "✕"}`}
              className="step step-primary   w-32 lg:w-80 "
            >
              Dispatched
            </li>
          )}
        </ul>
      </div>
    </>
  );
};
export default LastLocationDetails;
