import React, { useEffect, useState } from "react";
import IconTemplate from "../../../utils/Icons/IconTemplate";
import { useDispatch, useSelector } from "react-redux";
import { getStation } from "../../../reducers/stationSlice";
import Loader from "../../Loader/Loader";
import { resetFilters, updateFilterForm } from "../../../reducers/filterSlice";

const FilterModal = ({ handleCloseModal }) => {
  const { loading, stations } = useSelector((state) => state.station);
  const { filters } = useSelector((state) => state.filter);
  const dispatch = useDispatch(); 
  const [filterForm, setFilterForm] = useState(filters);

  const handleOnChange = (e) => {
    const { name, value } = e.target;

    setFilterForm((prevForm) => ({ ...prevForm, [name]: value }));
  };

  const handleStationSelection = (name, value) => {
    if (
      value &&
      name === "selectedStations" &&
      !filterForm.selectedStations.includes(value)
    ) {
      setFilterForm((prevForm) => ({
        ...prevForm,
        selectedStations: [...prevForm.selectedStations, value],
      }));
    } else if (
      value &&
      name === "lastLocations" &&
      !filterForm.lastLocations.includes(value)
    ) {
      setFilterForm((prevForm) => ({
        ...prevForm,
        lastLocations: [...prevForm.lastLocations, value],
      }));
    }
  };

  const handleUnselectStation = (name, stationToRemove) => {
    if (name === "selectedStations")
      setFilterForm((prevForm) => ({
        ...prevForm,
        selectedStations: prevForm.selectedStations.filter(
          (station) => station !== stationToRemove
        ),
      }));
    else if (name === "lastLocations")
      setFilterForm((prevForm) => ({
        ...prevForm,
        lastLocations: prevForm.lastLocations.filter(
          (station) => station !== stationToRemove
        ),
      }));
  };

  const handleFilter = () => {
    // Dispatch action to update filter form in Redux state
    dispatch(updateFilterForm(filterForm));
    handleCloseModal();
    console.log("handle filter");
  };
  const handleResetFilter = () => {
    // Dispatch action to update filter form in Redux state
    dispatch(resetFilters());
    setFilterForm(filters);
  };

  useEffect(() => {
    dispatch(getStation());
  }, [dispatch]);

  return (
    <dialog
      id="filter_modal"
      className={`modal modal-open backdrop-blur px-4 transition-all`}
    >
      <div className="modal-box dark:bg-zinc-900  w-full lg:w-3/12 max-w-5xl">
        <h1 className="text-xl ml-2">Filter Options</h1>
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
              value={filterForm.project_no}
            />
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
              value={filterForm.sample_no}
            />
          </label>
          {/* Enter Location */}
          <label className="form-control mt-4 w-full max-w-xs">
            <div className="label">
              <span className="label-text dark:text-white">Enter Location</span>
            </div>
            <input
              type="text"
              placeholder="Enter location"
              className={`input input-bordered w-full max-w-xs`}
              name="location"
              value={filterForm.location}
              onChange={handleOnChange}
            />
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
              className={`input input-bordered w-full max-w-xs`}
              name="top_depth"
              onWheel={(e) => e.target.blur()}
              value={filterForm.top_depth}
              onChange={handleOnChange}
            />
          </label>
          {/* Sample Status */}
          <fieldset className="form-control mt-4 w-full max-w-xs">
            <legend className="label">
              <span className="label-text dark:text-white">Sample Status</span>
            </legend>
            <div className="flex items-center">
              <input
                type="radio"
                id="isArchivedTrue"
                name="is_archived"
                value={true}
                onChange={(e) => handleOnChange(e)}
                className="mr-1 text-[#525CEB]"
                defaultChecked={filterForm?.is_archived === "true"}
              />
              <label htmlFor="isArchivedTrue" className="ml-2 dark:text-white">
                Archived
              </label>

              <input
                type="radio"
                id="isArchivedFalse"
                name="is_archived"
                value={false}
                onChange={(e) => handleOnChange(e)}
                className="ml-4 mr-1 text-[#525CEB]"
                defaultChecked={filterForm?.is_archived === "false"}
              />
              <label htmlFor="isArchivedFalse" className="ml-2 dark:text-white">
                In transit
              </label>

              <input
                type="radio"
                id="isArchivedBoth"
                name="is_archived"
                value={""}
                onChange={(e) => handleOnChange(e)}
                className="ml-4 mr-1 text-[#525CEB]"
                defaultChecked={!filterForm?.is_archived}
              />
              <label htmlFor="isArchivedBoth" className="ml-2 dark:text-white">
                Both
              </label>
            </div>
          </fieldset>

          {loading ? (
            <Loader />
          ) : (
            <>
              {/* Select Stations */}
              <label className="form-control mt-4 w-full max-w-xs">
                <div className="label">
                  <span className="label-text dark:text-white">
                    Select Stations
                  </span>
                </div>
                <select
                  className="select select-bordered w-full max-w-xs"
                  name="selectedStations"
                  onChange={(e) =>
                    handleStationSelection(e.target.name, e.target.value)
                  }
                >
                  <option value="">Select a station</option>
                  {stations?.map((station, i) => (
                    <option key={i} value={station?.id}>
                      {station?.name}
                    </option>
                  ))}
                </select>
              </label>

              {/* Display Selected Stations */}
              {filterForm?.selectedStations?.length > 0 && (
                <div className="mt-2">
                  <p className="text-sm font-medium dark:text-white">
                    Selected Stations:
                  </p>
                  <div className="flex items-center">
                    {filterForm.selectedStations.map((stationId, i) => (
                      <div
                        key={i}
                        className="bg-cyan-100 text-cyan-600 me-2 px-2 py-1 rounded-lg dark:bg-gray-600 dark:text-gray-300"
                      >
                        {
                          stations.find((station) => station.id === stationId)
                            ?.name
                        }
                        <button
                          className="ml-2 text-sm font-medium text-red-600"
                          onClick={() =>
                            handleUnselectStation("selectedStations", stationId)
                          }
                        >
                          X
                        </button>
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* Select Last Locations */}
              <label className="form-control mt-4 w-full max-w-xs">
                <div className="label">
                  <span className="label-text dark:text-white">
                    Select Last Locations
                  </span>
                </div>
                <select
                  className="select select-bordered w-full max-w-xs"
                  name="lastLocations"
                  onChange={(e) =>
                    handleStationSelection(e.target.name, e.target.value)
                  }
                >
                  <option value="">Select a station</option>
                  {stations?.map((station, i) => (
                    <option key={i} value={station?.id}>
                      {station?.name}
                    </option>
                  ))}
                </select>
              </label>

              {/* Display Selected Last Stations */}
              {filterForm?.lastLocations?.length > 0 && (
                <div className="mt-2">
                  <p className="text-sm font-medium dark:text-white">
                    Selected Last Stations:
                  </p>
                  <div className="flex items-center">
                    {filterForm.lastLocations.map((stationId, i) => (
                      <div
                        key={i}
                        className="bg-cyan-100 text-cyan-600 me-2 px-2 py-1 rounded-lg dark:bg-gray-600 dark:text-gray-300"
                      >
                        {
                          stations.find((station) => station.id === stationId)
                            ?.name
                        }
                        <button
                          className="ml-2 text-sm font-medium text-red-600"
                          onClick={() =>
                            handleUnselectStation("lastLocations", stationId)
                          }
                        >
                          X
                        </button>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </>
          )}
        </div>
        <div className="flex justify-center gap-2">
          <button
            className="btn border-none text-white text-lg mt-8 px-8 bg-[#525CEB] hover:bg-[#525CEB]/70"
            type="button"
            onClick={handleFilter}
          >
            Apply
          </button>
          <button
            className="btn border-none text-white text-lg mt-8 px-8 bg-[#ce0f09cc] hover:bg-[#525CEB]/70"
            type="button"
            onClick={handleResetFilter}
          >
            Reset
          </button>
          <button
            className="btn text-lg mt-8 px-8 hover:text-black dark:hover:text-white text-white dark:text-zinc-800  bg-zinc-800 dark:bg-white"
            onClick={handleCloseModal}
            type="button"
          >
            Close
          </button>
        </div>
      </div>
    </dialog>
  );
};

export default FilterModal;
