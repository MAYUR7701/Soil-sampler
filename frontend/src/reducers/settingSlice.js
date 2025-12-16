// reducers/authSlice.js
import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";

// Create async thunk for auto acquire
export const autoAcquireThunk = createAsyncThunk(
  "autoAcquire/set",
  async (data, { rejectWithValue }) => {
    return data;
  }
);
//Create async thunk for auto generate
export const autoGenerateThunk = createAsyncThunk(
  "autoGenerate/set",
  async (data, { rejectWithValue }) => {
    return data;
  }
);

// Create async thunk for auto generate and dispatch
export const autoGenerateAndDispatchThunk = createAsyncThunk(
  "autoGenerateAndDispatch/set",
  async (data, { rejectWithValue }) => {
    return data;
  }
);
// Create async thunk for changing cameraId
export const changeCameraId = createAsyncThunk(
  "cameraId/change",
  async (newCameraId, { rejectWithValue }) => {
    return newCameraId;
  }
);

export const resetSettingState = (state) => {
  state.error = null;
  state.message = null;
};

// Initial state
const initialState = {
  autoAcquire: false,
  autoGenerate: false,
  dispatch: false,
  error: null,
  message: null,
  cameraId: null,
};

// Create Slice
const settingsSlice = createSlice({
  name: "settings",
  initialState,
  reducers: {
    resetNotificationState: (state) => {
      state.error = null;
      state.message = null;
    },
  },
  extraReducers: (builder) => {
    builder
      // Reducer for auto acquire
      .addCase(autoAcquireThunk.pending, (state) => {
        state.error = null;
        state.message = null;
      })
      .addCase(autoAcquireThunk.fulfilled, (state, action) => {
        state.autoAcquire = action.payload;
      })
      .addCase(autoAcquireThunk.rejected, (state, action) => {
        state.error = action.payload.error;
      })
      // Reducer for auto generate
      .addCase(autoGenerateThunk.pending, (state) => {
        state.error = null;
        state.message = null;
      })
      .addCase(autoGenerateThunk.fulfilled, (state, action) => {
        if (action.payload) {
          state.autoGenerate = action.payload;
          state.dispatch = false;
        } else {
          state.autoGenerate = action.payload;
          state.dispatch = action.payload;
        }
      })
      .addCase(autoGenerateThunk.rejected, (state, action) => {
        state.error = action.payload.error;
      })
      //Reducer for auto generate and dispatch
      .addCase(autoGenerateAndDispatchThunk.pending, (state) => {
        state.error = null;
        state.message = null;
      })
      .addCase(autoGenerateAndDispatchThunk.fulfilled, (state, action) => {
        state.dispatch = action.payload;
        state.autoGenerate = action.payload;
      })
      .addCase(autoGenerateAndDispatchThunk.rejected, (state, action) => {
        state.error = action.payload.error;
      })
      // Reducer for changing cameraId
      .addCase(changeCameraId.pending, (state) => {
        state.error = null;
        state.message = null;
      })
      .addCase(changeCameraId.fulfilled, (state, action) => {
        state.cameraId = action.payload;
      })
      .addCase(changeCameraId.rejected, (state, action) => {
        state.error = action.payload.error;
      });
  },
});
export const { resetNotificationState } = settingsSlice.actions;

export default settingsSlice.reducer;
