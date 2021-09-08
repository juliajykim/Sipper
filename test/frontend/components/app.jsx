import React from "react";
import { Provider } from "react-redux";

import SipFormContainer from "./sips/sip_form_container";
import SipIndexContainer from "./sips/sip_index_container";

const App = ({ store }) => {
  return (
    <Provider store={store}>
      <>
        <SipFormContainer />
        <SipIndexContainer />
      </>
    </Provider>
  );
};
export default App;
