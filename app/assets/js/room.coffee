vm = new Vue
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
          this.rooms.push(response.body)
        ,(response) ->
          console.log response
      this.newRoom = ""

    deleteRoom: (index) ->
      r = Object.assign {}, this.rooms[index]
      if (confirm("「#{r.name}」　を削除してよろしいですか？"))
        this.$http.delete("/api/rooms/delete/#{r._id}")
          .then ->
            this.rooms.splice(index, 1)
          , (response) ->
            console.log response
  }

$ ->
  setTimeout( ->
    console.log $('.hiddenRoomId').siblings('h2').find('a.roomIdLinkTarget').attr('href', "rooms/" + $('.rooms').children('.hiddenRoomId').text())
  , 1000)
  setRoomLink = ->
    $('.hiddenRoomId').siblings('h2').find('a.roomIdLinkTarget').attr('hred', $('.hiddenRoomId').text())
