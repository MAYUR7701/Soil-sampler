import IconTemplate from "../../../utils/Icons/IconTemplate";
const InfoBlock = ({ icon, title, value }) => {
  return (
    <div className="group flex flex-col  bg-white  border shadow-sm rounded-xl hover:shadow-md transition dark:bg-black dark:border-zinc-900 dark:focus:outline-none dark:focus:ring-1 dark:focus:ring-gray-600">
      <div className="p-4 md:p-5">
        <div className="flex">
          <IconTemplate icon={icon} className="group-hover:translate-x-3 transition duration-300 w-5 mt-1 text-[#5FBDFF] h-5" />
          <div className="grow ms-5">
            <h3 className="group-hover:text-[#5FBDFF]  text-xs font-semibold text-gray-400 dark:group-hover:text-gray-400 dark:text-gray-300">
              {title}
            </h3>
            <p className="group-hover:text-[#5FBDFF]  text-md tracking-tight lg:text-[20px] dark:text-gray-100 font-semibold text-gray-700">{value}</p>
          </div>
        </div>
      </div>
    </div>
  );
};
export default InfoBlock;
