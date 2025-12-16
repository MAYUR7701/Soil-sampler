import React, { useState, useEffect } from 'react';

const ToggleButton = () => {
  const [isDay, setIsDay] = useState(true);

  const dayIcon = 'https://www.svgrepo.com/show/470899/sun.svg';
  const nightIcon = 'https://www.svgrepo.com/show/470515/moon.svg';

  const handleButtonClick = () => {
    setIsDay(!isDay);
  };

  useEffect(() => {
    // Toggle dark mode based on the isDay state
    document.documentElement.setAttribute('data-theme', isDay ? 'light' : 'dark');
  }, [isDay]);

  return (
    <div className='group'>
    <button
      className="bg-white  w-fit text-white px-3 py-2 border border-gray-200 rounded-full font-medium"
      aria-current="page"
      onClick={handleButtonClick}
    >
      <img
        src={isDay ? dayIcon : nightIcon}
        className="w-4 group-hover:rotate-90 transition duration-300 h-5"
        alt={isDay ? 'Day Icon' : 'Night Icon'}
      />
    </button>
    </div>
  );
};

export default ToggleButton;
