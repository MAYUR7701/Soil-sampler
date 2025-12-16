import React from 'react'
const Content = ({children}) => {
  return (
    <div className='min-h-screen bg-white dark:bg-gray-900'>
      <div className=" ">
          <div className=" h-[80vh] dark:border-gray-800">
            <span className="dark:text-white">
           {children}
            </span>
          </div>
        </div>
    </div>
  )
}

export default Content
