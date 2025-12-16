import React, { useState } from 'react';
import IconTemplate from '../../../utils/Icons/IconTemplate';
import { Link } from 'react-router-dom';
const LocatorSteps = () => {
  const [activeStep, setActiveStep] = useState(null);
  const [tooltipPosition, setTooltipPosition] = useState({ top: 0, left: 0 });
  const [isTooltipOpen, setIsTooltipOpen] = useState(false);

  const handleClick = (index, event) => {
    const rect = event.target.getBoundingClientRect();
    const tooltipTop = rect.bottom + window.scrollY + 10;
    const tooltipLeft = rect.left + window.scrollX + rect.width / 2;

    setActiveStep(activeStep === index ? null : index);
    setTooltipPosition({ top: tooltipTop, left: tooltipLeft });
    setIsTooltipOpen(activeStep !== index);
  };

  const handleCloseTooltip = () => {
    setIsTooltipOpen(false);
  };

  const handleContentClick = (event) => {
    // Prevent the click on the content from closing the tooltip
    event.stopPropagation();
  };

  return (
    <div>
      <ul className="steps  ">
        <li className="step step-primary  w-32 lg:w-80 " onClick={(e) => handleClick(0, e)}>
          Completed
        </li>
        <li className="step cursor-pointer  w-32 lg:w-80 step-primary" onClick={(e) => handleClick(2, e)}>
          Testings
        </li>
        <li className="step step-accent" data-content="3" onClick={(e) => handleClick(0, e)}>
          Done
          {activeStep === 2 && isTooltipOpen && (
            <div
              id="tooltip2"
              role="tooltip"
              className="w-64 absolute transition duration-150 ease-in-out shadow-lg bg-white p-4 rounded-xl z-50"
              style={{
                top: `${tooltipPosition.top}px`,
                left: `${tooltipPosition.left}px`,
                transform: 'translateX(-50%)',
              }}
              onClick={handleContentClick}
            >
              <button className="absolute top-2 right-1 p-2" onClick={handleCloseTooltip}>
                <IconTemplate icon="ant-design:close-outlined" className="w-3 h-3 text-black" />
              </button>
              <p className="text-sm font-bold text-gray-800 pb-1">Custom Tooltip for Step 2</p>
              <p className="text-xs leading-4 text-gray-600 pb-3">
                This is a placeholder content for the tooltip. Customize it according to your needs.
              </p>
              <Link to="/dashboard/samplelocator"><button className='bg-gray-700 text-white rounded-3xl px-4 py-2 font-semibold'>View more</button></Link>
            </div>
          )}
        </li>
      </ul>
    </div>
  );
};

export default LocatorSteps;