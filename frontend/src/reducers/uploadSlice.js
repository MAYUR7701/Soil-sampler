import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

// Create async thunk to fetch file names
export const fetchFileNames = createAsyncThunk(
  "upload/fetchFileNames",
  async ({ page, filter }, { rejectWithValue }) => {
    try {
      let url = `/api/upload/?page=${page + 1}`;
      if (filter) {
        url += `&filter=${filter}`;
      }
      const response = await axios.get(url);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

// Create async thunk upload slice
export const uploadFile = createAsyncThunk(
  "upload/uploadFile",
  async (formData, { rejectWithValue }) => {
    try {
      const response = await axios.post(`/api/upload/`, formData);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

// Create async thunk to delete a file
export const deleteFile = createAsyncThunk(
  "upload/deleteFile",
  async (fileId, { rejectWithValue }) => {
    try {
      const response = await axios.delete(`/api/upload/${fileId}/`);
      return response.data;
    } catch (error) {
      return rejectWithValue(error.response.data);
    }
  }
);

const initialState = {
  loading: false,
  files: [],
  error: null,
  message: null,
  pagination: {},
  pageNo: 1,
  filter:""
};

// Create upload slice
const uploadSlice = createSlice({
  name: "upload",
  initialState,
  reducers: {
    resetNotificationState: (state) => {
      state.error = null;
      state.message = null;
    },
    updatePage: (state, action) => {
      state.pageNo = action.payload;
    },
    updateFilter: (state, action) => {
      state.filter = action.payload;
    }
  },
  extraReducers: (builder) => {
    builder
      //Upload file
      .addCase(uploadFile.pending, (state) => {
        state.loading = true;
        state.error = null;
        state.message = null;
      })
      .addCase(uploadFile.fulfilled, (state, action) => {
        state.loading = false;
        state.error = null;
        state.message = action.payload?.message;
      })
      .addCase(uploadFile.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload?.error;
      })
      //Fetch file names
      .addCase(fetchFileNames.pending, (state) => {
        state.loading = true;
        state.error = null;
        state.message = null;
      })
      .addCase(fetchFileNames.fulfilled, (state, action) => {
        state.loading = false;
        state.error = null;
        state.files = action.payload?.data; // Assuming the response contains an array of file names
        state.pagination = action.payload?.pagination;
      })
      .addCase(fetchFileNames.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload?.error;
      }) // Add delete file case
      .addCase(deleteFile.pending, (state) => {
        state.loading = true;
        state.error = null;
        state.message = null;
      })
      .addCase(deleteFile.fulfilled, (state, action) => {
        state.loading = false;
        state.error = null;
        state.message = action.payload?.message;
        // Optionally remove the deleted file from the state
        state.files = state.files.filter(
          (file) => file.id !== action.payload?.deletedFileId
        );
      })
      .addCase(deleteFile.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload?.error;
      });
  },
});
export const { resetNotificationState, updatePage ,updateFilter} = uploadSlice.actions;

export default uploadSlice.reducer;
