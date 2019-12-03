import React, { Component } from "react";
import { getProduct } from "./UserFunctions";
import NewProduct from "./NewProduct";

class Product extends Component {
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
          <th>
            <button className="btn btn-danger">Remove</button>
          </th>
        </tr>
      );
      rows.push(jsx);
    }
    return (
      <div className="container">
        <h1>
          <strong className="ml-3">Please Add Product Link Below</strong>
        </h1>
        <NewProduct />
        <div className="col-sm-8 mx-auto">
          <h1 className="text-center">Product Tracking</h1>
        </div>
        <table className="table col-md-10 mx-auto">
          <tbody>
            <tr>
              <th className="text-center">Retailer</th>
              <th className="text-center">Title</th>
              <th className="text-center">Price</th>
              <th className="text-center">Link</th>
              <th className="text-center">Desired Price</th>
              <th className="text-center">Delete</th>
            </tr>
            {rows}
          </tbody>
        </table>
      </div>
    );
  }
}

export default Product;
