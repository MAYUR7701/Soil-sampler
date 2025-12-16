import IconTemplate from "../../../utils/Icons/IconTemplate";

const AddTestButton = ({ showModal }) => (
  <div className="flex">

    <button
      className="btn hover:text-gray-800 flex flex-row items-center bg-indigo-600 border border-zinc-700  dark:hover:text-white px-8 font-semibold text-white transition"
      onClick={showModal}
    >
      <IconTemplate
        icon="zondicons:add-solid"
        className="group-hover:translate-x-3 transition duration-300 w-5  text-WHITE h-5"
      />
      Add Test
    </button>
  </div>

);

export default AddTestButton;
