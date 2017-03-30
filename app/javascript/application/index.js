
/*
  There is a difference between importing and require.
  require can set it to a variable.
  import imports the library, but you got to use the variables inside the library
*/

import Vue from 'vue/dist/vue.esm'
const Routes = require('./routes.js')

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#app',
    data: {
      props: {},
      ViewComponent: { render: h => h('div', 'loading...') }
    },
    render: function (h) {
      return h(this.ViewComponent, { props: this.props })
    }
  })

  Object.keys(Routes).forEach(route => {
    const Component = require('./' + Routes[route] + '.vue')
    page(route, function (ctx) {
      app.props = ctx.params
      app.ViewComponent = Component
    })
  })

  page('*', () => app.ViewComponent = require('./static/404.vue'))
  page()
})
