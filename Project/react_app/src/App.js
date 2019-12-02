import React from "react";
import { Switch, Route } from "react-router-dom";
import Layout from "./layout/Layout";
import Home from "./components/Home";
import RegisterLogin from "./components/Register_login";
import Register from "./components/Register_login/register";
import UserDashboard from "./components/User";
import Auth from "./layout/auth";
import UpdateProfile from "./components/User/update_profile";
function App() {
  return (
    <Layout>
      <Switch>
        <Route
          exact
          path="/user/dashboard"
          component={Auth(UserDashboard, true)}
        />
        <Route exact path="/register" component={Auth(Register, null)} />
        <Route
          exact
          path="/register_login"
          component={Auth(RegisterLogin, false)}
        />
        <Route
          exact
          path="/user/user_profile"
          component={Auth(UpdateProfile, true)}
        />
        <Route exact path="/" component={Auth(Home, null)} />
      </Switch>
    </Layout>
  );
}

export default App;
