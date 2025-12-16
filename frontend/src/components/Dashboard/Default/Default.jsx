import React, { useState } from "react";
import StationDetails from "../../DashboardContents/StationDetailHeader/StationDetails";
import { useSelector } from "react-redux";
import DefaultTable from "./DefaultTable";
import Button from "../../../utils/Button";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import SampleModal from "./SampleModal";
const DefaultPage = () => {
  const { user } = useSelector((state) => state.auth);
  const [isEdit, setIsEdit] = useState(false);
  const [showSampleModal, setShowSampleModal] = useState(false);
  const [currentSelectedSample, setCurrentSelectedSample] = useState(null)
  const handleCloseModal = () => {
    setShowSampleModal(false);
    setIsEdit(false);
  }
  const handleCurrentSelectedSample = (selectedSample) => {
    setCurrentSelectedSample(selectedSample);
    if (currentSelectedSample) {
      setIsEdit(true);
      setShowSampleModal(true);
    }
  }
  return (
    <div>
      <StationDetails user={user}>
        <div className="flex justify-center items-center">
          {user?.station_master?.station?.is_storage_center && <Button
            icon={<IconTemplate icon="zondicons:add-solid" />}
            label={isEdit ? "Edit Sample" : "Add Sample"}
            handleClick={() => setShowSampleModal(true)}
          />}
        </div>
      </StationDetails>
      {showSampleModal && user?.station_master?.station?.is_storage_center && <SampleModal isEdit={isEdit} currentSelectedSample={currentSelectedSample} handleCloseModal={handleCloseModal} />}
      <DefaultTable handleCurrentSelectedSample={handleCurrentSelectedSample} />
    </div>
  );
};
export default DefaultPage;
