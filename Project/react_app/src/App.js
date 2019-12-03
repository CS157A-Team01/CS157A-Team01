import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Landing from "./components/Landing";
import Login from "./components/Login";
import Register from "./components/Register";
import Profile from "./components/Profile";
import Product from "./components/Product";
import UpdateProfile from "./components/UpdateProfile";
import Home from "./components/Home/index";
import Comments from "./components/Comments";
import NotFoundPage from "./components/NotFound";
import newProduct from "./components/NewProduct";

function App() {
  return (
    <Router>
      <Landing>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/dashboard" component={Product} />
          <Route exact path="/register" component={Register} />
          <Route exact path="/login" component={Login} />
          <Route exact path="/profile" component={Profile} />
          <Route exact path="/updateProfile" component={UpdateProfile} />
          <Route exact path="/product" component={Product} />
          <Route exact path="/comment/:retailer/:id" component={Comments} />

          <Route exact path="/test" component={newProduct} />
          <Route path="*" component={NotFoundPage} />
        </Switch>
      </Landing>
    </Router>
  );
}

export default App;
