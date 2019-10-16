import axios from 'axios'

export const register = newUser => {
  return axios
    .post('/api/register', {
      username: newUser.username,
      email: newUser.email,
      password: newUser.password
    })
    .then(response => {
      console.log('Registered')
    })
      .catch(err => {
          console.log(err)
      })
}

export const login = user => {
  return axios
    .post('/api/login', {
      userid: user.userid,
      password: user.password
    })
    .then(response => {
      localStorage.setItem('usertoken', response.data.access_token)
      return response.data
    })
    .catch(err => {
      console.log(err.response)
        console.log(user.password)
        console.log(user.userid)
    })
}

export const getProfile = () => {
  return axios
    .get('/api/user', {
      headers: { Authorization: `Bearer ${localStorage.getItem('usertoken')}` }
    })
    .then(response => {
      return response.data
    })
    .catch(err => {
      console.log(err.response.data)
    })
}