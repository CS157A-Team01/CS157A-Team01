import React, { setState, useState } from "react";

function CommentAdd(props) {
  const { handleCommentSubmit } = props;

  const [comment, setComment] = useState("");

  return (
    <div>
      <div className="card mt-4 mb-3">
        <div className="card-header">Comment</div>
        <div className="card-body">
          <textarea
            name="comment"
            className="form-control"
            placeholder="Add a Comments"
            onchange={event => setComment(event.target.valuse)}
            value={commnet}
          ></textarea>
        </div>
      </div>
      <div>
        <button
          className="btn btn-primary mr-3"
          onClick={event => {
            handleCommentSubmit(commnet);
            setComment("");
          }}
        ></button>
      </div>
    </div>
  );
}

export default CommentAdd;
