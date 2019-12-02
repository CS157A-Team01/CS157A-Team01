import React, { Component } from "react";
import Footer from "./Footer/index";
import Navbar from "./Navbar";
class Landing extends Component {
  render() {
    return (
      <div>
        <div className="page_container">{this.props.children}</div>
        <Footer />
      </div>
    );
  }
}

export default Landing;
