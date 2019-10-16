import React, { Component } from 'react'
import jwt_decode from 'jwt-decode'
import {getProfile} from "./UserFunctions";

class Profile extends Component {
  constructor() {
    super()
    this.state = {
      username: '',
      password: '',
      primary_email: ''
    }
  }

  componentDidMount() {
    getProfile().then(data => this.setState({
      username: data.username,
      password: data['hashed password'],
      primary_email: data['primary email']
    }))

  }

  render() {
    return (
      <div className="container">
        <div className="jumbotron mt-5">
          <div className="col-sm-8 mx-auto">
            <h1 className="text-center">PROFILE</h1>
          </div>
          <table className="table col-md-6 mx-auto">
            <tbody>
              <tr>
                <td>Username</td>
                <td>{this.state.username}</td>
              </tr>
              <tr>
                <td>Hashed password</td>
                <td>{this.state.password}</td>
              </tr>
              <tr>
                <td>Email</td>
                <td>{this.state.primary_email}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    )
  }
}

export default Profile