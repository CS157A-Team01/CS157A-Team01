import React, { Component } from "react";
import { getComment, postComment, getCurrentProduct } from "./UserFunctions";
import { Button, Comment, Form, Header, TableBody } from "semantic-ui-react";
import axios from "axios";
import Cookies from "universal-cookie";

const cookie = new Cookies();
class Comments extends Component {
  constructor(props) {
    super(props);
    this.state = {
      retailer: props.match.params.retailer,
      id: props.match.params.id,
      comment: [],
      text: "",
      price: "",
      product: []
    };
    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
    this.handleUpdate = this.handleUpdate.bind(this);
    this.handleonChange = this.handleonChange.bind(this);
  }
  componentDidMount() {
    getComment(this.state.retailer, this.state.id)
      .then(data => {
        this.setState({
          comment: data
        });
      })
      .catch(err => {
        console.log(err.response.data);
      });
    getCurrentProduct(this.state.retailer, this.state.id)
      .then(data => {
        this.setState({
          product: data
        });
      })
      .catch(err => {
        console.log(err.response.data);
      });
  }

  onChange(e) {
    this.setState({ text: e.target.value });
  }

  onSubmit(e) {
    e.preventDefault();
    postComment(
      this.state.text,
      this.state.retailer,
      this.state.id
    ).catch(err => console.log(err.response));
  }

  handleonChange(e) {
    this.setState({ [e.target.name]: e.target.value });
  }

  handleUpdate() {
    if (this.state.price !== "") {
      axios
        .put(
          "/api/product",
          {
            retailer: this.state.retailer,
            product_id: this.state.id,
            price: this.state.price
          },
          { headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` } }
        )
        .catch(err => console.log(err.response));
    }
  }

  render() {
    const rows = [];
    for (let i = 0; i < this.state.comment.length; i++) {
      const p = this.state.comment[i];
      const jsx = (
        <Comment.Group>
          <Comment>
            <Comment.Content>
              <Comment.Author as="a">{p.username}</Comment.Author>
              <Comment.Metadata>
                <div>{p.date}M</div>
              </Comment.Metadata>
              <Comment.Text>{p.comment}</Comment.Text>
            </Comment.Content>
          </Comment>
        </Comment.Group>
      );
      rows.push(jsx);
    }

    const datas = [];
    for (let j = 0; j < this.state.product.length; j++) {
      const k = this.state.product[j];
      const body = (
        <tr>
          <td claaName="text-center">{k.retailer}</td>
        </tr>
      );
      datas.push(body);
    }

    return (
      <div className="container">
        <div className="row">
          <div className="col-6">
            <table>
              <TableBody>
                <tr>
                  <th className="text-center">Retailer</th>
                  <th className="text-center">Title</th>
                  <th className="text-center">Price</th>
                  <th className="text-center">Desired Price</th>
                  <th className="text-center">New Desired Price</th>
                  <th className="text-center">Update</th>
                </tr>
                <tr>
                  <td className="text-center">{this.state.product.retailer}</td>
                  <td className="text-center">{this.state.product.title}</td>
                  <td className="text-center">{this.state.product.price}</td>
                  <td className="text-center">
                    {this.state.product.desired_price}
                  </td>
                  <td className="text-center">
                    <div class="form-group row">
                      <div class="col-xs-1">
                        <input
                          class="form-control"
                          name="price"
                          type="text"
                          value={this.state.price}
                          onChange={this.handleonChange}
                        ></input>
                      </div>
                    </div>
                  </td>
                  <td className="text-center">
                    <button
                      className="btn btn-danger"
                      onClick={this.handleUpdate}
                    >
                      update
                    </button>
                  </td>{" "}
                </tr>
              </TableBody>
            </table>
          </div>
          <div className="col-6">
            <Header as="h3" dividing>
              Comments
            </Header>
            {rows}
            <Form reply onSubmit={this.onSubmit}>
              <Form.TextArea onChange={this.onChange} />
              <Button
                content="Add Comment"
                labelPosition="left"
                icon="edit"
                primary
                onSubmit=""
              />
            </Form>
          </div>
        </div>
      </div>
    );
  }
}

export default Comments;
