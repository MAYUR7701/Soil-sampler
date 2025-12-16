// reducers/authSlice.js
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import { notifyError, notifyMessage } from "../utils/notify";

// Create async thunk for user login
export const loginUser = createAsyncThunk(
  "auth/login",
  async (credentials, { rejectWithValue }) => {
    try {
      const response = await axios.post("/api/login/", credentials, {
        headers: {
          "Content-Type": "application/json",
        },
      });
      return response.data.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

// Create async thunk for user signup
export const signupUser = createAsyncThunk(
  "auth/signup",
  async (userData, { rejectWithValue }) => {
    try {
      const response = await axios.post("/api/register/", userData);
      return response.data.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

// Create async thunk for user logout
export const logoutUser = createAsyncThunk(
  "auth/logout",
  async (_, { rejectWithValue }) => {
    try {
      // const dispatch = useDispatch();
      const response = await axios.post("/api/logout/"); // Replace with the actual endpoint for logout
      localStorage.removeItem("persist:root");
      notifyMessage("logout-success", response.data.data.message); // Display success message
      return;
    } catch (error) {
      // console.log(error.response.data.error);
      // Display an error message if the request fails
      notifyError("auth-error", error.response.data.error);
      return rejectWithValue(error.response.data.error);
    }
  }
);

// get user details
export const getUserDetails = createAsyncThunk(
  "auth/user",
  async (_, { rejectWithValue }) => {
    try {
      const response = await axios.get("/api/user/");
      return response.data.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

export const resetAuthState = (state) => {
  state.error = null;
  state.message = null;
};

// Initial state
const initialState = {
  user: null,
  isAuthenticated: false,
  loading: false,
  error: null,
  message: null,
};

// Create authSlice
const authSlice = createSlice({
  name: "auth",
  initialState,
  reducers: {
    resetNotificationState: (state) => {
      state.error = null;
      state.message = null;
    },
  },
  extraReducers: (builder) => {
    builder
      // Reducer for loginUser
      .addCase(loginUser.pending, (state) => {
        state.loading = true;
        state.error = null;
        state.message = null;
      })
      .addCase(loginUser.fulfilled, (state, action) => {
        state.loading = false;
        state.user = action.payload?.user;
        state.isAuthenticated = true;
        state.message = action.payload?.message;
      })
      .addCase(loginUser.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload?.error;
      })
      // Reducer for signupUser
      .addCase(signupUser.pending, (state) => {
        state.loading = true;
        state.error = null;
        state.message = null;
      })
      .addCase(signupUser.fulfilled, (state, action) => {
        state.loading = false;
        state.message = action.payload.message;
      })
      .addCase(signupUser.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.errors;
      })
      // Reducer for logoutUser
      .addCase(logoutUser.pending, (state) => {
        state.loading = true;
        state.error = null;
        state.message = null;
      })
      .addCase(logoutUser.rejected, (state) => {
        state.loading = false;
        state.user = null;
        state.isAuthenticated = false;
        state.message = null;
        state.error = false;
      })
      // Reducer for getUserDetails
      .addCase(getUserDetails.pending, (state) => {
        state.loading = true;
      })
      .addCase(getUserDetails.fulfilled, (state, action) => {
        state.loading = false;
        state.user = action.payload?.user;
      })
      .addCase(getUserDetails.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload?.error;
        state.isAuthenticated = false;
      });
  },
});
export const { resetNotificationState } = authSlice.actions;

export default authSlice.reducer;
