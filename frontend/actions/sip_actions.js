import * as APIUtil from "../util/sip_api_util";

export const ADD_SIP = "ADD_SIP";
export const ADD_SIPS = "ADD_SIPS";

export const receiveSip = (sip) => {
  return {
    type: ADD_SIP,
    sip,
  };
};

export const receiveSips = (sips) => {
  // if we used "payload" instead of "{sips, user}"
  // const {sips, user} = payload // would also create variables sips and user with the correct values
  // destructuring in js
  return {
    type: ADD_SIPS,
    sips,
  };
};

//thunk action creators
export const fetchSips = () => {
  return (dispatch) => {
    return APIUtil.fetchSips().then((sips) => {
      return dispatch(receiveSips(sips));
    });
  };
};

export const fetchUserSips = (id) => {
  return (dispatch) => {
    return APIUtil.fetchUserSips(id).then((sips) => {
      return dispatch(receiveSips(sips));
    });
  };
};

export const createSip = (sip) => {
  return (dispatch) => {
    return APIUtil.createSip(sip).then((newSip) => {
      return dispatch(receiveSip(newSip));
    });
  };
};
