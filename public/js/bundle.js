/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports) {

	// Generated by CoffeeScript 1.11.1
	(function() {
	  var vm;

	  vm = new Vue({
	    el: "#wrapTodos",
	    mounted: function() {
	      return this.$http.get('/api/tasks/get').then(function(response) {
	        return this.tasks = response.body.data;
	      }, function(response) {
	        return console.log(response);
	      });
	    },
	    data: {
	      newTask: "",
	      tasks: []
	    },
	    methods: {
	      add: function() {
	        var nt, t;
	        nt = this.newTask.trim();
	        if (!nt) {
	          return;
	        }
	        t = {
	          title: nt,
	          completed: false
	        };
	        this.$http.post('/api/tasks/post', t).then(function(response) {
	          return this.tasks.push(response.body);
	        }, function(response) {
	          return console.log(response);
	        });
	        return this.newTask = "";
	      },
	      toggleComplete: function(index) {
	        var b, t;
	        b = !this.tasks[index].completed;
	        t = Object.assign({}, this.tasks[index], {
	          completed: b
	        });
	        return this.$http.patch('/api/tasks/update', t).then(function() {
	          return this.tasks[index].completed = b;
	        }, function(response) {
	          return console.log(response);
	        });
	      },
	      deleteTask: function(index) {
	        var t;
	        t = Object.assign({}, this.tasks[index]);
	        if (confirm("「" + t.title + "」　を削除してよろしいですか？")) {
	          return this.$http["delete"]('/api/tasks/delete', t).then(function() {
	            return this.tasks.splice(index, 1);
	          }, function(response) {
	            return console.log(response);
	          });
	        }
	      }
	    }
	  });

	}).call(this);

	//# sourceMappingURL=task.js.map


/***/ }
/******/ ]);