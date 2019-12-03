import React, { Component } from "react";
import { Link, withRouter } from "react-router-dom";
import Navbar from "react-bootstrap/Navbar";
import Nav from "react-bootstrap/Nav";
import { logout } from "./UserFunctions";
import Cookies from "universal-cookie";

class Landing extends Component {
  logoutUser(e) {
    e.preventDefault();
    logout()
      .then(data => {
        console.log(data);
        this.props.history.push(`/`);
      })
      .catch(err => console.log(err));
  }

  render() {
    const cookie = new Cookies();

    const loginRegLink = (
      <ul className="navbar-nav">
        <li className="nav-item">
          <Link to="/login" className="nav-link">
            <h2>Login</h2>
          </Link>
        </li>
        <li className="nav-item">
          <Link to="/register" className="nav-link">
            <h2>Register</h2>
          </Link>
        </li>
      </ul>
    );

    const userLink = (
      <ul className="navbar-nav">
        <li className="nav-item">
          <Link to="/dashboard" className="nav-link">
            <h2>My Account</h2>
          </Link>
        </li>
        <li className="nav-item">
          <Link to="/product" className="nav-link">
            <h2>Tracking</h2>
          </Link>
        </li>
        <li className="nav-item">
          <a href="" onClick={this.logoutUser.bind(this)} className="nav-link">
            <h2>Logout</h2>
          </a>
        </li>
      </ul>
    );

    return (
      <Navbar collapseOnSelect expand="md" bg="dark" variant="dark">
        <Navbar.Brand>
          <Link to="/" className="nav-link">
            <h1>
              <div className="logo">BeatMe</div>
            </h1>
          </Link>
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="mx-auto"></Nav>
          <Nav>
            <Nav.Link>
              {cookie.get("csrf_access_token") ? userLink : loginRegLink}
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Navbar>
    );
  }
}

export default withRouter(Landing);
