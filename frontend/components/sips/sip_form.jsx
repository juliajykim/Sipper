import React from "react";

class SipForm extends React.Component {
  constructor(props) {
    
    super(props);

    this.state = { body: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    
    return (e) => {
      
      this.setState({ [field]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();

    this.props.createYip(this.state);
    this.setState({ body: "" });
  }

  render() {
    return (
      <>
        <h2 className="new-sip_header">Make a new sip!</h2>

        <form className="new-sip_form" onSubmit={this.handleSubmit}>
          <label htmlFor="sip-body">Body</label>
          <input
            type="text"
            id="sip-body"
            onChange={this.update("body")}
            value={this.state.body}
          />

          <button>Send it!</button>
        </form>
      </>
    );
  }
}
export default SipForm;
