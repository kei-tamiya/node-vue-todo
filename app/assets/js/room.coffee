socket = io();

Vue.component('room-item', {
  template: '\
    <div>\
      <p class="hiddenRoomId" hidden>{{  room._id }}</p>\
      <h2>\
        <a class="roomIdLinkTarget">\
            {{ room.name }}\
        </a>\
        <span class="pull-right">\
            <input class="btn" type="button" v-on:click="$emit(\'delete-room\')" value="x" />\
        </span>\
    </div>\
  ',
  props: ['room']
})

rvm = new Vue
  el: "#wrapRooms",
  mounted: ->
    this.$http.get('/api/rooms/get')
      .then (response) ->
        this.rooms = response.body.data
      ,(response) ->
        console.log response
  data: {
    newRoom: "",
    rooms: []
  },
  methods: {
    addRoom: ->
      nr = this.newRoom.trim()
      if (!nr) then return
      r = {
        name: nr
      }
      this.$http.post('/api/rooms/post', r)
        .then (response) ->
          socket.emit 'addRoom', response.body
        ,(response) ->
          console.log response
      this.newRoom = ""

    deleteRoom: (index) ->
      r = Object.assign {}, this.rooms[index]
      if (confirm("「#{r.name}」　を削除してよろしいですか？"))
        this.$http.delete("/api/rooms/delete", { body: r })
          .then ->
            socket.emit 'deleteRoom', index
          , (response) ->
            console.log response
  }

addRoomLink = (speed) ->
  setTimeout( ->
    $('.hiddenRoomId').each( ->
      $(this).siblings('h2').find('a.roomIdLinkTarget').attr('href', "rooms/" + $(this).text())
    )
  , speed)

addRoomLink(1000)

socket.on 'addRoom', (room) ->
  rvm.rooms.push(room)
  addRoomLink(1000)

socket.on 'deleteRoom', (index) ->
  rvm.rooms.splice(index, 1)