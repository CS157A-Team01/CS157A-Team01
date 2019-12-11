import React, { Component } from "react";
import axios from "axios";
import Cookies from "universal-cookie";

const cookie = new Cookies();

class UpdateProfile extends Component {
  constructor() {
    super();
    this.state = {
      username: "",
      new_password: "",
      email: ""
    };
    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  onChange(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  onSubmit(e) {
    e.preventDefault();

    if (this.state.username !== "") {
      axios
        .put(
          "api/user/username",
          {
            new_username: this.state.username
          },
          { headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` } }
        )
        .catch(err => console.log(err.response));
    }
    if (this.state.email !== "") {
      axios
        .post(
          "api/user/email",
          {
            email: this.state.email
          },
          {
            headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` },
            withCredentials: true
          }
        )
        .catch(err => console.log(err.response));
    }
    if (this.state.new_password !== "") {
      axios
        .put(
          "api/user/password",
          {
            new_password: this.state.new_password
          },
          {
            headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` },
            withCredentials: true
          }
        )
        .catch(err => console.log(err.response));
    }
  }

  mes() {
    alert("User Profile Update Success");
  }

  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-md-6 mt-5 mx-auto">
            <form noValidate onSubmit={this.onSubmit}>
              <h1 className="h3 mb-3 font-weight-normal">Update Profile</h1>
              <div className="form-group">
                <label htmlFor="username">New User Name</label>
                <input
                  type="username"
                  className="form-control"
                  name="username"
                  placeholder="Enter New Username"
                  value={this.state.username}
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="email">Email address</label>
                <input
                  type="email"
                  className="form-control"
                  name="email"
                  placeholder="Enter email"
                  value={this.state.email}
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="password">New Password</label>
                <input
                  type="password"
                  className="form-control"
                  name="new_password"
                  placeholder="Password"
                  value={this.state.new_password}
                  onChange={this.onChange}
                />
              </div>
              <button
                type="submit"
                className="btn btn-lg btn-primary btn-block"
                onClick="location.href='/dashboard'"
              >
                Update
              </button>
            </form>
          </div>
        </div>
      </div>
    );
  }
}

export default UpdateProfile;
