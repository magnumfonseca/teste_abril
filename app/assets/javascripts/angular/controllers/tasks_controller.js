var myApp = angular.module('scheduler', ['ngRoute', 'ngResource']);

myApp.config([
		'$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
			$routeProvider.when('/tasks',{
				templateUrl: '/templates/tasks/index.html',
				controller: 'TasksCtrl'
			});
			$routeProvider.otherwise({
				redirectTo: '/tasks'
			});
		}
]);

myApp.controller("TasksCtrl", ['$scope', '$resource', '$location', '$http',
		function($scope, $resource, $location, $http) {
			function getTasks() {
				$http({
					method: 'GET',
					url: 'api/v1/tasks'
				})
				.success(function(data) {
					$scope.tasks = data.tasks
				});
			}

			getTasks();

			$scope.task = '';
			$scope.tasks = [];
			$scope.saveTask = function() {
				$http({
					method: 'POST',
					url: '/api/v1/tasks/',
					data: {task: $scope.task}
				})
				.success(function(data) {
					$scope.task ='';
					getTasks();
				});
			}
		}]);

