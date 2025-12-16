import React, { useState, useEffect } from 'react';
import IconTemplate from '../../utils/Icons/IconTemplate';
import { capitalizeFirstLetter } from '../../utils/CapitalizeFirstLetter';
const DashboardNavbar = ({ toggleSidebar,slug }) => {
  const [isButtonVisible, setIsButtonVisible] = useState(true);

  const handleSidebarToggle = () => {
    toggleSidebar();
  };

  useEffect(() => {
    // Toggle button visibility after sidebar toggle
    setIsButtonVisible((prev) => !prev);
  }, [toggleSidebar]);

  return (
    <div className={`sticky top-0 h-16 border-b bg-white dark:bg-black dark:border-gray-800 lg:py-2.5 z-10 ${isButtonVisible ? 'pb-0' : 'pb-16'}`}>
      <div className="flex items-center justify-between px-4 2xl:container">
        <h5 className={`text-2xl font-medium text-gray-600 block dark:text-white ${isButtonVisible ? '' : 'mt-4 lg:mt-0'}`}>{capitalizeFirstLetter(slug || 'dashboard')}</h5>
        {/* Conditionally render the button based on visibility */}
        
          <button onClick={handleSidebarToggle} className="h-16 w-12 block lg:hidden dark:text-gray-300">
            <IconTemplate icon={`${isButtonVisible?"material-symbols:close" :"ci:hamburger-md" }`} className="w-8 h-8" />
          </button>
      
      </div>
    </div>
  );
};

export default DashboardNavbar;
