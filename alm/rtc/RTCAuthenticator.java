/**
 * 
 */
package com.rabit.alm.rtc;

import org.eclipse.core.runtime.IProgressMonitor;

import com.ibm.team.repository.client.ILoginHandler2;
import com.ibm.team.repository.client.ILoginInfo2;
import com.ibm.team.repository.client.ITeamRepository;
import com.ibm.team.repository.client.TeamPlatform;
import com.ibm.team.repository.client.login.UsernameAndPasswordLoginInfo;
import com.ibm.team.repository.common.TeamRepositoryException;
import com.sforce.ws.types.Time;

/**
 * @author sreenivasrao.m
 *
 */
public class RTCAuthenticator {
	
	public static void startRTCClient(){
		if (!TeamPlatform.isStarted()) {
			TeamPlatform.startup();
		}
	}
	
	public static ITeamRepository login(IProgressMonitor monitor, String rtcURL, final String user, final String pass) throws TeamRepositoryException {
        ITeamRepository repository = TeamPlatform.getTeamRepositoryService().getTeamRepository(rtcURL);
        repository.registerLoginHandler(new ILoginHandler2() {
			public ILoginInfo2 challenge(ITeamRepository repository) {
				return new UsernameAndPasswordLoginInfo(user, pass);
			}
		});
        long startTime = System.currentTimeMillis();
        monitor.subTask("Connecting " + repository.getRepositoryURI() + "...");
        repository.login(monitor);
        monitor.subTask("Time Taken to connect to IBM RTC::"+ new Time(System.currentTimeMillis()-startTime));
        monitor.subTask("Connected");
        return repository;
    }
	
	public static void stopRTCClient(){
		if (TeamPlatform.isStarted()) {
			TeamPlatform.shutdown();
		}
	}

}
