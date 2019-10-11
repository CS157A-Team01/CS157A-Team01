import axios from 'axios'

export const register = newUser => {
  return axios
    .post('http://localhost:5000/api/register', {
      username: newUser.username,
      email: newUser.email,
      password: newUser.password
    })
    .then(response => {
      console.log('Registered')
    })
}

export const login = user => {
  return axios
    .post('http://localhost:5000/api/login', {
      userid: user.userid,
      password: user.password
    })
    .then(response => {
      localStorage.setItem('usertoken', response.data)
      return response.data
    })
    .catch(err => {
      console.log(err.response)
        console.log(user.password)
        console.log(user.userid)
    })
}

export const getProfile = user => {
  return axios
    .get('api/profile', {
      //headers: { Authorization: `Bearer ${this.getToken()}` }
    })
    .then(response => {
      console.log(response)
      return response.data
    })
    .catch(err => {
      console.log(err)
    })
}