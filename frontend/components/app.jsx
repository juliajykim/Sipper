import React from "react";
import { Provider } from "react-redux";

import SipFormContainer from "./sips/sip_form_container";
import SipIndexContainer from "./sips/sip_index_container";

const App = ({ store }) => {
  return (
    <Provider store={store}>
      <div className="sipper-content">
        <div className="logo">
          <h1>Sipper</h1>
          <img src={window.logoUrl} alt="gossip" />
        </div>
        <SipFormContainer />
        <SipIndexContainer />
      </div>
    </Provider>
  );
};
export default App;
