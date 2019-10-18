import React, { Component } from 'react'
import { Link, withRouter } from 'react-router-dom'
import Navbar from 'react-bootstrap/Navbar'
import Nav from 'react-bootstrap/Nav'
import InputGroup from 'react-bootstrap/InputGroup'
import FormControl from 'react-bootstrap/FormControl'
import Button from 'react-bootstrap/Button'
import { logout } from './UserFunctions'
import Cookies from 'universal-cookie';


class Landing extends Component {
  logoutUser(e) {
    e.preventDefault()
    logout()
      .then(data => {
        console.log(data)
        this.props.history.push(`/`)
      })
      .catch(err => console.log(err))
  }

  render() {
    const cookie = new Cookies()

    const loginRegLink = (
      <ul className="navbar-nav">
        <li className="nav-item">
          <Link to="/login" className="nav-link">
            Login
          </Link>
        </li>
        <li className="nav-item">
          <Link to="/register" className="nav-link">
            Register
          </Link>
        </li>
      </ul>
    )

    const userLink = (
      <ul className="navbar-nav">
        <li className="nav-item">
          <Link to="/profile" className="nav-link">
            User
          </Link>
        </li>
        <li className="nav-item">
          <a href="" onClick={this.logoutUser.bind(this)} className="nav-link">
            Logout
          </a>
        </li>
      </ul>
    )

    return (
      <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">
        <Navbar.Brand>
          <Link to="/" className="nav-link">
            BeatMeLOGO
              </Link>


        </Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="mx-auto">
            <InputGroup style={{ width: "50vw" }}>
              <FormControl
                placeholder="Paste link here"
                aria-label="Production"
                aria-describedby="basic-addon2"
              />
              <InputGroup.Append>
                <Button variant="outline-secondary" ><i className="fas fa-search-dollar" style={{ color: "white" }}></i></Button>
              </InputGroup.Append>
            </InputGroup>
          </Nav>
          <Nav>
            <Nav.Link>{cookie.get('csrf_access_token') ? userLink : loginRegLink}</Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Navbar>
    )
  }
}

export default withRouter(Landing)