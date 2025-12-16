/* eslint-disable no-unused-vars */
/* eslint-disable react/prop-types */
import React from "react";
import { useSelector } from "react-redux";
import { Navigate } from "react-router-dom";
import { notifyError } from "../utils/notify";

const PrivateRoute = ({ children }) => {
  const { isAuthenticated } = useSelector((state) => state.auth);
  if (!isAuthenticated) {
    // navigate("/login");
    notifyError("unauthenticated_error", "Please login to continue");
    return <Navigate to="/login" />;

  }
  // return null; // Return null to prevent rendering the component

  // Render the component for UI navigation or authenticated users
  return children;
};

export default PrivateRoute;
