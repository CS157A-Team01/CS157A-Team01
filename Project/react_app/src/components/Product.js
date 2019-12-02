import React, { Component } from "react";
import { getProduct } from "./UserFunctions";

class product extends Component {
  constructor() {
    super();
    this.state = {
      retailer: "",
      title: "",
      url: "",
      price: "",
      desired_price: ""
    };
  }
  componentDidMount() {
    getProduct()
      .then(data =>
        this.setState({
          retailer: data.retailer,
          title: data.title,
          url: data.url,
          price: data.price,
          desired_price: data.desired_price
        })
      )
      .catch(err => {
        console.log(err.response.data);
      });
  }

  render() {
    return (
      <div className="container">
        <div className="jumbotron mt-5">
          <div className="col-sm-8 mx-auto">
            <h1 className="text-center">Product Tracking</h1>
          </div>
          <table className="table c0l-md-6 mx-auto">
            <tbody>
              <tr>
                <td>Retailer</td>
                <td>{this.state.retailer}</td>
              </tr>
              <tr>
                <td>title</td>
                <td>{this.state.title}</td>
              </tr>
              <tr>
                <td>URL</td>
                <td>{this.state.URL}</td>
              </tr>
              <tr>
                <td>Price</td>
                <td>{this.state.Price}</td>
              </tr>
              <tr>
                <td>Desired Price</td>
                <td>{this.state.desired_price}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    );
  }
}

export default product;
