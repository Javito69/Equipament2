
<%@ page import="com.hp.itsm.ssp.beans.SdClientBean" %>
<%@ page import="com.hp.itsm.ssp.beans.SortCode" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecallHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecallEntitlement" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecall" %>
<%@ page import="com.hp.itsm.api.interfaces.IStatusServicecallHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IStatusServicecall" %>
<%@ page import="com.hp.itsm.api.interfaces.IServiceCallCategoryHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IServiceHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IService" %>
<%@ page import="com.hp.itsm.api.interfaces.IServiceCallCategory" %>
<%@ page import="com.hp.itsm.api.interfaces.IImpactHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IImpact" %>
<%@ page import="com.hp.itsm.api.interfaces.IPriorityHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IPriority" %>
<%@ page import="com.hp.itsm.api.interfaces.IConfigurationItemHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IConfigurationItem" %>
<%@ page import="com.hp.itsm.api.interfaces.IHistoryLineServicecallHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IAssignmentHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IAssignmentEntitlement" %>
<%@ page import="com.hp.itsm.api.interfaces.IAssignment" %>
<%@ page import="com.hp.itsm.api.interfaces.IWorkgroup" %>
<%@ page import="com.hp.itsm.api.interfaces.IPerson" %>
<%@ page import="com.hp.itsm.api.interfaces.IOrganization" %>
<%@ page import="java.text.Collator" %>
<%@ page import="java.util.Iterator" %>

<%@ page contentType="text/html; charset=ISO-8859-1" %>

<HTML>

<HEAD>
<LINK rel="stylesheet" type="text/css" href="sd-sp.css">

<%@ include file="client-funcs.js" %>
<%@ include file="assignment-funcs.js" %>
<%@ include file="caller-funcs.js" %>
<%@ include file="service-funcs.js" %>
<%@ include file="config-funcs.js" %>

<SCRIPT language = "JavaScript">

  function view_history(sc_oid) {

    window.open("ViewServicecallHistory.jsp?vSc=" + sc_oid, "HistoryView", "toolbar=no, scrollbars=yes");
  }

</SCRIPT>
</HEAD>

<BODY>

<%
  SdClientBean bean = (SdClientBean) session.getAttribute("sd-client-bean");

  response.setHeader("Cache-Control","no-cache");
  if (bean == null) {
%>
    <jsp:forward page="NoSessionError.jsp" />

<%
  }

%>

  <DIV class="headline"> <P> Petició en curs </P> </DIV>


<%
  final Collator collator = Collator.getInstance(bean.current_locale());

  String _sc = request.getParameter("vSc");
  Long sc_oid = null;
  IServicecallHome sc_hm = bean.sd_session().getServicecallHome();
  IHistoryLineServicecallHome his_hm = bean.sd_session().getHistoryLineServicecallHome();
  IServicecallEntitlement sc_ent = sc_hm.getServicecallEntitlement();
  IServicecall sc = null;
  String historySubject = "", historyInformation = "";
  boolean serviceEntitlement = true;

  if (_sc != null) sc_oid = new Long(_sc);

  if (sc_oid == null) {

    %> <%= bean.findLabel("SP_ObjectWhere") %> <%

  } else {

    try {

      if ("yes".equals(request.getParameter("vRetry"))) {
        /* re-use the old object */

        if (sc_oid != null) {
          sc = (IServicecall) bean.ot_remove(sc_oid);
          historySubject = request.getParameter("vHistorySubject");
          historyInformation = request.getParameter("vHistoryInformation");

          /* hack (2x) */
          if (historySubject == null) historySubject = "";
          if (historyInformation == null) historyInformation = "";
        }

        if (sc == null) {
          /* bad luck, open excisting object */
          sc = sc_hm.openServicecall(sc_oid);
          historySubject = "";
          historyInformation = "";
        }
      } else {
        /* open excisting object */
        sc = sc_hm.openServicecall(sc_oid);
        historySubject = "";
        historyInformation = "";
      }

      Long id = null;
      IStatusServicecallHome stat_hm = bean.sd_session().getStatusServicecallHome();
      IStatusServicecall status = null, states[] = stat_hm.findAllStatusServicecall();
      SortCode.sortIObject(states);
      String description = null;
      IServiceCallCategoryHome cat_hm = bean.sd_session().getServiceCallCategoryHome();
      IServiceCallCategory category = null, categories[] = cat_hm.findAllServiceCallCategory();
      SortCode.sortIObject(categories);
      IImpactHome imp_hm = bean.sd_session().getImpactHome();
      IImpact impact = null, impacts[] = imp_hm.findAllImpact();
      SortCode.sortIObject(impacts);
      IPriorityHome prio_hm = bean.sd_session().getPriorityHome();
      IPriority priority = null, priorities[] = prio_hm.findAllPriority();
      SortCode.sortIObject(priorities);
      Double regdate = null, deadline = null;

      IService service = null, services[] = null;
      String service_name = null;
      String _service_oid = "";
      IServiceHome service_hm;
      if (bean.getSLMmodule()) {
        try {
            service_hm = bean.sd_session().getServiceHome();
            service = sc.getService();
            if (service != null) {
                service_name = service.getName();
            }
        } catch (Throwable ignore) {
            serviceEntitlement = false;
        }
      } else {
          serviceEntitlement = false;
      }
      IConfigurationItemHome ci_hm = bean.sd_session().getConfigurationItemHome();
      IConfigurationItem ci = null;
      String ci_searchcode = null;
      String _configuration_oid = "";

      String information = null;
      String solution = null;
      IAssignmentHome ass_hm = bean.sd_session().getAssignmentHome();
      IAssignmentEntitlement ass_ent = ass_hm.getAssignmentEntitlement();
      IAssignment assignment = null;
      IWorkgroup ass_workgroup = null;
      String ass_workgroup_name = null;
      IPerson assignee_person = null;
      String assignee_person_name = null;
      String _assigned_wg_oid = "", _assigned_person_oid = "";
      IPerson caller_person = null;
      IOrganization caller_organization = null;
      String caller_person_name = null, caller_organization_name = null;
      String _caller_person_oid = "", _caller_organization_oid = "";
      Boolean _modify_allowed = sc.isModifyAllowed();
      boolean modify_allowed = _modify_allowed != null ? _modify_allowed.booleanValue() : false;

      boolean one_is_selected;

      try { id = sc.getID(); } catch (Throwable ignore) { ; }
      try { status = sc.getStatus(); } catch (Throwable ignore) { ; }
      try { description = sc.getDescription(); } catch (Throwable ignore) { ; }
      try { category = sc.getCategory(); } catch (Throwable ignore) { ; }
      try { impact = sc.getImpact(); } catch (Throwable ignore) { ; }
      try { priority = sc.getPriority(); } catch (Throwable ignore) { ; }
      try { regdate = sc.getRegistrationDate(); } catch (Throwable ignore) { ; }
      try { deadline = sc.getDeadline(); } catch (Throwable ignore) { ; }
      try { ci = sc.getConfigurationItem(); } catch (Throwable ignore) { ; }
      try { ci_searchcode = ci.getSearchcode(); } catch (Throwable ignore) { ; }
      try { information = sc.getInformation(); } catch (Throwable ignore) { ; }
      try { solution = sc.getSolution(); } catch (Throwable ignore) { ; }
      try { assignment = sc.getAssignment(); } catch (Throwable ignore) { ; }
      try { caller_person = sc.getCaller(); } catch (Throwable ignore) { ; }
      try { caller_organization = sc.getCallerOrganization(); } catch (Throwable ignore) { ; }

      if (assignment != null) {
        try {
          ass_workgroup = assignment.getAssWorkgroup();
          if (ass_workgroup != null) {
            ass_workgroup_name = ass_workgroup.getName();
            _assigned_wg_oid = ass_workgroup.oid().toString();
          }
        } catch (Throwable ignore) { ; }
        try {
          assignee_person = assignment.getAssigneePerson();
          if (assignee_person != null) {
            assignee_person_name = assignee_person.getName();
            _assigned_person_oid = assignee_person.oid().toString();
          }
        } catch (Throwable ignore) { ; }
      }

      if (caller_person != null) {
        try {
          caller_person_name = caller_person.getName();
          _caller_person_oid = caller_person.oid().toString();
        } catch (Throwable ignore) { ; }
      }
      if (caller_organization != null) {
        try {
          caller_organization_name = caller_organization.getName1();
          _caller_organization_oid = caller_organization.oid().toString();
        } catch (Throwable ignore) { ; }

      }

      %>
        <FORM name="edit_sc" action="SaveServiceCall.jsp?vSc=<%= sc.oid() %>" method="post" target="results" >
          <TABLE width="100%" frame="void" rules="groups" >
            <TR>
              <TD aling="center" >
                <%
                  if (sc_ent.isRequiredID()) {
                    %>
                      <B> La seva petició s'ha creat amb l'identificador <%= sc_hm.getLabelID() %> <%= id != null ? id.toString() : "" %></B>
                      <BR>
                    <%
                  } else {
                    %>
                      La seva petició s'ha creat amb l'identificador <%= sc_hm.getLabelID() %> <%= id != null ? id.toString() : "" %>
                      <BR>
                    <%
                  }
                %>
                </TABLE>
              </TD>
	   </TR>   
           <TABLE width="100%" frame="void" rules="groups" >
           <TR>
              <%
                if (modify_allowed && sc_ent.isModifyAllowedCaller() && /* HACK */ bean.is_specialist()) {
                  %>
                  <BR>
                  <BR>
                    <TD>
                      Destinatari
                    </TD>
                    <TD>
                      <%= caller_person_name != null ? SdClientBean.filter_html_string(caller_person_name) : "" %>
                    </TD>
                  <%
                } else {
                  %>
                  <BR>
                  <BR>
                    <TD>
                      Destinatari
                    </TD>
                    <TD>
                      <%= caller_person_name != null ? SdClientBean.filter_html_string(caller_person_name) : "" %>
                    </TD>
                  <%
                }
              %>
            </TR>
             <TR>
              <%
                if (modify_allowed && sc_ent.isModifyAllowedCallerOrganization() && /* HACK */ bean.is_specialist()) {
                  %>
                    <TD>
                    Servei
                    </TD>
                    <TD>
                      <%= caller_organization_name != null ? SdClientBean.filter_html_string(caller_organization_name) : "" %>
                    </TD>
                  <%
                } else {
                  %>
                    <TD>
                     Servei
                    </TD>
                    <TD>
                    <%= caller_organization_name != null ? SdClientBean.filter_html_string(caller_organization_name) : "" %>
                    </TD>
                  <%
                }
              %>
            </TR>
            <TR>
              <TD>
                <%
                  if (sc_ent.isRequiredDescription()) {
                    %>
                      <B> <%= sc_hm.getLabelDescription() %> </B>
                    <%
                  } else {
                    %>
                      <%= sc_hm.getLabelDescription() %>
                    <%
                  }
                %>
              </TD>
              <TD>
                <%
                  if ( modify_allowed && sc_ent.isModifyAllowedDescription() ) {
                    %>
                      <%= SdClientBean.filter_html_parameter(description) %>
                    <%
                  } else {
                    %>
                      <%= SdClientBean.filter_html_string(description) %>
                    <%
                  }
                %>
              </TD>
            </TR>
            <TR>
              <TD>
                <%
                  if (sc_ent.isRequiredRegistrationDate()) {
                    %>
                      <B> <%= sc_hm.getLabelRegistrationDate() %> </B>
                    <%
                  } else {
                    %>
                      <%= sc_hm.getLabelRegistrationDate() %>
                    <%
                  }
                %>
              </TD>
              <TD>
                <%= regdate != null ? bean.sd_date2java_local_date(regdate) : "" %>
              </TD>
            </TR>
             <TR>
              <TD>


              </TD>
            </TR>
            <TD>
      <INPUT type="button" onclick="location.href='http://servicedesk:8080/equipament2Jav/CreateServiceCall.jsp'" value="Realitzar una altra petició" >
            </TD>
      </TR>
      </TD>
      <TD>
      <TR>      
      </TD>
      </TR>
      </TABLE>
      <TR>
        <TD>
          <BR>
          <BR>
          Per a qualsevol consulta o suggeriment, podeu adrecar-vos a <A href="mailto:sgsi.22007@diba.cat" target=1 >sgsi.22007@diba.cat</A>
        </TD>
      </TR>
         </FORM>
      <%

    } catch (Throwable e) {

      %> <%= SdClientBean.filter_html_string(e.getMessage()) %>
      <%

    }
  }
%>


</BODY>
</HTML>