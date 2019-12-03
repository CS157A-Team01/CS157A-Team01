import React, { Component } from "react";
import { addProduct } from "./UserFunctions";

class NewProduct extends Component {
  constructor() {
    super();
    this.state = {
      url: "",
      price: 10
    };
    this.onSubmit = this.onSubmit.bind(this);
    this.onChange = this.onChange.bind(this);
  }

  onSubmit(e) {
    this.setState({ url: e.target.value });
    e.preventDefault();
    addProduct(this.state.url, this.state.price).catch(err =>
      console.log(err.response)
    );
  }

  onChange(e) {
    this.setState({ url: e.target.value });
  }

  render() {
    return (
      <div className="container">
        <form onSubmit={this.onSubmit}>
          <div className="form-group">
            <input
              className="form-control"
              type="text"
              placeholder="Paste Link Here"
              onChange={this.onChange}
            />
          </div>
          <button type="submit" class="btn">
            Submit
          </button>
        </form>
      </div>
    );
  }
}

export default NewProduct;
