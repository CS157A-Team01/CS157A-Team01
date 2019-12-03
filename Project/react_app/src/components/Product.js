import React, { Component } from "react";
import { getProduct } from "./UserFunctions";
import NewProduct from "./NewProduct";

class product extends Component {
  constructor() {
    super();
    this.state = {
      product: []
    };
  }
  componentDidMount() {
    getProduct()
      .then(data => {
        console.log(data);
        this.setState({
          product: data
        });
      })
      .catch(err => {
        console.log(err.response.data);
      });
  }

  render() {
    const rows = [];
    for (let i = 0; i < this.state.product.length; i++) {
      const p = this.state.product[i];
      const url_split = p.url.split("/");
      const id = url_split[url_split.length - 1];
      const jsx = (
        <tr>
          <td>{p.retailer}</td>
          <td
            onClick={() =>
              this.props.history.push(`/comment/${p.retailer}/${id}`)
            }
          >
            <a href="">{p.title}</a>
          </td>
          <td>{p.price}</td>
          <td>
            <a href={p.url}>{p.url}</a>
          </td>
          <td>{p.desired_price}</td>
        </tr>
      );
      rows.push(jsx);
    }
    return (
      <div className="container">
        <strong className="ml-3">Please Add Product Link Below</strong>
        <NewProduct />
        <div className="jumbotron mt-5">
          <div className="col-sm-8 mx-auto">
            <h1 className="text-center">Product Tracking</h1>
          </div>
          <table className="table c0l-md-6 mx-auto">
            <tbody>
              <tr>
                <td>Retailer</td>
                <td>Title</td>
                <td>Price</td>
                <td>Link</td>
                <td>Desired Price</td>
              </tr>
              {rows}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
}

export default product;
