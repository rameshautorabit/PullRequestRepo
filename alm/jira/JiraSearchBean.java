/**
 * 
 */
package com.rabit.alm.jira;

/**
 * @author sampath.c
 *
 */
public class JiraSearchBean {
	
	private String jql;

    private String startAt;

    private String maxResults;

    private String[] fields = new String[]{
    		"summary",
    		"description",
    		"issuetype",
    		"priority",
    		"status",
    		"assignee",
    		"project",
    		"reporter"};

    public String getJql () {
        return jql;
    }

    public void setJql (String jql) {
        this.jql = jql;
    }

    public String getStartAt () {
        return startAt;
    }

    public void setStartAt (String startAt) {
        this.startAt = startAt;
    }

    public String getMaxResults () {
        return maxResults;
    }

    public void setMaxResults (String maxResults) {
        this.maxResults = maxResults;
    }

    public String[] getFields () {
        return fields;
    }

    public void setFields (String[] fields) {
        this.fields = fields;
    }

    @Override
    public String toString() {
        return "ClassPojo [jql = "+jql+", startAt = "+startAt+", maxResults = "+maxResults+", fields = "+fields+"]";
    }

}
