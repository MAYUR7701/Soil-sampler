// Signup.js
import React, { useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import CustomInput from "../../utils/CustomInput";
import { useDispatch, useSelector } from "react-redux";
import { resetNotificationState, signupUser } from "../../reducers/authSlice";
import { toast } from "react-toastify";
import { notifyError, notifyMessage } from "../../utils/notify";
// ... (import statements remain the same)

const Signup = () => {
  const { loading, error, message, isAuthenticated } = useSelector(
    (state) => state.auth
  );
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [name, setName] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const [confirmPassword, setConfirmPassword] = useState("");

  useEffect(() => {
    // Display success or error message using toast
    if (message) {
      notifyMessage("succes-message", message);
      dispatch(resetNotificationState());
    }
    if (error) {
      notifyError("failed-error", error);
      dispatch(resetNotificationState());
    }
  }, [dispatch, error, message]);

  const handleSignUp = (e) => {
    e.preventDefault();

    // Basic form validation
    if (!name || !email || !password || !confirmPassword) {
      toast.error("Please fill in all fields.");
      return;
    }

    // Email format validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      toast.error("Invalid email format.");
      return;
    }

    // Password matching validation
    if (password !== confirmPassword) {
      toast.error("Passwords do not match.");
      return;
    }

    // Dispatch signup action
    dispatch(signupUser({ email, password, name }));
  };

  // Toggle Password Visibility
  const togglePasswordVisibility = (field) => {
    if (field === "password") {
      setShowPassword(!showPassword);
    } else if (field === "confirmPassword") {
      setShowConfirmPassword(!showConfirmPassword);
    }
  };

  if (isAuthenticated) {
    // Redirect to the dashboard if the user is already authenticated
    navigate("/dashboard");
    return null; // Avoid rendering anything else
  }

  return (
    <>
      {loading ? (
        "Loading..."
      ) : (
        <div className="min-h-screen flex dark:bg-black justify-center">
          <div className="w-full max-w-2xl p-6 m-auto d">
            <h2 className="text-center text-2xl mt-10 font-bold dark:text-white">
              Sign up
            </h2>
            <form className="mt-4">
              <div className="grid lg:grid-cols-2 lg:gap-4">
                <div className="mt-4">
                  <CustomInput
                    type="name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    placeholder="Full Name"
                  />
                </div>
                <div className="mt-4">
                  <CustomInput
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="Email Address"
                  />
                </div>
                <div className="relative mt-4">
                  <CustomInput
                  type={showPassword ? "text" : "password"}
                  placeholder="Password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
                <div className="absolute inset-y-0 top-[10px] right-0 pr-3 flex items-center">
                  <button
                    className="text-gray-500 hover:text-gray-700"
                    onClick={() => togglePasswordVisibility("password")}
                    type="button"
                  >
                    {showPassword ? "Hide" : "Show"}
                  </button>
                </div>
                  {/* ... (existing code) */}
                </div>
                <div className="relative mt-4">
                <CustomInput
                  type={showConfirmPassword ? "text" : "password"}
                  placeholder="Confirm Password"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                />
                <div className="absolute inset-y-0 top-[10px] right-0 pr-3 flex items-center">
                  <button
                    className="text-gray-500 hover:text-gray-700"
                    onClick={() => togglePasswordVisibility("confirmPassword")}
                    type="button"
                  >
                    {showConfirmPassword ? "Hide" : "Show"}
                  </button>
                </div>
                  {/* ... (existing code) */}
                </div>
              </div>

              <div className="mt-6">
                <button
                  type="submit"
                  onClick={handleSignUp}
                  className="w-full px-6 py-4 text-md font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-zinc-900 dark:bg-indigo-700 rounded-xl hover:bg-gray-700 focus:outline-none focus:ring focus:ring-gray-300 focus:ring-opacity-50"
                >
                  Sign up
                </button>
              </div>
            </form>
            <p className="mt-8 text-sm text-center text-gray-500 dark:text-gray-300">
              Already have an account ?{" "}
              <Link to="/login">
                <span className="font-medium cursor text-gray-700 dark:text-gray-200 hover:underline">
                  Login
                </span>
              </Link>
            </p>
          </div>
        </div>
      )}
    </>
  );
};

export default Signup;
