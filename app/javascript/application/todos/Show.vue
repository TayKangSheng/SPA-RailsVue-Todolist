<template lang="html">
    <main-layout>
      <h2>Todo {{ todo.id }}</h2>

      <div v-if="!editMode" class="row">
        <h3>{{ todo.text }}</h3>
        <a class="btn btn-default" href="/todos">Back</a>
        <button class="btn btn-warning" @click="editMode = true">Edit</button>
      </div>
      <div v-else class="row">
        <input v-model="todo.text" type="text" class="well col-xs-12 col-md-12" autofocus>
        <button class="btn btn-success" @click="updateTodo">Save</button>
      </div>

    </main-layout>
</template>

<script>
import MainLayout from '../layouts/Main.vue'
export default {
  props: ['id'],
  data: function(){
    return {
      todo : {},
      flash: "",
      editMode : false
    }
  },
  components: {
    MainLayout
  },
  mounted: function(){
    var self = this
    $.ajax(`/api/todos/${self.id}`, {
      type: 'GET',
      context: this,
      dataType: "json"
    }).done(function(data){
      this.todo = data
    })
  },
  methods: {
    updateTodo: function(){
      console.log('updateTodo')
      var self = this
      $.ajax(`/api/todos/${self.id}`, {
        method: 'PUT',
        data: {
          todo: self.todo
        },
        context: this,
        dataType: "json"
      }).done(function(data){
        console.log('done')
        this.editMode = false
      }).fail(function(data){
        console.log(data)
      })
    }
  }
}
</script>

<style lang="css">
</style>
