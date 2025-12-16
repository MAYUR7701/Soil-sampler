import React from 'react'
import IconTemplate from './Icons/IconTemplate'

const Button = ({ handleClick, icon, label, className }) => {
    return (
        <button
            className={className ? className : 'btn bg-indigo-600  dark:text-gray-200 hover:text-black text-white dark:hover:text-white w-full lg:w-fit'}
            onClick={handleClick}
        >
            {icon ? icon : ""}

            {label}
        </button>
    )
}

export default Button