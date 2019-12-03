import React, { Component } from "react";
import UserLayout from "./UserLayout";
import Announcement from "../Announcement";
import { getProfile } from "../UserFunctions";

class UserDashboard extends Component {
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
      const jsx = <div>{p.email}</div>;
      rows.push(jsx);
    }
    return (
      <UserLayout>
        <div className="user_nfo_panel">
          <h1>User information</h1>
          <div>
            <span>User Name: </span>
            <h1>{this.state.username}</h1>

            <span>Primary Email: </span>
            <h1>{this.state.primary_email}</h1>
            <span>Secondary Emails:</span>
            <h2>{rows}</h2>
          </div>
        </div>
        <div className="user_nfo_panel">
          <h1>Announcement</h1>
          <div className="user_product_block_wrapper">
            <Announcement />
          </div>
        </div>
      </UserLayout>
    );
  }
}

export default UserDashboard;
