import React from "react";
import InfoBlock from "../../DashboardContents/StationDetailHeader/InfoBlock";
const SoilDetailsLabel = ({ sample }) => {
  return (
    <>
      <div className="max-w-7xl px-4 py-3 sm:px-6 lg:px-8  mx-auto">
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-3 sm:gap-6">
          <InfoBlock
            icon="tabler:id-badge"
            title="Sample No"
            value={sample?.sample_no}
          />
          <InfoBlock
            icon="ic:round-location-on"
            title="Location"
            value={sample?.location}
          />
          <InfoBlock
            icon="iconoir:depth"
            title="Top Depth"
            value={sample?.top_depth}
          />
        </div>
      </div>
    </>
  );
};

export default SoilDetailsLabel;
