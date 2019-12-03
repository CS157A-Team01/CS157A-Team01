import React, { Component } from "react";
import { Comment } from "semantic-ui-react";
import { getAnnounce } from "./UserFunctions";

class Announcement extends Component {
  constructor() {
    super();
    this.state = {
      announce: []
    };
  }

  componentDidMount() {
    getAnnounce()
      .then(data => {
        this.setState({
          announce: data
        });
      })
      .catch(err => {
        console.log(err.response.data);
      });
  }
  render() {
    const rows = [];
    for (let i = 0; i < this.state.announce.length; i++) {
      const p = this.state.announce[i];
      const jsx = (
        <Comment.Group>
          <Comment>
            <Comment.Content>
              <Comment.Author as="a">{p.title}</Comment.Author>
              <Comment.Metadata>
                <div>{p.time}M</div>
              </Comment.Metadata>
              <Comment.Text>{p.body}</Comment.Text>
            </Comment.Content>
          </Comment>
        </Comment.Group>
      );
      rows.push(jsx);
    }
    return <div>{rows}</div>;
  }
}

export default Announcement;
