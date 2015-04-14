
package com.tigerfinancial.fingerprints;

import org.json.JSONArray;
import org.json.JSONException;

import android.content.Context;
import android.os.PowerManager;
import android.util.Log;

import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;

import com.iovation.mobile.android.DevicePrint;

/**
 * Plugin class which does the actual handling
 */
public class Fingerprints extends CordovaPlugin {

	@Override
	public boolean execute(String action, JSONArray args,	CallbackContext callbackContext) throws JSONException {

		PluginResult result = null;

		try {
			if( action.equals("iovation") ) {
					String iovation = DevicePrint.ioBegin(getApplicationContext());
					result = new PluginResult(PluginResult.Status.OK, iovation);
			}
			else if ( action.equals("threatmetrix") ) {
				TrustDefenderMobile profile = new TrustDefenderMobile((String)args.get(0));
				profile.doProfileRequest(new ProfilingOptions().setSessionID((String)args.get(1)));
				result = new PluginResult(PluginResult.Status.OK);
			}
		}
		catch( JSONException e ) {
			result = new PluginResult(Status.JSON_EXCEPTION, e.getMessage());
		}

		callbackContext.sendPluginResult(result);
		return true;
	}

}
