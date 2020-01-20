/**
 * 
 */
package com.rabit.alm.rtc;

import org.apache.log4j.Logger;
import org.eclipse.core.runtime.IProgressMonitor;

/**
 * @author sreenivasrao.m
 *
 */
public class LogProgressMonitor implements IProgressMonitor {
	
	private static final Logger LOG = Logger.getLogger(LogProgressMonitor.class);
	
	private boolean cancelled;
    private String taskName;

	/* (non-Javadoc)
	 * @see org.eclipse.core.runtime.IProgressMonitor#beginTask(java.lang.String, int)
	 */
	@Override
	public void beginTask(String name, int totalWork) {
		if (name != null && !"".equals(name.trim())) {
            setTaskName(name);
        }
	}

	/* (non-Javadoc)
	 * @see org.eclipse.core.runtime.IProgressMonitor#done()
	 */
	@Override
	public void done() {
		if (taskName != null) {
            LOG.info(taskName + " [DONE]");
        }
        taskName = "";
	}

	/* (non-Javadoc)
	 * @see org.eclipse.core.runtime.IProgressMonitor#internalWorked(double)
	 */
	@Override
	public void internalWorked(double arg0) {
		
	}

	/* (non-Javadoc)
	 * @see org.eclipse.core.runtime.IProgressMonitor#isCanceled()
	 */
	@Override
	public boolean isCanceled() {
        return cancelled;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.core.runtime.IProgressMonitor#setCanceled(boolean)
	 */
	@Override
	public void setCanceled(boolean cancelled) {
		 this.cancelled = cancelled;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.core.runtime.IProgressMonitor#setTaskName(java.lang.String)
	 */
	@Override
	public void setTaskName(String name) {
		this.taskName = name;
        cancelled = false;
        LOG.info(taskName);
	}

	/* (non-Javadoc)
	 * @see org.eclipse.core.runtime.IProgressMonitor#subTask(java.lang.String)
	 */
	@Override
	public void subTask(String name) {
		
	}

	/* (non-Javadoc)
	 * @see org.eclipse.core.runtime.IProgressMonitor#worked(int)
	 */
	@Override
	public void worked(int i) {
		LOG.debug(taskName + "["+i+"]");
	}

}
