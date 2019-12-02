import React from "react";
import UserLayout from "../../layout/user";
import MyButton from "../utilis/button";
import user_reducer from "../../reducers/user_reducer";

const UserDashboard = ({ user }) => {
  return (
    <UserLayout>
      <div className="user_nfo_panel">
        <h1>User information</h1>
        <div>
          <span>UserName: </span>
          {/* {user.userData.username} */}
          <span>Email: </span>
          {/* {user.userData.email} */}
        </div>
        <MyButton
          type="default"
          title="Edit account info"
          linkTo="/user/user_profile"
        />
      </div>
      <div className="user_nfo_panel">
        <h1>Product Price information</h1>
        <div className="user_product_block_wrapper">Price</div>
      </div>
    </UserLayout>
  );
};

export default UserDashboard;
