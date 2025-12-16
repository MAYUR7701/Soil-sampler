// Import your individual reducer files
import { combineReducers } from "@reduxjs/toolkit";
import authReducer from "./authSlice";
import captchaReducer from "./captchaSlice";
import SampleReducer from "./sampleSlice";
import sampleLocatorReducer from "./sampleLocatorSlice";
import sampleTestReducer from "./sampleTestSlice";
import settingsReducer from "./settingSlice";
import stationReducer from "./stationSlice";
import filterReducer from "./filterSlice"
import uploadReducer from "./uploadSlice";
// Combine your reducers into a root reducer
export const rootReducer = combineReducers({
  auth: authReducer,
  captcha: captchaReducer,
  sample: SampleReducer,
  station: stationReducer,
  sampleLocator: sampleLocatorReducer,
  sampleTest: sampleTestReducer,
  settings: settingsReducer,
  filter: filterReducer,
  upload: uploadReducer,
  // Add more reducers as needed
});
export default rootReducer;
