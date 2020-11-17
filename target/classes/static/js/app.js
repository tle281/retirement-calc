
var app = angular.module("appManager" , []);

app.controller("appController" , function($scope, $http){
	
	$scope.users = [];
	$scope.userForm = {
			id : -1,
			name : "",
			phone : ""			
	};
	
	$scope.getClass = function(user){
			return 'red';
		
	}
	
	_refreshUserData();
	
	function _refreshUserData(){
		
		 $http({
             method : 'GET',
             url : 'http://localhost:8080/users/getAllUsers'
         }).then(function successCallback(response) {
             $scope.users = response.data;
             
         }, function errorCallback(response) {
             console.log(response.statusText);
         });
	}
	
	$scope.submitUser = function() {
        
        var method = "";
        var url = "";
        if ($scope.userForm.id == -1) {
            //Id is absent in form data, it is create new user operation
            method = "POST";
            url = '/users/addUser';
        } else {
            //Id is present in form data, it is edit user operation
            method = "PUT";
            url = '/users/updateUser';
        }

        $http({
            method : method,
            url : url,
            data : angular.toJson($scope.userForm),
            headers : {
                'Content-Type' : 'application/json'
            }
        }).then( _success, _error );
    };
	
    $scope.deleteUser = function(user) {
        $http({
            method : 'DELETE',
            url : '/users/deleteUser/' + user.id
        }).then(_success, _error);
    };

    $scope.editUser = function(user) {
      
        $scope.userForm.name = user.name;
        $scope.userForm.phone = user.phone;
        $scope.userForm.id = user.id;
    };
    
    
    $scope.calculate = function() {
		var periodBefore = $scope.retireAge - $scope.age; 
		var monthlySal = $scope.salary / 12;
		var percentage = $scope.monthlySav / monthlySal * 100;  
		var payment = $scope.monthlySav * 12; 
		var FV = payment * [(Math.pow(1.06, periodBefore) - 1) / 0.06];
		
		var periodAfter = $scope.endingAge - $scope.retireAge;
		var PV = $scope.withdrawal * [(1 - Math.pow(1.05, -Math.abs(periodAfter))) / 0.05]; 
		
		$scope.show = false;
		$scope.percent = percentage.toFixed(0); 
		$scope.realisticAmount = FV.toFixed(0); 
		$scope.expectedAmount = PV.toFixed(0);
		$scope.compare = ($scope.realisticAmount / $scope.expectedAmount * 100).toFixed(0);
		
};
    
    
    function _success(response) {
    	//alert("success");
    	_refreshUserData();
        _clearFormData();
    }

    function _error(response) {
    	//alert("error");
    	console.log(response.statusText);
    }

    //Clear the form
    function _clearFormData() {
        $scope.userForm.id = -1;
        $scope.userForm.name = "";
        $scope.userForm.phone = "";
    
    };
});
