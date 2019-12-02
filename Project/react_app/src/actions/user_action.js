import axios from "axios";
import {
  LOGIN_USER,
  REGISTER_USER,
  AUTH_USER,
  LOGOUT_USER,
  UPDATE_DATA_USER,
  CLEAR_UPDATE_USER_DATA
} from "./types";

export function registerUser(dataToSubmit) {
  const request = axios
    .post("/api/register", dataToSubmit)
    .then(respose => respose.data);
  return {
    type: REGISTER_USER,
    payload: request
  };
}

export function loginUser(dataToSubmit) {
  const request = axios
    .post("/api/login", dataToSubmit)
    .then(response => response.data);

  return {
    type: LOGIN_USER,
    payload: request
  };
}

export function auth() {
  const request = axios.get("/api/user").then(response => response.data);
  return {
    type: AUTH_USER,
    payload: request
  };
}

export function logoutUser() {
  const request = axios.get("/api/logout").then(response => response.data);

  return {
    type: LOGOUT_USER,
    payload: request
  };
}

export function updateUserData(dataToSubmit) {
  const request = axios
    .post(`api/update_profile`, dataToSubmit)
    .then(response => {
      return response.data;
    });

  return {
    type: UPDATE_DATA_USER,
    payload: request
  };
}

export function clearUpdateUser() {
  return {
    type: CLEAR_UPDATE_USER_DATA,
    payload: ""
  };
}
