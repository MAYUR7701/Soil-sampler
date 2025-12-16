import AddTestButton from "./AddTestButton";
import AddTestModal from "./AddTestModal";
import LocatorSteps from "../Locator/LocatorSteps";
import ScanSoilDetail from "../Scan/ScanSoilDetail";
import { useDispatch, useSelector } from "react-redux";
import { getAllSampleTests } from "../../../reducers/sampleTestSlice";
import LocatorItem from "../Locator/LocatorDetailed/LocatorItem";
import { itemsData } from "../Locator/LocatorDetailed/Locatordata";
const TestForm = ({ sample, sampleLocation }) => {
  const { user } = useSelector((state) => state.auth);

  const showModal = () => document.getElementById("my_modal_2").showModal();
  const closeModal = () => document.getElementById("my_modal_2").close();
  const dispatch = useDispatch();

  const fetchAllSampleTests = () => {
    if (sample?.id) {
      dispatch(getAllSampleTests(sampleLocation?.id));
    }
  };

  return (
    <div>
      <section>
        <div className="dark:border-b border-zinc-700 mb-8 flex flex-col lg:flex-row lg:pr-7  h-auto w-full justify-center items-center gap-1  bg-[#f2f2f7] dark:bg-black p py-12 md:mb-12">
          <div >
            <ScanSoilDetail sample={sample} />
          </div>
          {!sample?.is_completed &&
            user?.station_master?.station?.id === sampleLocation?.station_id &&
            !sampleLocation?.is_completed && (
              <div className="flex justify-center items-center pt-5 lg:pt-0 lg:mr-7">
                <div>
                  <AddTestButton showModal={showModal} />
                  <AddTestModal
                    showModal={showModal}
                    closeModal={closeModal}
                    sample={sample}
                    sampleLocation={sampleLocation}
                  />
                </div>
              </div>
            )}
        </div>
        <div className="flex justify-center">
          {/* <LocatorSteps /> */}
        </div>
      </section>

    </div>
  );
};

export default TestForm;
