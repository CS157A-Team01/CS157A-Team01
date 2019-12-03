import React, { Component } from "react";
import { getComment, postComment } from "./UserFunctions";
import { Button, Comment, Form, Header, TableBody } from "semantic-ui-react";
import { text } from "@fortawesome/fontawesome";

class Comments extends Component {
  constructor(props) {
    super(props);
    this.state = {
      retailer: "",
      id: "",
      retailer: props.match.params.retailer,
      id: props.match.params.id,
      comment: [],
      text: ""
    };
    this.onChange = this.onChange.bind(this);
    this.onSubmit = this.onSubmit.bind(this);
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
    // TODO: make component refresh right after submit
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

    return (
      <div className="container">
        <div className="row">
          <div className="col-6">
            <table>
              <TableBody>
                <td>Product Info Goes Here</td>
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
