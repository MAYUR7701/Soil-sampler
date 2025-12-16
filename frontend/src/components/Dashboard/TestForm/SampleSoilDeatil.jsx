import React from "react";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import InfoBlock from "../../DashboardContents/StationDetailHeader/InfoBlock";
const SampleSoilDetail = () => {
  return (
    <>
    <div className="max-w-5xl px-4  sm:px-6 lg:px-8  mx-auto">
      <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-3 sm:gap-6">
        <InfoBlock
          icon="tabler:id-badge"
          title="Sample ID"
          value="1234567890"
          
        />
        <InfoBlock
          icon="ic:round-location-on"
          title="Location"
            value="Pune"
         
        />
        <InfoBlock
          icon="iconoir:depth"
          title="Top Depth"
            value="10 Meters"

         
        />
      </div>
    </div>
    </>
  );
};

export default SampleSoilDetail;
