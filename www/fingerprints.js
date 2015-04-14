/*globals cordova, module*/
var Fingerprints = function() {};

Fingerprints.prototype.iovation = function(successCallback, failureCallback) {
    cordova.exec(successCallback, failureCallback, 'Fingerprints', 'iovation');
};

Fingerprints.prototype.threatmetrix = function(orgId, sessionId, successCallback, failureCallback) {
    cordova.exec(successCallback, failureCallback, 'Fingerprints', 'threatmetrix', [orgId, sessionId]);
};

module.exports = new Fingerprints();
