
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
<%@ page import="com.hp.itsm.api.interfaces.IClassificationSerHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IClassificationSer" %>
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
  //SdClientBean bean = (SdClientBean) session.getAttribute("sd-client-bean");
  
String loginname = "system";
String password = "servicedesk";
String servidor = "servicedesk";  
  
SdClientBean bean = null;
try {
	bean = new SdClientBean(servidor, loginname, password);
} catch (Throwable exc) {
	bean = null;
}

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
                /* hack (2x) */
                if (historySubject == null) historySubject = "";
                if (historyInformation == null) historyInformation = "";
            }
            if (sc == null) {
                /* bad luck, open excisting object */
                sc = sc_hm.openServicecall(sc_oid);
            }
        } else {
            /* open excisting object */
            sc = sc_hm.openServicecall(sc_oid);
        }
	  
        Long _sc_anterior_id = sc.getID();
        String _solucio = "ES relacionada amb la nº " + _sc_anterior_id + " d'Instal·lació";	  
	  
        SdClientBean bean3 = null;
        try {
           bean3 = new SdClientBean(servidor, loginname, password);
        } catch (Throwable exc) {
           bean3 = null;
        }
        IServicecallHome nueva_hm = bean3.sd_session().getServicecallHome();
        IServicecall nueva;
        nueva = (IServicecall) bean.ot_remove(sc_oid);
        sc_oid = new Long(_sc);
        nueva = bean3.create_new_service_call();
        bean3.ot_add(nueva);
        nueva.setCallerOrganization(sc.getCallerOrganization());
        nueva.setCaller(sc.getCaller());
        nueva.setScPerson1(sc.getScPerson1());
        nueva.setCategory(sc.getCategory());
        nueva.setService(sc.getService());
        nueva.setConfigurationItem(sc.getConfigurationItem());
        nueva.setInformation(sc.getInformation());
        nueva.setServicecallCode2(sc.getServicecallCode2());
        //XDG Modifica descripció
        nueva.setDescription(sc.getDescription().replaceAll("Instal·lació", "Retirada"));
        nueva.setInformation(sc.getInformation());
        nueva.setImpact(sc.getImpact());
        nueva.setServicecallCode2(sc.getServicecallCode2());
        IAssignment assignmentsc = null;
        IAssignment assignmentnueva = null;
        assignmentsc = sc.getAssignment();
        assignmentnueva = nueva.getAssignment();
        assignmentnueva.setAssigneePerson(assignmentsc.getAssigneePerson());
        assignmentnueva.setAssWorkgroup(assignmentsc.getAssWorkgroup());
        assignmentnueva.transfer();
        //XDG Canvi classificació de nou a stock
        String equipament = sc.getClassification().getParentCode().getText();
        String subClassificacio = "Stock";
        IClassificationSerHome cla_hm = bean3.sd_session().getClassificationSerHome();
        IClassificationSer clasifica[] = cla_hm.findAllClassificationSer();
        for (int i=0 ; i<clasifica.length ; i++) {
            String textoclasi = clasifica[i].getText();
            if (subClassificacio.equals(textoclasi)) {
                if (equipament.equals(clasifica[i].getParentCode().getText())){
                    nueva.setClassification(clasifica[i]);
                }
            }
        }
        //XDG Guarda ID de l'anterior ES a la nova
        nueva.setSolution(_solucio);
        nueva.setServicecallMedium(sc.getServicecallMedium());
        nueva.setServeiPeticio(sc.getServeiPeticio());
        Long sc_altra_id = sc.getID();
        nueva.save();
        //XDG Guarda ID de la nova ES en l'anterior
        Long _sc_actual_id = nueva.getID();
        String _solucio_anterior = "ES relacionada amb la nº " + _sc_actual_id + " de Retirada";
        sc.setSolution(_solucio_anterior);
        sc.save();
        
        %>
        <jsp:forward page="ViewEdit2ServiceCall.jsp" >
        <jsp:param name="vSc" value="<%= sc.oid() %>" />
        <jsp:param name="vSc1" value="<%= _sc_anterior_id %>" />
        <jsp:param name="vSc2" value="<%= _sc_actual_id %>" />
        </jsp:forward>
                <%

    } catch (Throwable e) {

      %> <%= SdClientBean.filter_html_string(e.getMessage()) %>
      <%

    }
  }
%>


</BODY>
</HTML>