import React from "react";

class SipIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchSips();
  }

  render() {
    if (this.props.sips.length == 0) {
      return <span>No sips yet!</span>;
    }

    const sipLis = this.props.sips.map((sip) => {
      return <li key={sip.id}>{sip.body}</li>;
    });

    return <ul className="sips">{sipLis}</ul>;
  }
}

export default SipIndex;
