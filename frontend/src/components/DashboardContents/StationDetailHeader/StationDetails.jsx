import InfoBlock from "./InfoBlock";
const StationDetails = ({ user, children }) => {
  return (
    <div className="border-b border-zinc-900">
      <div className="max-w-5xl   px-4 py-10 sm:px-6 lg:px-8 lg:py-6 mx-auto">
        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-3 sm:gap-6">
          <InfoBlock
            icon="tabler:location-filled"
            title="Station Name"
            value={user?.station_master?.station?.name || "-"}
          />
          <InfoBlock
            icon="solar:user-bold-duotone"
            title={
              user?.is_staff
                ? "Admin Name"
                : user?.station_master
                ? "Station Master"
                : "User Name"
            }
            value={user?.name}
          />
          {children}
        </div>
      </div>
    </div>
  );
};
export default StationDetails;
