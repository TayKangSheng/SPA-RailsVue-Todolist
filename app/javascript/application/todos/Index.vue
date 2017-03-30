<template lang="html">
  <main-layout>
    <h1>Todos<button v-show="!newMode" @click="newMode = true" style="float: right;" class="btn btn-success">New</button>
    </h1>
    <div class="well" v-if="newMode">
      <form id="newTodo" action="/api/todos" method="post" v-on:submit.prevent="createTodo">
        <input type="text" name="todo[text]" placeholder="todo text">
        <br>
        <button type="button" v-on:click.prevent="createTodo" class="btn btn-success">Create</button>
        <button type="button" v-on:click.prevent="newMode = false" class="btn btn-danger">Cancel</button>
      </form>
    </div>
    <div class="well" v-for="todo in todolist">
      <h4>id: {{ todo.id }}</h4>
      <h2>{{ todo.text }}</h2>
      <a class="btn btn-default" v-bind:href="'/todos/'+todo.id">Show</a>
      <a class="btn btn-default" v-on:click="destroyTodo(todo.id)">Destroy</a>
    </div>
  </main-layout>
</template>

<script>
import MainLayout from '../layouts/Main.vue'
export default {
  created: function(){
    /* Do Ajax to /api/todos replace todolist here */
    $.ajax("/api/todos", {
      context: this,
      dataType: "json"
    }).done(function(data){
      this.todolist = data
    })
  },
  data: function(){
    return {
      todolist: [],
      newMode: false,
      flash: ''
    }
  },
  components: {
    MainLayout
  },
  methods: {
    destroyTodo: function(id){
      var self = this
      $.ajax(`/api/todos/${id}`, {
        method: 'DELETE',
        context: this,
        dataType: "json"
      }).done(function(data){
        self.todolist = self.todolist.filter(function(todo){
          return todo.id !== id
        })
      }).fail(function(data){
        console.log(data)
      })
    },
    createTodo: function(){
      var self = this
      $.ajax('/api/todos',{
        context: this,
        type: 'POST',
        data: $('form#newTodo').serialize()
      }).done(function(data){
        self.todolist.unshift(data)
        self.newMode = false
      })
    }
  }
}
</script>

<style lang="css">
</style>
