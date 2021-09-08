import { connect } from "react-redux";
import SipIndex from "./sip_index";
import { fetchSips, fetchUserSips } from "../../actions/sip_actions";

const mapStateToProps = (state) => {
  
  return {
    sips: Object.values(state.entities.sips),
  };
};

const mapDispatchToProps = (dispatch) => {
  
  return {
    fetchSips: () => {
      
      return dispatch(fetchSips()); //thunk action creator from actions.js
    },
    fetchUserSips: (id) => {
      
      return dispatch(fetchUserSips(id)); //thunk action creator from actions.js
    },
  };
};
export default connect(mapStateToProps, mapDispatchToProps)(SipIndex);
