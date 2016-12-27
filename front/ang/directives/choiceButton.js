(function() {

  angular.module('skilly').controller('ChoiceButtonController', function() {
    var ctrl = this;

    ctrl.width = 50;
    ctrl.radius = 10;
    ctrl.currentWeight = 0;
    ctrl.animationDuration = 250;
    ctrl.ctx = document.getElementById("bouton-choix-rech").getContext("2d");

    ctrl.drawFrame = function() {
      ctrl.ctx.beginPath();
      ctrl.ctx.moveTo(1 + ctrl.radius, 1);
      ctrl.ctx.lineTo(ctrl.width - ctrl.radius + 1, 1);
      ctrl.ctx.arc(ctrl.width - ctrl.radius + 1, ctrl.radius + 1, ctrl.radius, 1.5 * Math.PI, 0.5 * Math.PI);
      ctrl.ctx.lineTo(1 + ctrl.radius, 2 * ctrl.radius + 1);
      ctrl.ctx.arc(ctrl.radius + 1, ctrl.radius + 1, ctrl.radius, 0.5 * Math.PI, 1.5 * Math.PI);
      ctrl.ctx.fillStyle = "#d2d7d3";
      ctrl.ctx.fill();

      ctrl.ctx.beginPath();
      ctrl.ctx.moveTo(1 + ctrl.radius, 1);
      ctrl.ctx.lineTo(ctrl.width - ctrl.radius + 1, 1);
      ctrl.ctx.arc(ctrl.width - ctrl.radius + 1, ctrl.radius + 1, ctrl.radius, 1.5 * Math.PI, 0.5 * Math.PI);
      ctrl.ctx.lineTo(1 + ctrl.radius, 2 * ctrl.radius + 1);
      ctrl.ctx.arc(ctrl.radius + 1, ctrl.radius + 1, ctrl.radius, 0.5 * Math.PI, 1.5 * Math.PI);
      ctrl.ctx.stroke();
    };

    ctrl.drawCircle = function(weight) {
      var x = ctrl.radius + 1 + weight * (ctrl.width - 2 * ctrl.radius);
      var y = ctrl.radius + 1;
      ctrl.ctx.beginPath();
      ctrl.ctx.moveTo(x + ctrl.radius, y);
      ctrl.ctx.arc(x, y, ctrl.radius, 0, 2 * Math.PI);
      ctrl.ctx.fillStyle = "white";
      ctrl.ctx.fill();
      ctrl.ctx.beginPath();
      ctrl.ctx.moveTo(x + ctrl.radius, y);
      ctrl.ctx.arc(x, y, ctrl.radius, 0, 2 * Math.PI);
      ctrl.ctx.stroke();
    };

    ctrl.drawButton = function(weight) {
      ctrl.drawFrame();
      ctrl.drawCircle(weight);
    };

    ctrl.toggleAux = function(time, destination) {
      if (time <= ctrl.animationDuration) {
        var stepWeight = time / ctrl.animationDuration;
        if (destination === 0) {
          stepWeight = 1 - stepWeight;
        }
        ctrl.drawButton(stepWeight);
        setTimeout(function() {
          ctrl.toggleAux(time + 10, destination)
        }, 10);
      }
    };

    ctrl.toggleButton = function() {
      if (ctrl.currentWeight === 0) {
        ctrl.currentWeight = 1;
        ctrl.toggleAux(0, 1);
      } else {
        ctrl.currentWeight = 0;
        ctrl.toggleAux(0, 0);
      }
    };
    
    ctrl.drawButton(ctrl.currentWeight);
  });
  
  angular.module('skilly').directive('choiceButton', [function() {
    return {
      restrict: 'E',
      templateUrl: "/ang/directives/templates/choiceButton.html",
      controller: "ChoiceButtonController",
      controllerAs: "choiceButtonCtrl",
    };
  }]);
})();