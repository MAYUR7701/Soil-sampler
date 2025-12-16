import React, { useEffect, useState } from "react";
import { notifyError } from "../../../utils/notify";
import { useDispatch, useSelector } from "react-redux";
import {
  addNewSample,
  updateSample, // Add an edit action
} from "../../../reducers/sampleSlice";
const SampleModal = ({ isEdit, currentSelectedSample, handleCloseModal }) => {
  const { loading } = useSelector((state) => state.sample);
  const [sampleForm, setSampleForm] = useState({
    location: "",
    top_depth: "",
    project_no: "",
    sample_no: "",
    dispatch: false,
  });
  const [validations, setValidations] = useState({
    location: true,
    top_depth: true,
    sample_no: true,
    project_no: true,
  });
  const dispatch = useDispatch();
  // Populate the form if in edit mode
  useEffect(() => {
    if (isEdit && currentSelectedSample) {
      setSampleForm({
        sample_no: currentSelectedSample?.sample_no,
        project_no: currentSelectedSample?.project_no,
        location: currentSelectedSample?.location,
        top_depth: currentSelectedSample?.top_depth,
        dispatch: currentSelectedSample?.dispatch,
      });
    }
  }, [isEdit, currentSelectedSample]);
  // handle onchange value
  const handleOnChange = (e) => {
    const { name, value } = e.target;
    setSampleForm((prevForm) => ({ ...prevForm, [name]: value }));
    setValidations((prevValidations) => ({
      ...prevValidations,
      [name]: value.trim() !== "", // Trim the value to handle whitespace
    }));
  };
  // handle form submission
  const handleSubmit = (e) => {
    e.preventDefault();
    // Check if any field is empty
    const hasEmptyFields = Object.values(sampleForm).some(
      (value) => typeof value === "string" && value.trim() === ""
    );
    if (hasEmptyFields) {
      return notifyError("fill-error", "Please fill in all the details");
    }
    // Dispatch add or edit action based on isEdit flag
    if (isEdit) {
      // Edit existing sample
      dispatch(
        updateSample(
          sampleForm?.dispatch
            ? {
                sample_id: currentSelectedSample?.id,
                sample_no: sampleForm?.sample_no,
                location: sampleForm?.location,
                top_depth: sampleForm?.top_depth,
                is_archived: sampleForm?.dispatch
              }
            : {
                sample_id: currentSelectedSample?.id,
                location: sampleForm?.location,
                top_depth: sampleForm?.top_depth,
                sample_no: sampleForm?.sample_no
              }
        )
      );
    } else {
      // Add new sample
      dispatch(addNewSample(sampleForm));
    }
    handleCloseModal();
  };
  return (
    <dialog id="my_modal_2" className={`modal modal-open backdrop-blur px-4`}>
      <form
        onSubmit={handleSubmit}
        className="modal-box dark:bg-zinc-900  w-full lg:w-3/12 max-w-5xl"
      >
        <h1 className="text-xl ml-2">{isEdit ? "Edit" : "Add"} Sample</h1>
        <div className="flex flex-wrap mt-4 justify-center">
          {/* Project No. */}

        <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text dark:text-white">Project No</span>
            </div>
            <input
              type="text"
              placeholder="Enter project no"
              className="input input-bordered w-full max-w-xs"
              name="project_no"
              onChange={handleOnChange}
              value={sampleForm.project_no}
            />
            {!validations.project_no && (
              <span className="text-xs text-red-500">Project No. is required</span>
            )}
          </label>
          {/* Sample ID */}
          <label className="form-control w-full max-w-xs">
            <div className="label">
              <span className="label-text dark:text-white">Sample No</span>
            </div>
            <input
              type="text"
              placeholder="Enter sample no"
              className="input input-bordered w-full max-w-xs"
              name="sample_no"
              onChange={handleOnChange}
              value={sampleForm.sample_no}
            />
            {!validations.sample_no && (
              <span className="text-xs text-red-500">Location is required</span>
            )}
          </label>
          {/* Enter Location */}
          <label className="form-control mt-4 w-full max-w-xs">
            <div className="label">
              <span className="label-text dark:text-white">Enter Location</span>
            </div>
            <input
              type="text"
              placeholder="Enter location"
              className={`input input-bordered w-full max-w-xs ${
                !validations.location ? "input-error" : ""
              }`}
              name="location"
              value={sampleForm.location}
              onChange={handleOnChange}
            />
            {!validations.location && (
              <span className="text-xs text-red-500">Location is required</span>
            )}
          </label>
          {/* Enter Top Depth */}
          <label className="form-control mt-4 w-full max-w-xs">
            <div className="label">
              <span className="label-text dark:text-white">
                Enter Top Depth
              </span>
            </div>
            <input
              type="number"
              placeholder="Enter top depth"
              className={`input input-bordered w-full max-w-xs ${
                !validations.top_depth ? "input-error" : ""
              }`}
              name="top_depth"
              onWheel={(e) => e.target.blur()}
              value={sampleForm.top_depth}
              onChange={handleOnChange}
            />
            {!validations.top_depth && (
              <span className="text-xs text-red-500">
                Top Depth is required
              </span>
            )}
          </label>
          {/* want to dispatch now */}
          <label className="form-control mt-4 w-full max-w-xs flex flex-row items-center justify-start">
            <input
              type="checkbox"
              className={`checkbox mr-2 checkbox-primary`}
              name="dispatch"
              onChange={() =>
                setSampleForm((prevForm) => ({
                  ...prevForm,
                  dispatch: !prevForm.dispatch,
                }))
              }
              defaultChecked={currentSelectedSample?.is_archived}
              disabled={currentSelectedSample?.is_archived ? true : false}
            />
            <div className="label">
              <span className="label-text cursor-pointer">
                {isEdit ? "Mark as Complete" : "Ready for Dispatch"}
              </span>
            </div>
          </label>
        </div>
        {/* Submit Button */}
        <div className="flex justify-center gap-2">
          <button
            disabled={loading}
            className="btn border-none text-white text-lg mt-8 px-8 bg-[#525CEB] hover:bg-[#525CEB]/70"
            type="submit"
          >
            Submit
          </button>
          <button
            className="btn text-lg mt-8 px-8 hover:text-black dark:hover:text-white text-white dark:text-zinc-800  bg-zinc-800 dark:bg-white"
            onClick={() => handleCloseModal()}
            type="button"
          >
            Close
          </button>
        </div>
      </form>
    </dialog>
  );
};
export default SampleModal;
