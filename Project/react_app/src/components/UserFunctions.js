import axios from "axios";
import Cookies from "universal-cookie";

const cookie = new Cookies();

export const register = newUser => {
  return axios
    .post("/api/register", {
      username: newUser.username,
      email: newUser.email,
      password: newUser.password
    })
    .then(response => {
      console.log(response.data);
    })
    .catch(err => {
      console.log(err.response);
    });
};

export const login = user => {
  return axios
    .post("/api/login", {
      userid: user.userid,
      password: user.password
    })
    .then(response => {
      if (response.status === 200) {
        return response.data;
      }
    });
};

export const addProduct = async (url, price) => {
  return await axios.post(
    "/api/product",
    {
      url: url,
      price: price
    },
    {
      headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` },
      withCredentials: true
    }
  );
};

export const getProfile = async () => {
  const response = await axios.get("/api/user", {
    headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` },
    withCredentials: true
  });
  return response.data;
};

export const deleteEmail = async email => {
  const response = await axios.delete(
    "/api/user/email",
    {
      email: email
    },
    {
      headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` },
      withCredentials: true
    }
  );
};

export const getProduct = async () => {
  const response = await axios.get("/api/product", {
    headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` },
    withCredentials: true
  });
  return await response.data;
};

export const getComment = async (retailer, id) => {
  const response = await axios.get(`/api/comment/${retailer}/${id}`);
  return await response.data;
};

export const postComment = async (comment, retailer, id) => {
  const response = await axios.post(
    "/api/comment",
    {
      comment: comment,
      retailer: retailer,
      product_id: id
    },
    {
      headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` },
      withCredentials: true
    }
  );
  return response;
};

export const getAnnounce = async () => {
  const response = await axios.get(`/api/announcement`);
  return await response.data;
};

export const logout = async () => {
  const response = await axios.delete("/api/revoke", {
    withCredentials: true
  });
  return await response.data;
};
