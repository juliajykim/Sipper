import { connect } from "react-redux";

import { createSip } from "../../actions/sip_actions";
import SipForm from "./sip_form";

const mapStateToProps = (state) => {
  return {};
};

const mapDispatchToProps = (dispatch) => {
  return {
    createYip: (body) => {
      dispatch(createSip(body));
    },
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(SipForm);
