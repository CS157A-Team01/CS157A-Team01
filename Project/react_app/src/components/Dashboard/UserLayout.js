import React from "react";
import { Link } from "react-router-dom";

const links = [
  {
    name: "My account",
    linkTo: "/dashboard"
  },
  {
    name: "User information",
    linkTo: "/profile"
  },
  {
    name: "Price Track",
    linkTo: "/product"
  }
];

const UserLayout = props => {
  const generateLinks = links =>
    links.map((item, i) => (
      <Link to={item.linkTo} key={i}>
        {item.name}
      </Link>
    ));
  return (
    <div className="container">
      <div className="user_container">
        <div className="user_left_nav">
          <h2>My account</h2>
          <div className="links">{generateLinks(links)}</div>
          <br />
          <div>
            <h2>Online shop</h2>
            <div className="links">
              <a href="www.amazon.com">Amazon</a>
            </div>
            <div className="links">
              <a href="www.walmart.com">Walmart</a>
            </div>
          </div>
        </div>
        <div className="user_right">{props.children}</div>
      </div>
    </div>
  );
};

export default UserLayout;
