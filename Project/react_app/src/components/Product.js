import React, { Component } from "react";
import { getProduct, deleteProduct } from "./UserFunctions";
import NewProduct from "./NewProduct";

class Product extends Component {
  constructor() {
    super();
    this.state = {
      product: []
    };
    this.onClick = this.onClick.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
  }
  onClick(e, retailer, product_id) {
    e.preventDefault();
    console.log(retailer, product_id);
    deleteProduct(retailer, product_id).catch(err => console.log(err.response));
  }

  onSubmit(e) {
    e.preventDefault();
    this.setState({ retailer: e.target.value });
  }

  componentDidMount() {
    getProduct()
      .then(data => {
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
          <td className="text-center">{p.retailer}</td>
          <td
            onClick={() =>
              this.props.history.push(`/comment/${p.retailer}/${id}`)
            }
          >
            <a className="text-center" href="">
              {p.title}
            </a>
          </td>
          <td className="text-center">
            <font color="green">{p.price}</font>
          </td>
          <td>
            <a href={p.url}>{p.url}</a>
          </td>
          <td className="text-center">
            <font color="red">{p.desired_price}</font>
          </td>
          <th className="text-center">
            <form onSubmit={this.onSubmit}>
              <button
                className="btn btn-danger"
                onClick={e => {
                  this.onClick(e, p.retailer, p.id);
                }}
              >
                Remove
              </button>
            </form>
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
        <table className="fixed_header mx-auto">
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
