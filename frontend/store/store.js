import { createStore, applyMiddleware } from "redux";
import logger from "redux-logger";
import rootReducer from "../reducers/root_reducer";
import thunk from "../middleware/thunk";

const configureStore = (preloadedState = {}) => {
  return createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(thunk, logger)
  );
  //create store with applyMiddleware
  //so thunk will intercept all the actions
  // to check if it's pojo action or thunk action
};

export default configureStore;
