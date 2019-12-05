import React, { Component } from "react";
import { Link } from "react-router-dom";
import { getProfile, deleteEmail } from "./UserFunctions";

class Profile extends Component {
  constructor() {
    super();
    this.state = {
      username: "",
      all_email: [],
      primary_email: "",
      delete: ""
    };
    this.onClick = this.onClick.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  onClick(e, email) {
    e.preventDefault();
    console.log(email);
    deleteEmail(email).catch(err => console.log(err.response));
  }

  onSubmit(e) {
    e.preventDefault();
    this.setState({ all_email: e.target.value });
  }

  componentDidMount() {
    getProfile()
      .then(data =>
        this.setState(
          {
            username: data.username,
            primary_email: data.primary_email,
            all_email: data.all_email
          },
          () => {
            console.log(this.state);
          }
        )
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
        <tr className="text-center">
          <td>{p.email}</td>
          <td>
            <form onSubmit={this.onSubmit}>
              <button
                className="link_default"
                onClick={e => {
                  this.onClick(e, p.email);
                }}
              >
                del
              </button>
            </form>
          </td>
        </tr>
      );
      rows.push(jsx);
    }
    return (
      <div className="container">
        <div className="col-sm-5 mx-auto">
          <h1 className="text-center">PROFILE</h1>
        </div>
        <table className="table col-md-6 mx-auto">
          <tbody>
            <tr>
              <td className="text-center">
                <strong>Username</strong>
              </td>
              <td>{this.state.username}</td>
            </tr>
            <tr>
              <td className="text-center">
                <strong>Primary Email</strong>
              </td>
              <td>{this.state.primary_email}</td>
            </tr>
            <tr>
              <td className="text-center">
                <strong>Secondary Email</strong>
              </td>
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
    );
  }
}

export default Profile;
