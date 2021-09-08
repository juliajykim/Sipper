import { ADD_SIP, ADD_SIPS } from "../actions/sip_actions";

const sipsReducer = (state = {}, action) => {
  
  Object.freeze(state);
  switch (action.type) {
    case ADD_SIP:
      
      const newSip = action.sip;
      return Object.assign({}, state, {
        [newSip.id]: newSip,
      });
    case ADD_SIPS:
      
      const newSips = {};
      // action.sips.forEach((sip) => {
      //   newSips[sip.id] = sip;
      // });
      return action.sips
      // return newSips;
    default:
      return state;
  }
};

export default sipsReducer;
