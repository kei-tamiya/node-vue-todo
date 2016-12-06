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
      nt = this.newRoom.trim()
      if (!nt) then return
      t = {
        title: nt,
        completed: false
      }
      this.$http.post('/api/rooms/post', t)
        .then (response) ->
          this.rooms.push(response.body)
        ,(response) ->
          console.log response
      this.newRoom = ""

    deleteRoom: (index) ->
      t = Object.assign {}, this.rooms[index]
      if (confirm("「#{t.title}」　を削除してよろしいですか？"))
        this.$http.delete('/api/rooms/delete', t)
          .then ->
            this.rooms.splice(index, 1)
          , (response) ->
            console.log response
  }
