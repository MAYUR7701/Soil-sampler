import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import {
  addNewSampleTest,
  editNewSampleTest,
} from "../../../reducers/sampleTestSlice";
import InputField from "./InputField";

const AddTestModal = ({
  closeModal,
  sample,
  sampleLocation,
  sampleTestDetails,
  isEditOrView,
}) => {
  const { loading } = useSelector((state) => state.sampleTest);
  const [remarks, setRemarks] = useState(
    sampleTestDetails ? sampleTestDetails?.remarks : ""
  );
  const [markAsComplete, setMarkAsComplete] = useState(false);
  const dispatch = useDispatch();

  const handleSubmit = (e) => {
    e.preventDefault();
    const sampleTestData = {
      sample_station_locator_id: sampleLocation?.id,
      remarks,
    };
    if (isEditOrView === "edit") {
      dispatch(
        editNewSampleTest({
          sample_test_id: sampleTestDetails?.id,
          remarks: remarks,
          is_completed: markAsComplete,
        })
      );
    } else {
      dispatch(addNewSampleTest(sampleTestData));
    }
    setRemarks("");
    closeModal();
  };
  return (
    <dialog id="test_modal" className="modal modal-open backdrop-blur px-4">
      <div className="modal-box  dark:bg-zinc-900 scrollbar-hide h-fit w-fit lg:w-3/12">
        {/* <TestFormFields
            sample={sample}
            remarks={remarks}
            setRemarks={setRemarks}
            station_name={sampleLocation?.station_name}
            sampleTestDetailsId={sampleTestDetails?.id}
          /> */}
        <h1 className="text-xl">
          {isEditOrView ? (isEditOrView === "edit" ? "Edit" : "View") : "Add"}{" "}
          Test
        </h1>

        <form method="dialog">
          <div className="flex py-4 flex-wrap justify-center">
            {sampleTestDetails?.id ? (
              <InputField
                value={sampleTestDetails?.id}
                label="Sample Test Id"
                disabled
                name="sample_test_id"
              />
            ) : (
              <>
                {" "}
                <InputField
                  value={sample?.id}
                  label="Soil ID"
                  disabled
                  name="sample_id"
                />
                <InputField
                  value={sampleLocation?.station_name}
                  label="Station Name"
                  disabled
                  name="station_name"
                />
              </>
            )}
            <InputField
              label="Remarks"
              placeholder={isEditOrView === "view" ? "" : "Type here"}
              onChangeFunction={setRemarks}
              name="remarks"
              disabled={isEditOrView === "view"}
              value={remarks}
            />
            {!sampleTestDetails?.is_completed && isEditOrView === "edit" && (
              <>
                <label className="form-control mt-4 w-full max-w-xs flex flex-row items-center justify-start">
                  <input
                    type="checkbox"
                    className={`checkbox mr-2 checkbox-primary`}
                    name="dispatch"
                    onChange={() => setMarkAsComplete(true)}
                  />
                  <div className="label">
                    <span className="label-text cursor-pointer">
                      Mark as Complete
                    </span>
                  </div>
                </label>
              </>
            )}
            <div className="flex justify-center gap-2">
              <button
                className="btn text-lg mt-8 px-8 hover:text-black dark:hover:text-white text-white dark:text-zinc-800 bg-zinc-800 dark:bg-white"
                onClick={closeModal}
              >
                Close
              </button>

              {!sampleTestDetails?.is_completed && (
                <>
                  {isEditOrView !== "view" && (
                    <button
                      type="submit"
                      onClick={handleSubmit}
                      className="btn border-none text-white text-lg mt-8 px-8 bg-[#525CEB] hover:bg-[#525CEB]/70"
                      disabled={loading}
                    >
                      {isEditOrView === "edit"
                        ? loading
                          ? "Updating..."
                          : "Update"
                        : loading
                        ? "Submiting..."
                        : "Submit"}
                    </button>
                  )}
                </>
              )}
            </div>
          </div>
        </form>
      </div>
    </dialog>
  );
};
export default AddTestModal;
