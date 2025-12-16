// SignIn.js
import React, { useState, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { FaSpinner } from "react-icons/fa";
import { AiOutlineReload } from "react-icons/ai";
import { loginUser, resetNotificationState } from "../../reducers/authSlice";
import { generateCaptcha } from "../../reducers/captchaSlice";
import CustomInput from "../../utils/CustomInput";
import { notifyError, notifyMessage } from "../../utils/notify";

const SignIn = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();

  // Selectors
  const {
    loading: loginLoading,
    error: loginError,
    message: loginMessage,
    isAuthenticated,
  } = useSelector((state) => state.auth);
  const {
    captcha_id,
    captcha,
    loading: captchaLoading,
    error: captchaError,
  } = useSelector((state) => state.captcha);

  // Local state
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [captchaText, setCaptchaText] = useState("");

  // Handle Reload Captcha
  const handleReload = () => {
    dispatch(generateCaptcha({ captcha_id }));
  };

  // Handle Login
  const handleLogin = (e) => {
    e.preventDefault();

    // Simple client-side validation
    if (!email || !password || !captchaText) {
      notifyError("field-error", "Please fill in all the fields");
      return;
    }

    dispatch(
      loginUser({ email, password, captcha_id, captcha_answer: captchaText })
    );
  };

  // Effect to generate captcha when component mounts
  useEffect(() => {
    if (!isAuthenticated) {
      dispatch(generateCaptcha({ captcha_id }));
    }
  }, []);

  // Effect to show notifications
  useEffect(() => {
    if (loginMessage) notifyMessage("auth-success", loginMessage);
    if (loginError) {
      notifyError("auth-error", loginError);
      handleReload();
    }
    dispatch(resetNotificationState());
  }, [dispatch, loginError, loginMessage]);

  // Toggle Password Visibility
  const togglePasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  // Redirect if already authenticated
  useEffect(() => {
    if (isAuthenticated) navigate("/dashboard");
  }, [isAuthenticated, navigate]);

  return (
    <div className="h-screen dark:bg-black flex items-center justify-center">
      <div className="w-full max-w-md p-6 m-auto  dark:rounded-3xl">
        <h2 className="text-center text-2xl mt-10 font-bold dark:text-white">
          Sign in
        </h2>
        <form className="mt-10">
          {/* Email Input */}
          <CustomInput
            type="email"
            placeholder="Email Address"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />

          {/* Password Input */}
          <div className="relative mt-4">
            <CustomInput
              type={showPassword ? "text" : "password"}
              placeholder="Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
            <div className="absolute inset-y-0 right-0 pr-3 flex items-center">
              <button
                className="text-gray-500 hover:text-gray-700"
                onClick={togglePasswordVisibility}
                type="button"
              >
                {showPassword ? "Hide" : "Show"}
              </button>
            </div>
          </div>

          {/* Captcha Input */}
          <div className="flex mt-4 justify-center items-center">
            <CustomInput
              type={"text"}
              className
              placeholder="Captcha"
              value={captchaText}
              onChange={(e) => setCaptchaText(e.target.value)}
            />
            <div className="">
              {captchaLoading ? (
                <div className="flex-1 flex justify-center items-center text-indigo-500 text-lg">
                  <FaSpinner className="animate-spin" />
                  reload
                </div>
              ) : (
                <div className="flex items-center justify-center">
                  <AiOutlineReload
                    onClick={handleReload}
                    title="Reload Captcha"
                    className="cursor-pointer text-indigo-500 font-bold mx-2 text-7xl"
                  />
                  <img
                    className="m-2 rounded-lg"
                    style={{ height: 60, width: 250 }}
                    src={captcha}
                    alt="Captcha"
                  />
                </div>
              )}
            </div>
          </div>

          {/* Captcha Error Message */}
          <div className="flex mt-4 justify-center items-center text-red-500">
            {captchaError}
          </div>

          {/* Submit Button */}
          <div className="mt-6">
            <button
              type="submit"
              className="w-full px-6 py-4 text-md font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-zinc-900  dark:bg-indigo-700 rounded-xl hover:bg-gray-700 focus:outline-none focus:ring focus:ring-gray-300 focus:ring-opacity-50"
              onClick={handleLogin}
            >
              {loginLoading ? <FaSpinner className="animate-spin" /> : "Log in"}
            </button>
          </div>

          {/* Forgot Password Link */}
          <div className="flex pt-4 items-center justify-center">
            {/* <Link to="/forgot">
              <span className="text-xs cursor text-gray-600 dark:text-gray-400 hover:underline">
                Forget Password?
              </span>
            </Link> */}
          </div>
        </form>

        {/* Social Media Login */}

        {/* Create Account Link */}
        <p className="mt-8 text-sm text-center text-gray-500 dark:text-gray-300">
          Don&apos;t have an account ?{" "}
          <Link to="/signup">
            <span className="font-medium cursor text-gray-700 dark:text-gray-200 hover:underline">
              Create One
            </span>
          </Link>
        </p>
      </div>
    </div>
  );
};

export default SignIn;
