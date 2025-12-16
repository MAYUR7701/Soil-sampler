/* eslint-disable no-unused-vars */
import {
  Navigate,
  Route,
  BrowserRouter as Router,
  Routes,
} from "react-router-dom";
import Home from "./components/Home";
import "./App.css";
import About from "./components/About/About";
import NotFound from "./components/NotFound";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import PrivateRoute from "./components/ProtectedRoute";
import SignIn from "./components/Authentication/SignIn";
import Dashboard from "./components/Dashboard/Dashboard";
import Logout from "./components/Authentication/Logout";
import Signup from "./components/Authentication/SignUp";

function App() {
  return (
    <main >
      <Router>
        {/* <Navbar /> */}
        <ToastContainer />
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<SignIn />} />
          <Route path="/signup" element={<Signup />} />
          <Route path="/about" element={<About />} />
          {/* <PrivateRoute path="/dashboard" element={<Dashboard />} /> */}
          {/* <PrivateRoute path="/logout" element={<Logout />} /> */}
          <Route
            path="/dashboard/:slug?/:sampleIdOrsampleLocatorId?"
            element={
              <PrivateRoute>
                <Dashboard />
              </PrivateRoute>
            }
          />
          <Route
            path="/logout"
            element={
              // <PrivateRoute>
              <Logout />
              // </PrivateRoute>
            }
          />
          <Route path="*" element={<NotFound />} />
        </Routes>
      </Router>
    </main>
  );
}

export default App;
