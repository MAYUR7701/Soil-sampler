/* eslint-disable no-unused-vars */
import React, { useEffect } from "react";
import { useSelector } from "react-redux";
import { Link, useNavigate } from "react-router-dom";
const Home = () => {
  const { isAuthenticated } = useSelector((state) => state.auth);
const navigate=useNavigate();
  useEffect(() => {
 if(isAuthenticated)
 navigate("/dashboard");
  }, [])
  
  return (
    <>
    <div className="flex dark:bg-black  items-center justify-center h-screen">

    <div className="grid grid-cols-1">

   
      <div className="mt-3 text-center text-6xl mb-10 font-bold tracking-tighter">Soil Tracker</div>
      {/* <p className="text-blue-600 font-semibold text-4xl mb-10 text-center">Under development</p>  */}
      <div className=" flex items-center justify-center">
        <Link
          to={"/login"}
          className="border p-3 px-10 font-semibold rounded-lg m-2 bg-blue-500 text-white "
        >
          Login
        </Link>
        <Link
          to={"/signup"}
          className="border p-3 px-10 font-semibold rounded-lg m-2 bg-cyan-500 text-white "
        >
          Register
        </Link>
      </div>
      </div>
      </div>
    </>
  );
};

export default Home;
