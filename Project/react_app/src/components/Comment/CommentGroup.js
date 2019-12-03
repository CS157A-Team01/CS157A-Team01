import axios from "axios";
import CommentAdd from "./CommendAdd";
import Comment from "./Comment";
import { Component } from "react";

class CommentGroup extends Component {
  constructor(props) {
    this.state = {
      id: "",
      body: ""
    };
  }
  handleCommentSubmit(data) {
    const postData = {
      comment: data
    };
    axios.post("/api/comment/save", postData).then(response => {
      console.log("response", response.data);
    });
  }

  renderComment() {
    const { comments } = this.state;
    return comments.map(comment => {
      const { id, body } = comment;
      return (
        <div className="comment" key={id}>
          {body}
        </div>
      );
    });
  }

  render() {
    <div>
      {this.renderComment()}
      <CommentAdd handleCommentSubmit={this.handleCommentSubmit} />
    </div>;
  }
}
