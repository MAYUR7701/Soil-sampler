import React from 'react';

const CustomInput = ({ type, placeholder, value, onChange }) => {
  return (
    <input
      type={type}
      className="block w-full px-4 py-4 mt-2 text-gray-700 bg-white border rounded-xl dark:bg-black dark:text-gray-300 dark:border-zinc-900 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
      placeholder={placeholder}
      value={value}
      onChange={onChange}
    />
  );
};

export default CustomInput;
