// LocatorDetailed.js
import React from 'react';
import LocatorItem from './LocatorItem';
import { itemsData } from './Locatordata';
const LocatorDetailed = () => {
  
  return (
    <div >
      <ul className="relative  m-10 border-s   border-gray-200 dark:border-gray-700">
        
        {itemsData.map((item, index) => (
          <LocatorItem key={index} {...item} />
        ))}
      </ul>
    </div>
  );
};

export default LocatorDetailed;
