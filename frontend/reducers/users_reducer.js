import { ADD_SIP, ADD_SIPS } from "../actions/sip_actions";

const usersReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case ADD_SIP:
      return Object.assign({}, state, action.user);
    case ADD_SIPS:
      
      return Object.assign({}, state, action.user);
    default:
      return state;
  }
};

export default usersReducer;
