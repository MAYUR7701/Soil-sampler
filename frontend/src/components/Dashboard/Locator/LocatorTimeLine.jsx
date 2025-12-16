import React, { useEffect } from "react";
import LocatorItem from "./LocatorDetailed/LocatorItem";
import { useDispatch, useSelector } from "react-redux";
import { fetchSampleLocationDetails } from "../../../reducers/sampleLocatorSlice";
import Loader from "../../Loader/Loader";

const LocatorTimeLine = ({ sample }) => {
  const { loading, sampleLocations } = useSelector(
    (state) => state.sampleLocator
  );
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(fetchSampleLocationDetails({ sampleId: sample?.id, filter: "all" }));
  }, []);
  return (
    <div>
      {loading ? (
        
        <Loader />
      ) : (
        <div className=" ">
          <h2 className="lg:text-left text-center  md:ml-7 text-2xl font-semibold mt-8 dark:text-slate-300   text-gray-600 tracking-tighter  mb-10">
            Last locations of sample
          </h2>
          <div className="flex  justify-center">

         
        <ul className=" border-gray-200  lg:w-full  dark:border-gray-700 steps steps-vertical p-6  lg:px-10" >
            {sampleLocations.map((item, index) => (
              <LocatorItem key={index} item={item} />
            ))}
          </ul>
          </div>
        </div>
      )}
    </div>
  );
};

export default LocatorTimeLine;
