import React from "react";
import { Switch, Route } from "react-router-dom";
import Layout from "./layout/Layout";
import Home from "./components/Home";
import RegisterLogin from "./components/Register_login";

function App() {
  return (
    <Layout>
      <Switch>
        <Route exact path="/register_login" component={RegisterLogin} />
        <Route exact path="/" component={Home} />
      </Switch>
    </Layout>
  );
}

export default App;
