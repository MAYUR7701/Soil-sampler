import React from 'react'
import { Link } from 'react-router-dom'

const SearchResultItem = ({icon, label, id}) => {
  return (
    <li  className="flex p-3 border hover:bg-[#f2f4f6] text-center text-gray-300 dark:text-white duration-200 cursor-pointer hover:text-white group rounded-xl hover:bg-white/5" role="option" tabIndex="-1">
      <Link to={`/dashboard/details/${id}`} className="flex w-full">
        <div className="flex items-center justify-center flex-none">
          <ion-icon name={icon} className="w-5 h-5 md hydrated" role="img" aria-label={`${icon} outline`}></ion-icon>
        </div>
        <div className="flex-auto ml-4">
          <p className="text-md text-[#0c0c0c] dark:text-white font-semibold">{label}</p>
        </div>
      </Link>
    </li>
  )
}

export default SearchResultItem