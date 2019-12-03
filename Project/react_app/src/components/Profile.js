import React, { Component } from "react";
import { Link } from "react-router-dom";
import { getProfile } from "./UserFunctions";

class Profile extends Component {
  constructor() {
    super();
    this.state = {
      username: "",
      all_email: "",
      primary_email: ""
    };
  }

  componentDidMount() {
    getProfile()
      .then(data =>
        this.setState({
          username: data.username,
          primary_email: data.primary_email,
          all_email: data.all_email
        })
      )
      .catch(err => {
        console.log(err.response.data);
      });
  }

  render() {
    const rows = [];
    for (let i = 0; i < this.state.all_email.length; i++) {
      const p = this.state.all_email[i];
      if (p.email === this.state.primary_email) {
        continue;
      }
      const jsx = (
        <tr>
          <td>{p.email}</td>
        </tr>
      );
      rows.push(jsx);
    }
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
                <td>Primary Email</td>
                <td>{this.state.primary_email}</td>
              </tr>
              <tr>
                <td>Secondary Email</td>
                <td>{rows}</td>
              </tr>
            </tbody>
          </table>
          <div className="container">
            <div className="col-sm-5 mx-auto">
              <Link to="/updateProfile">
                <button className="col-md-8 mx-auto">Update Profile</button>
              </Link>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Profile;
