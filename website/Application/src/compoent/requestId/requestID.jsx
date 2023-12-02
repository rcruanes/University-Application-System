import React from "react";

class RequestIdGenerator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      requestId: "",
    };
  }

  componentDidMount() {
    const storedRequestId = localStorage.getItem("requestId");
    if (storedRequestId) {
      this.setState({ requestId: storedRequestId });
    } else {
      this.generateRequestId();
    }
  }

  generateRequestId = () => {
    const timestamp = Date.now();
    const randomNum = Math.floor(Math.random() * 1000);
    const requestId = `${timestamp}-${randomNum}`;
    this.setState({ requestId });
    localStorage.setItem("requestId", requestId);
  };

  render() {

  }
}

export default RequestIdGenerator;
