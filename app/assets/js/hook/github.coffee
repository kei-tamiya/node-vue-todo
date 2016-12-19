socket = io();

Vue.component('github-issue', {
  template: '\
    <div>\
      <h2>\
        {{ issue.title }}\
    </div>\
  ',
  props: ['issue']
})

Vue.component('github-issue-comment', {
  template: '\
    <div>\
      <h2>\
        {{ comment.title }}\
    </div>\
  ',
  props: ['comment']
})

g_i_vm = new Vue
  el: "#wrapGithubIssues",
  mounted: ->
    this.$http.get("/api/rooms/#{$('#roomId').text()}/github/issue/get")
      .then (response) ->
        this.issues = response.body.data
      ,(response) ->
        console.log response
  data: {
    issues: []
  }

g_i_c_vm = new Vue
  el: "#wrapGithubIssueComments",
  mounted: ->
    this.$http.get("/api/rooms/#{$('#roomId').text()}/github/issue_comment/get")
      .then (response) ->
        this.comments = response.body.data
      ,(response) ->
        console.log response
  data: {
    comments: []
  }
