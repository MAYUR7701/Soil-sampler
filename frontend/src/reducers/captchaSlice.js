// reducers/authSlice.js
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

// Create async thunk for user login
export const generateCaptcha = createAsyncThunk(
  "captcha/generate",
  async (captchaData, { rejectWithValue }) => {
    try {
      const response = await axios.post("/api/captcha/", captchaData);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

export const resetCaptchaState = (state) => {
  state.error = null;
  state.message = null;
};

// Initial state
const initialState = {
  captcha_id: null,
  captcha: null,
  loading: false,
  error: null,
  message: null,
};

// Create authSlice
const captchaSlice = createSlice({
  name: "captcha",
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
      .addCase(generateCaptcha.pending, (state) => {
        state.loading = true;
        state.error = null;
        state.message = null;
      })
      .addCase(generateCaptcha.fulfilled, (state, action) => {
        state.loading = false;
        state.captcha_id = action.payload?.data?.captcha_id;
        state.captcha = action.payload?.data?.captcha;
      })
      .addCase(generateCaptcha.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload.error;
      })
  },
});
export const { resetNotificationState } = captchaSlice.actions;

export default captchaSlice.reducer;
