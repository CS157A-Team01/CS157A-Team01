import axios from 'axios'
import Cookies from 'universal-cookie';

const cookie = new Cookies()

export const register = newUser => {
  return axios
    .post('/api/register', {
      username: newUser.username,
      email: newUser.email,
      password: newUser.password
    })
    .then(response => {
      console.log(response.data)
    })
    .catch(err => {
      console.log(err.response)
    })
}

export const login = user => {
  return axios
    .post('/api/login', {
      userid: user.userid,
      password: user.password
    })
    .then(response => {
      if (response.status === 200) {
        return response.data
      }
    })
}

export const getProfile = async () => {
  const response = await axios
    .get('/api/user', {
      headers: { "X-CSRF-TOKEN": `${cookie.get("csrf_access_token")}` },
      withCredentials: true
    });
  return response.data;
}

export const logout = async () => {
  const resp = await axios.delete('/api/revoke', {
    withCredentials: true
  });
  return resp.data;
}