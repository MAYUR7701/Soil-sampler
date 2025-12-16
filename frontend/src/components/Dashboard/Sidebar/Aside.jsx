import React, { useState, useEffect } from "react";
import menus from "./AsideMenus";
import { Link } from "react-router-dom";
import { useSelector } from "react-redux";

const Sidebar = ({
  isSidebarOpen,
  toggleSidebar,
  setActiveMenu,
  activeMenu,
}) => {
  const { user } = useSelector((state) => state.auth);

  const handleMenuClick = (menuId) => {
    setActiveMenu(menuId);
    toggleSidebar();
  };
  const [isLargeScreen, setIsLargeScreen] = useState(window.innerWidth >= 1024);

  useEffect(() => {
    const handleResize = () => {
      setIsLargeScreen(window.innerWidth >= 1024);
    };

    window.addEventListener("resize", handleResize);

    // Initial check for large screen
    setIsLargeScreen(window.innerWidth >= 1024);

    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []);

  return (
    <>
      <div
        className={`lg:hidden fixed top-0 left-0 w-full h-full bg-gray-800 bg-opacity-50 ${
          isSidebarOpen ? "" : "hidden"
        }`}
        onClick={toggleSidebar}
      ></div>
      <aside
        className={`fixed top-0 left-0 z-20 h-screen w-[70%] flex flex-col justify-between border-r bg-white px-6 pb-3 transition duration-300 md:w-4/12 lg:ml-0 lg:w-[25%] xl:w-[20%] 2xl:w-[15%] dark:bg-black dark:border-zinc-800 ${
          isSidebarOpen ||
          (isLargeScreen && "translate-x-0") ||
          "-translate-x-full"
        }`}
      >
        <div>
          <div className="flex justify-center text-2xl py-4">
            <Link href="/" alt="Home">
              <div className="text-center flex justify-center items-center">
            
                        </div>
                        <img
                        src="/assets/logo.png"
                        className="w-28"
                        alt="Soil Sampler Logo"
                        />
                        <h1 className="text-green-500 text-xl">Soil Sampler</h1>
                      </Link>
                      </div>

                      <div className="mt-8 text-center">
                      <img
                        src="https://images.unsplash.com/photo-1654198340681-a2e0fc449f1b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        alt=""
                        className="m-auto h-16 w-16 rounded-full object-cover lg:h-18 lg:w-18 dark:border-white dark:border"
                      />
                      <h5 className="mt-4  text-xl font-semibold text-gray-600  dark:text-gray-300">
                        {user?.name}
                      </h5>
                      <div className="flex flex-col">
                        {user?.station_master && (
                        <span className=" text-gray-400 mb-2">Station Master</span>
                        )}
                        <div className="flex justify-center items-center mb-2">
                        {user?.station_master?.station?.is_storage_center && (
                          <span className=" border px-12 py-2 text-teal-900-600 dark:border-zinc-700 font-semibold tracking-tighter rounded-3xl">
                          Storage Center
                          </span>
                        )}
                        </div>
                        {user?.is_staff && (
                        <div className="flex justify-center items-center">
                          <a href={"/admin/"} className="mt-2 underline-none">
                    <span className="border px-12 py-2 text-cyan-600 dark:border-zinc-700 font-semibold tracking-tighter rounded-3xl">
                      Admin
                    </span>
                  </a>
                </div>
              )}
            </div>
          </div>
          <ul className="mt-8 space-y-2 tracking-wide">
            {menus.map((menu) => {
              if (menu?.id == "upload") {
                if (user?.station_master?.station?.is_storage_center)
                  return (
                    <li key={menu.id}>
                      {/* Use Link component for navigation */}
                      <Link
                        to={menu.route} // Specify the route for each menu item
                        className={`relative  flex items-center space-x-4 rounded-xl px-4 py-3 text-gray-600 ${
                          activeMenu === menu.id
                            ? "bg-zinc-800 dark:bg-zinc-200 text-white dark:text-gray-800"
                            : "bg-white dark:bg-zinc-800 dark:text-white hover:bg-gray-100 hover:text-gray-800"
                        }`}
                        onClick={() => handleMenuClick(menu.id)}
                      >
                        <span className="-ml-1">{menu.icon}</span>
                        <span className="-mr-1 font-medium">{menu.label}</span>
                      </Link>
                    </li>
                  );
                else return "";
              } else {
                return (
                  <li key={menu.id}>
                    {/* Use Link component for navigation */}
                    <Link
                      to={menu.route} // Specify the route for each menu item
                      className={`relative  flex items-center space-x-4 rounded-xl px-4 py-3 text-gray-600 ${
                        activeMenu === menu.id
                          ? "bg-zinc-800 dark:bg-zinc-200 text-white dark:text-gray-800"
                          : "bg-white dark:bg-zinc-800 dark:text-white hover:bg-gray-100 hover:text-gray-800"
                      }`}
                      onClick={() => handleMenuClick(menu.id)}
                    >
                      <span className="-ml-1">{menu.icon}</span>
                      <span className="-mr-1 font-medium">{menu.label}</span>
                    </Link>
                  </li>
                );
              }
            })}
          </ul>
        </div>

        <div className="-mx-6 flex items-center justify-between border-t px-6 pt-4 dark:border-gray-700">
          <button
            className="group flex items-center space-x-4 rounded-md px-4 py-3 text-gray-600 dark:text-gray-300"
            onClick={toggleSidebar}
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"
              />
            </svg>
            <Link
              to={"/logout"}
              className="group-hover:text-gray-700 dark:group-hover:text-white"
            >
              Logout
            </Link>
          </button>
        </div>
      </aside>
    </>
  );
};

export default Sidebar;
