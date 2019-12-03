import React, { Component } from "react";
import { getProfile } from "./UserFunctions";

class UpdateProfile extends Component {
  constructor() {
    super();
    this.state = {
      username: "",
      new_password: "",
      password: "",
      email: "",
      primary_email: ""
    };
    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }

  onChange(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  onSubmit(e) {
    e.preventDefault();

    const user = {
      username: this.state.username,
      password: this.state.password,
      new_password: this.state.new_password,
      email: this.state.email,
      primary_email: this.state.primary_email
    };
  }

  componentDidMount() {
    getProfile()
      .then(data =>
        this.setState({
          username: data.username,
          primary_email: data.primary_email
        })
      )
      .catch(err => {
        console.log(err.response.data);
      });
  }

  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-md-6 mt-5 mx-auto">
            <form noValidate onSubmit={this.onSubmit}>
              <h1 className="h3 mb-3 font-weight-normal">Update Profile</h1>
              <div className="form-group">
                <label htmlFor="username">User name</label>
                <input
                  type="username"
                  className="form-control"
                  name="username"
                  placeholder="Enter username"
                  value={this.state.username}
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="email">primary_email address</label>
                <input
                  type="email"
                  className="form-control"
                  name="email"
                  placeholder="Enter email"
                  value={this.state.primary_email}
                />
              </div>
              <div className="form-group">
                <label htmlFor="email">New Email address</label>
                <input
                  type="email"
                  className="form-control"
                  name="new_email"
                  placeholder="Enter email"
                  value={this.state.email}
                  onChange={this.onChange}
                />
              </div>
              <div className="form-group">
                <label htmlFor="password">Old Password</label>
                <input
                  type="password"
                  className="form-control"
                  name="password"
                  placeholder="Password"
                  value={this.state.password}
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
