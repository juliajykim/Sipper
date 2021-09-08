import { combineReducers } from "redux";
import sipsReducer from "./sips_reducer";
import usersReducer from "./users_reducer";

const entitiesReducer = combineReducers({
  // this reducer is just like another root reducer
  sips: sipsReducer,
  users: usersReducer
});



export default entitiesReducer;
