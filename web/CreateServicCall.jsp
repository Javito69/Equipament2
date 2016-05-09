
<%@ page import="com.hp.itsm.ssp.beans.SdClientBean" %>
<%@ page import="com.hp.itsm.ssp.beans.SortCode" %>
<%@ page import="com.hp.itsm.ssp.beans.NoTemplateException" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecallHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecallEntitlement" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecall" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecallCode2Home" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecallCode2" %>
<%@ page import="com.hp.itsm.api.interfaces.IServicecallCode2Entitlement" %>
<%@ page import="com.hp.itsm.api.interfaces.IServiceCallCategoryHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IServiceHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IService" %>
<%@ page import="com.hp.itsm.api.interfaces.IServiceCallCategory" %>
<%@ page import="com.hp.itsm.api.interfaces.IImpactHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IImpact" %>
<%@ page import="com.hp.itsm.api.interfaces.IClassificationSerHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IClassificationSerWhere" %>
<%@ page import="com.hp.itsm.api.interfaces.IClassificationSer" %>
<%@ page import="com.hp.itsm.api.interfaces.IConfigurationItemHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IConfigurationItem" %>
<%@ page import="com.hp.itsm.api.interfaces.IPersonHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IOrganizationHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IPerson" %>
<%@ page import="com.hp.itsm.api.interfaces.*" %>
<%@ page import="com.hp.itsm.api.interfaces.IPersonCode2" %>
<%@ page import="com.hp.itsm.api.interfaces.IPersonCode2Home" %>
<%@ page import="com.hp.itsm.api.interfaces.IOrganization" %>
<%@ page import="com.hp.itsm.api.interfaces.IAssignmentHome" %>
<%@ page import="com.hp.itsm.api.interfaces.IAssignmentEntitlement" %>
<%@ page import="com.hp.itsm.api.interfaces.IAssignment" %>
<%@ page import="com.hp.itsm.api.interfaces.IWorkgroup" %>
<%@ page import="com.hp.itsm.ssp.beans.SortCode" %>
<%@ page import="java.text.Collator" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.*" %>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ include file="client-funcs.js" %>
<%@ include file="caller-funcs.js" %>
<%@ include file="findspecialist-funcs.js" %>


<html>

<head>
<link rel="stylesheet" type="text/css" href="sd-sp.css">
<script type="text/javascript">
titol="Equipament";
codiForm="Equipament";
 
function control2()
{

 f.Esol.value = " Descripci� de equipament: " + f.Esol2.value + "\n";
 f.tipus.value=" Tipus de equipament: ";

}
function control()
{


 f.PlantaOr.value = " Planta: " + f.PlantaOr2.value + "\n";
 f.EdificiOr.value = " Edifici: ";
 f.Nlloc.value = " Numero de llocs a traslladar: " + f.Nlloc2.value + "\n";
 f.Nimp.value = " Numero de impresores a traslladar: " + f.Nimp2.value + "\n";
 f.EdificiOr.value = " Edifici Origen: ";
 f.EdificiDest.value = " Edifici desti: ";
 f.PlantaDest.value = " Planta Desti: " + f.PlantaDest2.value   + "\n" ;

} 



function MostraDetall2(control)
{var i,detalls,detallAct,a,b;


f.Altres.value="";
f.Observacions.value="";
f.MotiuSubstitucio.value="";
f.PlantaOr2.value="";
f.PlantaDest2.value="";
f.Nimp2.value="";
f.Nlloc2.value="";
f.EdificiDest2.value="";
f.EdificiOr2.value="";

	if (control.name=="tipus1")
	{
		DetallDestinatari.style.display="none";
		DetallAmbit.style.display="none";
		DetallUbicacio.style.display="none";



	}
	
	


	DetallGrup.style.display="none";
	DetallTrasllat.style.display="none";
	DetallTelDesti.style.display="none";
	DetallTelCap.style.display="none";
	DetallTelSecre.style.display="none";
	DetallAltres.style.display="none";
	DetallDesti.style.display="none";
	DetallObservacions.style.display="none";
        DetallMotiuSubstitucio.style.display="none";

	detalls=control.options(control.selectedIndex).tipDetall;
	while (detalls!="")
	{
		if (detalls.indexOf(",")>0)
		{
			detallAct=detalls.substr(0,detalls.indexOf(","));
			detalls=detalls.substr(detalls.indexOf(",")+1)
		}
		else
		{
			detallAct=detalls;
			detalls="";
		}
		if (detallAct!="") document.all("Detall"+detallAct).style.display="block";
	}
	
}

function MostraDetall(control)
{var i,detalls,detallAct,a,b;

f.tipus1.value="";
f.Altres.value="";
f.Observacions.value="";
f.MotiuSubstitucio.value="";
f.PlantaOr2.value="";
f.PlantaDest2.value="";
f.Nimp2.value="";
f.Nlloc2.value="";
f.EdificiDest2.value="";
f.EdificiOr2.value="";

	if (control.name=="peticio")
	{
		DetallDestinatari.style.display="none";
		DetallAmbit.style.display="none";
		DetallUbicacio.style.display="none";
                Detalltipus1.style.display="none";


	}
	
	
	

	DetallGrup.style.display="none";
	DetallTrasllat.style.display="none";
	DetallTelDesti.style.display="none";
	DetallTelCap.style.display="none";
	DetallTelSecre.style.display="none";
	DetallAltres.style.display="none";
	DetallDesti.style.display="none";
	DetallObservacions.style.display="none";
	DetallMotiuSubstitucio.style.display="none";


	detalls=control.options(control.selectedIndex).tipDetall;
	while (detalls!="")
	{
		if (detalls.indexOf(",")>0)
		{
			detallAct=detalls.substr(0,detalls.indexOf(","));
			detalls=detalls.substr(detalls.indexOf(",")+1)
		}
		else
		{
			detallAct=detalls;
			detalls="";
		}
		if (detallAct!="") document.all("Detall"+detallAct).style.display="block";
	}

}

</script>

</head>
<script language="javascript" type="text/javascript"> 
 function valores(){
        DetallConfidencial.style.display="none";
	DetallDestinatari.style.display="none";
	DetallPersona.style.display="none";
	DetallTrasllat.style.display="none";
	DetallGrup.style.display="none";
	DetallTelDesti.style.display="none";
	DetallTelCap.style.display="none";
	DetallTelSecre.style.display="none";
	DetallAmbit.style.display="none";
	DetallAltres.style.display="none";
	DetallUbicacio.style.display="none";
	DetallDesti.style.display="none";
        DetallAltres.style.display="none";
        Detalltipus1.style.display="none";
       	DetallObservacions.style.display="none";
	DetallMotiuSubstitucio.style.display="none";

}
</script>



<body onload="document.forms(0).elements('bcercar').focus()">


			<%
String auth = request.getHeader("Authorization");
String usuario = "";
if (auth == null) {
        response.setStatus(response.SC_UNAUTHORIZED);
        response.setHeader("WWW-Authenticate", "NTLM");
        return;
}
if (auth.startsWith("NTLM ")) { 
        byte[] msg = new sun.misc.BASE64Decoder().decodeBuffer(auth.substring(5));
        int off = 0, length, offset;
        String s;

        if (msg[8] == 1) { 
            off = 18;

            byte z = 0;
            byte[] msg1 = {(byte)'N', (byte)'T', (byte)'L', (byte)'M', (byte)'S',
                            (byte)'S', (byte)'P', z,
                            (byte)2, z, z, z, z, z, z, z,
                            (byte)40, z, z, z, (byte)1, (byte)130, z, z,
                            z, (byte)2, (byte)2, (byte)2, z, z, z, z, //
                            z, z, z, z, z, z, z, z};
            // 
            response.setStatus(response.SC_UNAUTHORIZED);
            response.setHeader("WWW-Authenticate", "NTLM " 
                  + new sun.misc.BASE64Encoder().encodeBuffer(msg1).trim());
            return;
        } 
        else if (msg[8] == 3) { 
                off = 30;
                length = msg[off+17]*256 + msg[off+16];
                offset = msg[off+19]*256 + msg[off+18];
                s = new String(msg, offset, length);
                //out.println(s + " ");
        } 
        else
                return;

        length = msg[off+1]*256 + msg[off];
        offset = msg[off+3]*256 + msg[off+2];
        s = new String(msg, offset, length);
        //out.println(s + " ");
        length = msg[off+9]*256 + msg[off+8];
        offset = msg[off+11]*256 + msg[off+10];
        s = new String(msg, offset, length);
        usuario = s;
        }
  SdClientBean bean = (SdClientBean) session.getAttribute("sd-client-bean");

  response.setHeader("Cache-Control","no-cache");
  if (bean == null) {
%>
    <jsp:forward page="NoSessionError.jsp" />

<%
  }
  boolean serviceEntitlement = true;
  if (request.getMethod().equals("GET") ||
      (request.getMethod().equals("POST") &&
      "yes".equals(request.getParameter("vRetry")))
     ) {

    %>
      
    <%

    try {

      boolean one_is_selected;
      IServicecallHome sc_hm = bean.sd_session().getServicecallHome();
      IServicecallCode2Home sc_sap = bean.sd_session().getServicecallCode2Home();
      IServicecallEntitlement sc_ent = sc_hm.getServicecallEntitlement();
      IServicecallCode2Entitlement sc_saporg = sc_sap.getServicecallCode2Entitlement();
      IServicecall sc = null;
      IServiceCallCategoryHome cat_hm = bean.sd_session().getServiceCallCategoryHome();
      IServiceCallCategory categories[] = cat_hm.findAllServiceCallCategory();
      SortCode.sortIObject(categories);
      IService services[] = null;
      if (bean.getSLMmodule()) {
        try {
            services = bean.services_for_which_current_user_has_an_sla();
            SortCode.sortIObject(services);
        } catch (Throwable ignore) {
            serviceEntitlement = false;
        }
      } else {
          serviceEntitlement = false;
      }
      IConfigurationItemHome ci_hm = bean.sd_session().getConfigurationItemHome();
      IConfigurationItem confitems[] = bean.all_conf_items_for_this_user();
      SortCode.sortIObject(confitems);
      IImpactHome imp_hm = bean.sd_session().getImpactHome();
      IImpact impacts[] = imp_hm.findAllImpact();
      SortCode.sortIObject(impacts);
      IPerson caller_person;
	  IOrganization caller_organization;
	  IPerson form_person;

      String descr;


      if ("yes".equals(request.getParameter("vRetry"))) {
        /* re-use the old object */
    Long sc_oid = null;
    String _sc = request.getParameter("vSc");

    if (_sc != null) sc_oid = new Long(_sc);
        if (sc_oid != null) sc = (IServicecall) bean.ot_remove(sc_oid);

    if (sc == null) {
          /* bad luck, create a new object */
          sc = bean.create_new_service_call();
        }

        descr = null;
      } else {
        /* create a new object */
        sc = bean.create_new_service_call();

        descr = request.getParameter("vDescription");
      }
	  form_person = sc.getCaller();
      caller_person = sc.getCaller();
      caller_organization = sc.getCallerOrganization();

      if (caller_person == null && caller_organization == null) {
        caller_person = bean.current_user_person();
        caller_organization = (caller_person != null ? caller_person.getPersonOrganization() : null);

    if ( ! bean.is_specialist()) {
          if (caller_organization != null) sc.setCallerOrganization(caller_organization);
          if (caller_person != null) sc.setCaller(caller_person);
        }
      }

      bean.ot_add(sc);






        %>
          <form name="f" action="CreateServiceCall.jsp?vSc=<%= sc.oid() %>" method="post" target="results">
          <div class="headline"> <p><b>Petici� Equipament inform�tic: ordinadors, impressores i altres perif�rics<b></b></b></p> </div>
            <table border="0" width="50%" >
				<tr>
					<td>
						<b>Persona que omple el formulari</b>
					</td>
				</tr>
            	 <tr>
            	  <td>
					  <%=caller_person != null ? SdClientBean.filter_html_string(caller_person.getName()) : "" %>
					  <br>
						 Tel�fon:
					  <input type="text" size="10" name="tel" value="<%= caller_person.getPrimaryTelephoneNumber() %>" />
                  </td>

                 </tr><tr>
                  <td>
                  <br/>
                  <b>*Destinatari de la petici� <b><br>
				  <!--<INPUT readonly size="40" type="text" name="vCallerPersonName" value="<%= SdClientBean.filter_html_parameter(caller_person != null ? caller_person.getName() : "") %>" > </INPUT>-->
                  <input readonly size="40" type="text" name="vCallerPersonName" value="" > </input>
                  <input type="hidden" name="vCallerPerson" value="<%= caller_person != null ? caller_person.oid().toString() : "" %>" >
                  <input type="button" name="bcercar" onclick="find_caller('<%= sc.oid() %>', this.form)" value="Cercar" >
                  <input type="hidden" name="vCallerOrganizationName" value="<%= SdClientBean.filter_html_parameter(caller_organization != null ? caller_organization.getName1() : "") %>" > </input>
                  <input type="hidden" name="vCallerOrganization" value="<%= caller_organization != null ? caller_organization.oid().toString() : "" %>" >
                  </b></b></td>
                 </tr>
            </table>
        <tr>
          <td valign="top" bgcolor="#FFFFFF" nowrap>
            <table border="0">
              <tr>
                <td class="texto">
					<b>*Tipus equipament<b><br>
					<input type="hidden" class=texto maxlength=3 name="tipus" size=3 value="">
                        <select name="peticio" class=texto onchange="MostraDetall(this);">
						<option value="" tipDetall=""></option>
                        <option value="Ordinador sobretaula" tipDetall="Tipus1">Ordinador sobretaula</option>
						<option value="Ordinador port�til" tipDetall="Tipus1">Ordinador port�til</option>
						<!--<option value="Impressora" tipDetall="Tipus1">Impressora</option>-->
						<option value="Tablet" tipDetall="Tipus1">Tablet</option>
						<option value="Altre equipament" tipDetall="Altres">Altre equipament</option>
					</select>

              <tr>
              <td colspan=8 class="texto">
					<div id=Detalltipus1 style="display: none">
                                                        <table cellpadding="0" cellspacing="0" border="0">
                                                        <tr>
                                                        <b>*Tipus d'actuaci�<b><br>
                                                        <select name="tipus1" onchange="MostraDetall2(this);" class=texto>
                                                        <option value="" tipDetall=""></option>
														<option value="Retirada equip actual" tipDetall="Observacions">Retirada equip actual</option>
														<option value="Substituci� equip actual" tipDetall="MotiuSubstitucio">Substituci� equip actual</option>
                                                        <option value="Nou equip" tipDetall="Observacions">Nou equip</option>
 				                 	</select>
                                                        </b></b></tr>
                                                        </table>
                  			</div>
                </td>
                </tr>
                <tr>
                <td colspan=8 class="texto">
					<div id=DetallTrasllat style="display: none">
							<table cellpadding="0" cellspacing="0" border="0">
                                                        <tr>
                                                        <td>
                                                        <b>N�mero de llocs de treball&nbsp<b><br>
                                                        </b></b></td>
                                                        <td>
                                                        <b>N�mero de impresores&nbsp<b><br>
							</b></b></td>
							</tr>
							<tr>
							<td>
						        <input type="hidden" class=texto maxlength=3 name="Nlloc" size=3 value="">
                                                   	<input class=texto maxlength=3 name="Nlloc2"  onchange="control(this.form)" size=3>
                                                   	</td>
							<td>
                                                        <input type="hidden" class=texto maxlength=3 name="Nimp" size=3 value="">
                                                        <input class=texto maxlength=3 name="Nimp2" size=3 onchange="control(this.form)"> </input>
                                                        </td>
                                                        </tr>
                                                        </table>
                  			</div>
                  			
                </td>
              </tr>
                <td colspan=8  class="texto">
					<div id=DetallAltres style="display: none">
					<b>*Descripci�<b><br>
                                        <textarea name="Altres" rows="6" cols="50" value=""></textarea>
					 </b></b></div>
                <br>
                </td>
              </b></b></td></tr>

              <tr>
                <td colspan=8  class="texto">

					<div id=DetallObservacions style="display: none">
					<b>Observacions<b><br>
                                        <textarea name="Observacions" rows="6" cols="50" value=""></textarea>
					 </b></b></div>
                </td>
              </tr>
              
              <tr>
                <td colspan=8  class="texto">

					<div id=DetallMotiuSubstitucio style="display: none">
					<b>Motiu de la Substituci�<b><br>
                                        <textarea name="MotiuSubstitucio" rows="6" cols="50" value=""></textarea>
					 </b></b></div>
                </td>
              </tr>

              <tr>
                <td colspan=8 class="texto">
					<div id=DetallUbicacio style="display: none">
				            <table cellpadding="0" cellspacing="0" border="0">
              					<tr>
              						<td class="texto">
							<b>Edifici<b><br>
                                                        <input type="hidden" class=texto maxlength=3 name="EdificiOr" size=3 value="">
                                                        <select name="EdificiOr2" onchange="control(this.form)" class="texto">
							<option value=""></option>
							<option value="Altres...">Altres...</option>
							<option value="Balmes">Balmes</option>
							<option value="Can Serra">Can Serra</option>
							<option value="Casa Caritat">Casa Caritat</option>
							<option value="Corsega">Corsega</option>
							<option value="Diagonal">Diagonal</option>
							<option value="Edifici del Rellotge">Edifici del Rellotge</option>
							<option value="Londres">Londres</option>
							<option value="Mallorca">Mallorca</option>
							<option value="Mart��Juli�">Mart��Juli�</option>
							<option value="Medi Ambient (Laboratori)">Medi Ambient (Laboratori)</option>
							<option value="Minerva">Minerva</option>
							<option value="Nova Seu">Nova Seu</option>
							<option value="Recinte Llars Mundet">Recinte Llars Mundet</option>
							<option value="Recinte Maternitat">Recinte Maternitat</option>
							<option value="Recinte Torribera">Recinte Torribera</option>
							<option value="Sant Honorat">Sant Honorat</option>
							<option value="Sant Pere m�s baix">Sant Pere m�s baix</option>
							<option value="Vag�">Vag�</option>
							</select>
							</b></b></td>
							<td class="texto">
							<b>Planta<b><br>
                                                        <input type="hidden" class=texto maxlength=3 name="PlantaOr" size=3 value="">
							<input class=texto maxlength=5 name="PlantaOr2" onchange="control(this.form)" size=5>
							</b></b></td>

              					</tr>
				            </table>
					</div>
					<div id=DetallDesti style="display: none">
				            <table cellpadding="0" cellspacing="0" border="0">
              					<tr>
              						<td class="texto">
							<b>Edifici desti<b><br>
                                                        <input type="hidden"  class=texto maxlength=3 name="EdificiDest" size=3 value="">
							<select name="EdificiDest2" onchange="control(this.form)" class="texto">
							<option value=""></option>
							<option value="Altres...">Altres...</option>
							<option value="Balmes">Balmes</option>
							<option value="Can Serra">Can Serra</option>
							<option value="Casa Caritat">Casa Caritat</option>
							<option value="Corsega">Corsega</option>
							<option value="Diagonal">Diagonal</option>
							<option value="Edifici del Rellotge">Edifici del Rellotge</option>
							<option value="Londres">Londres</option>
							<option value="Mallorca">Mallorca</option>
							<option value="Mart��Juli�">Mart�� Juli�</option>
							<option value="Medi Ambient (Laboratori)">Medi Ambient (Laboratori)</option>
							<option value="Minerva">Minerva</option>
							<option value="Nova Seu">Nova Seu</option>
							<option value="Recinte Llars Mundet">Recinte Llars Mundet</option>
							<option value="Recinte Maternitat">Recinte Maternitat</option>
							<option value="Recinte Torribera">Recinte Torribera</option>
							<option value="Sant Honorat">Sant Honorat</option>
							<option value="Sant Pere m�s baix">Sant Pere m�s baix</option>
							<option value="Vag�">Vag�</option>
							</select>
							</b></b></td>
							<td class="texto">
							<b>Planta<b><br>
                                                        <input type="hidden" class=texto maxlength=3 name="PlantaDest" size=3 value="">
							<input class=texto maxlength=5 name="PlantaDest2" onchange="control(this.form)" size=5>
							</b></b></td>

              					</tr>
				            </table>
					</div>

					<p>

					<input type="submit" value="<%= bean.findLabel("SP_Submit") %> &raquo;" onclick="this.disabled=true;this.value='Enviant dades, espereu si us plau...';this.form.submit();">
                </p></td>
                </tr>
                <td class="texto">
					<div id=DetallGrup style="display: none">
							<b>Grup<b><br>
							<input class=texto maxlength=15 name="Grup" size=15>
                  			</b></b></div>
                </td>
                <td class="texto">
					<div id=DetallTelDesti style="display: none">
							<b>Telèfon destí<b><br>
							<input class=texto maxlength=15 name="TelDesti" size=15>
                  			</b></b></div>
                </td>
                <td class="texto">
					<div id=DetallTelCap style="display: none">
							<b>Telèfon cap<b><br>
							<input class=texto maxlength=15 name="TelCap" size=15>
                  			</b></b></div>
                </td>
                <td class="texto">
					<div id=DetallAmbit style="display: none">
							<b>�?mbit<b><br>
							<select class="texto" name="Ambit" size="1">
								<option value=""></option>
								<option value="Intern">Intern</option>
								<option value="Metropolità">Metropolità</option>
								<option value="Provincial">Provincial</option>
								<option value="Nacional">Nacional</option>
								<option value="Internacional">Internacional</option>
							</select>
					</b></b></div>
                </td>
                <td class="texto">
		<div id=DetallConfidencial style="display: none">
			Confidencial<br>
			<input type=checkbox id=Confidencial>
		</div>
					<div id=DetallTelSecre style="display: none">
							<b>Telèfon secretaria<b><br>
							<input class=texto maxlength=15 name="TelSecre" size=15>
                  			</b></b></div>
                </td>
              <tr></tr>
              <tr>
                <td colspan=4 class="texto">
		<div id=DetallDestinatari style="display: none">
				<b>Destinatari<b><br>
				<select name="Destinatari" class=texto onchange="MostraDetall(this);">
					<option value="" tipDetall=""></option>
					<option value="persona" tipDetall="Persona,Confidencial">Persona física</option>
					<option value="unitat organitzativa" tipDetall="Unitat">Unitat organitzativa</option>
					<option value="sala" tipDetall="Sala">Sala</option>
				</select>
		</b></b></div>
		</td>
                <td colspan=4 class="texto">
		<div id=DetallPersona style="display: none">
			<b>Persona interesada<b><br>
			<select name="Persona" class=texto onchange="MostraDetall(this);">
				<option value="" tipDetall=""></option>
				<option value="empleat" tipDetall="Empleat">Destinatari</option>
				<option value="no empleat" tipDetall="NoEmpleat">Personal no plantilla</option>
			</select>
		</b></b></div>
             

            
             
                                   
        </td></tr><tr>
		<td></td>
		</tr>
              
            </table>
          </td>
        </tr>
        <table></table>





			        <%
                  if (sc_ent.isRequiredDescription()) {
                    %>

                    <%
                  } else {
                    %>

                    <%
                  }
                %>
              
                <%
                  String description = "";

                  if (descr == null) {
                    try { description = sc.getDescription(); } catch (Throwable ignore) { ; }
                  } else {
                    description = descr;
                  }

                  if ( sc_ent.isModifyAllowedDescription() ) {
                    %>
                      
                    <%
                  } else {

                    %>
					
                    <%
                  }
                %>				           
        
			
			<table align="top" border="0" cellspacing="0" cellpadding="0" width="758">  
              
                <%
                  if ( sc_ent.isModifyAllowedInformation() ) {

                    String information = "";

                    try { information = sc.getInformation(); } catch (Throwable ignore) { ; }

                    %>
                      <input type="hidden" name="vInformation">
                    <%
                  } else {
                    String information = "";

                    try { information = sc.getInformation(); } catch (Throwable ignore) { ; }

                    %>
                      <%= information != null ? SdClientBean.filter_html_string(information) : "" %>
                    <%
                  }
                %>

            <%

             %>




          <form action=""></form>
<br>
      <tr>
        <td align="center" class="texto">

        </td></tr><tr>
         &nbsp;* Camp Obligatori
        </tr>
        <br>
          &nbsp; Per a qualsevol consulta o suggeriment, podeu adrecar-vos a
          <a href="mailto:sgsi.22007@diba.cat" target=1 >sgsi.22007@diba.cat</a>
        <td></td>
        <tr></tr>

      <tr></tr></TABLE>
  </form></body>
</html>
        <%
    } catch (NoTemplateException exc) {

      %>
        <%= bean.findLabel("SP_NoScTemplate") %>
      <%

    } catch (Throwable e) {
e.printStackTrace();
      %>
        <%= e.getMessage() %>
      <%

    }
  }

  if (request.getMethod().equals("POST") &&
      ! "yes".equals(request.getParameter("vRetry"))) {

    String _sc = request.getParameter("vSc");
    String _category = request.getParameter("vCategory");
    String _service = null;
    if (serviceEntitlement) {
      _service = request.getParameter("vService");
    }
    String _confitem = request.getParameter("vConfItem");
    String _description = request.getParameter("peticio");
    String _peti = request.getParameter("peticio");
    String _ambit = SdClientBean.hackyFixEncoding(request.getParameter("Ambit"));
    String _destinatari = SdClientBean.hackyFixEncoding(request.getParameter("Destinatari"));
    String _ubicacio = request.getParameter("Ubicacio");
    String _altres = request.getParameter("Altres");
    String _teldesti = request.getParameter("TelDesti");
    String _telcap = request.getParameter("TelCap");
    String _tipus = request.getParameter("tipus");
    String _tipus1 = request.getParameter("tipus1");
    String _tipus2 = request.getParameter("tipus2");
    String _telsecre = request.getParameter("TelSecre");
    String _grup = request.getParameter("Grup");
    String _edificidest = request.getParameter("EdificiDest");
    String _edificior = request.getParameter("EdificiOr");
    String _edificidest2 = request.getParameter("EdificiDest2");
    String _edificior2 = request.getParameter("EdificiOr2");
    String _nomsala = request.getParameter("nomSala");
    String _coordor = request.getParameter("CoordOr");
    String _coordest = request.getParameter("CoordDest");
    String _plantaor = request.getParameter("PlantaOr");
    String _plantadest = request.getParameter("PlantaDest");
    String _nomnoemp = request.getParameter("nomNoEmp");
    String _nif = SdClientBean.hackyFixEncoding(request.getParameter("NIF"));
    String _persona = SdClientBean.hackyFixEncoding(request.getParameter("Persona"));
    String _information = request.getParameter("vInformation");
    String _impact = request.getParameter("vImpact");
    String _orgsap = request.getParameter("vOrgsap");
    String _caller_organization = request.getParameter("vCallerOrganization");
    String _caller_person = request.getParameter("vCallerPerson");
    String _form_person = request.getParameter("scPerson");
    String _esol = request.getParameter("Esol");
    String _nlloc = request.getParameter("Nlloc");
    String _nimp = request.getParameter("Nimp");
    String tel_person = request.getParameter("tel");
    String _observacions = request.getParameter("Observacions");
    String _Motiusub = request.getParameter("MotiuSubstitucio");
    String _destinataripeti = request.getParameter("vCallerPersonName");
    String info = "";

	
		info = "Equipament....... " + _peti + "\r\n" + "Actuaci�............ " + _tipus1 + "\r\n" + "Observacions.... " + _observacions + _Motiusub + _altres + "\r\n";


	
    Long sc_oid = null;
    Long category_oid = null;
    Long service_oid = null;
    Long confitem_oid = null;
    String description = null;
    String information = null;
    String peti = null;
    Long impact_oid = null;
    Long orgsap_oid = null;
    Long caller_organization_oid = null;
    Long caller_person_oid = null;
    Long form_person_oid = null;
	
    if (_peti != null) peti = _peti;
    if (_sc != null) sc_oid = new Long(_sc);
    if (_category != null && _category.length() > 0) category_oid = new Long(_category);
    if (serviceEntitlement) {
      if (_service != null && _service.length() > 0) service_oid = new Long(_service);
    }
    if (_confitem != null && _confitem.length() > 0) confitem_oid = new Long(_confitem);
	
	
	
	
   if (_description != null) description = "Equipament Inform�tic" ; 


    if (_information != null) {

         information = info;
    }
    if (_impact != null && _impact.length() > 0) impact_oid = new Long(_impact);
    if (_orgsap != null && _orgsap.length() > 0) orgsap_oid = new Long(_orgsap);
    if (_form_person != null &&
        _form_person.length() > 0) form_person_oid = new Long(_form_person);
	if (_caller_organization != null &&
        _caller_organization.length() > 0) caller_organization_oid = new Long(_caller_organization);
    if (_caller_person != null &&
        _caller_person.length() > 0) caller_person_oid = new Long(_caller_person);
    


    IServicecallHome sc_hm = bean.sd_session().getServicecallHome();
    IServicecall sc;
    IServiceCallCategoryHome cat_hm = bean.sd_session().getServiceCallCategoryHome();
    IServiceCallCategory category = null;
    IServiceHome serv_hm = bean.sd_session().getServiceHome();
    IService service = null;
    IConfigurationItemHome ci_hm = bean.sd_session().getConfigurationItemHome();
    IConfigurationItem confitem = null;
    IServicecallCode2Home sc_sap = bean.sd_session().getServicecallCode2Home();
    IImpactHome imp_hm = bean.sd_session().getImpactHome();
    IImpact impact = null;
    IServicecallCode2 orgsap = null;
    IPersonHome person_hm = bean.sd_session().getPersonHome();
    IOrganizationHome org_hm = bean.sd_session().getOrganizationHome();
    IPerson caller_person = null;
    IOrganization caller_organization = null;
    IPerson form_person = null;


    if (sc_oid == null) {

      %> <%= bean.findLabel("SP_ObjectWhere") %> <%

      } else {

      sc = (IServicecall) bean.ot_remove(sc_oid);


      if (sc == null) {

        %> <%= bean.findLabel("SP_ObjectWhere") %> <%

      } else {

        if (category_oid != null) {
          category = cat_hm.openServiceCallCategory(category_oid);
        }
        if (serviceEntitlement) {
          if (service_oid != null) {
            service = serv_hm.openService(service_oid);
          }
        }

        if (confitem_oid != null) {
          confitem = ci_hm.openConfigurationItem(confitem_oid);
        }

        if (impact_oid != null) {
          impact = imp_hm.openImpact(impact_oid);
        }

		if (orgsap_oid != null) {
          orgsap = sc_sap.openServicecallCode2(orgsap_oid);
        }


        if (caller_organization_oid != null) {
          caller_organization = org_hm.openOrganization(caller_organization_oid);
        }

        if (caller_person_oid != null) {
          caller_person = person_hm.openPerson(caller_person_oid);
        }

		if (form_person_oid != null) {
          form_person = person_hm.openPerson(form_person_oid);
        }

        if (caller_organization != null) {
          sc.setCallerOrganization(caller_organization);
        }
        if (caller_person != null) {
          sc.setCaller(caller_person);
        }

		if (form_person != null) {
          sc.setScPerson1(form_person);
        }
        String categoria = "Petici� a mida";
        IServiceCallCategoryHome ca_hm = bean.sd_session().getServiceCallCategoryHome();
        IServiceCallCategoryWhere ca_wh =ca_hm.createServiceCallCategoryWhere();
        ca_wh.addCriteriumOnText(categoria);
        IServiceCallCategory categoriasc [] = ca_hm.findServiceCallCategory(ca_wh);
        for (int i=0 ; i<categoriasc.length ; i++) {
           sc.setCategory(categoriasc[i]);
        }
        if (serviceEntitlement) {
          if (service != null) {
            sc.setService(service);
          }
        }
        if (confitem != null) {
          sc.setConfigurationItem(confitem);
        }

        if (information != null) {
          sc.setInformation(information);
        }
        if (impact != null) {
          sc.setImpact(impact);
        }
		if (orgsap != null) {
          sc.setServicecallCode2(orgsap);
        }
        


        // Asignaci�n
        String grupo = "COSUPORTTECNIC";
        String asignadoa = "DIAZGX";
        IAssignmentHome ass_hm = bean.sd_session().getAssignmentHome();
        IAssignmentEntitlement ass_ent = ass_hm.getAssignmentEntitlement();
        IWorkgroupHome work_hm = bean.sd_session().getWorkgroupHome();
//      IPersonWhere perWhere = person_hm.createPersonWhere();
        IWorkgroupWhere workWhere = work_hm.createWorkgroupWhere();
        workWhere.addCriteriumOnSearchcode(grupo);
//      perWhere.addCriteriumOnSearchcode(asignadoa);
//      IPerson[] perasign = person_hm.findPerson(perWhere);
        IWorkgroup[] workasign = work_hm.findWorkgroup(workWhere);
        IAssignment assignment = null;
//      IPerson asignada = null;
        IWorkgroup wasignado = null;
//      for (int i= 0; i < perasign.length; i++) {
//         asignada = perasign[i];
//      }
        for (int i= 0; i < workasign.length; i++) {
           wasignado = workasign[i];
        }
        assignment = sc.getAssignment();
//      assignment.setAssigneePerson(asignada);
        assignment.setAssWorkgroup(wasignado);
        assignment.transfer();
        //Fin Asignaci�n



        String clasificacion = "";
        String tipopeticion = request.getParameter("peticio");
        String tipopeticion2 = request.getParameter("tipus1");
        IClassificationSerHome cla_hm = bean.sd_session().getClassificationSerHome();
        IClassificationSer clasifica[] = cla_hm.findAllClassificationSer();
        SortCode.sortIObject(clasifica);
        String textoclasi = "";
        String textosolu = "";
        for (int i=0 ; i<clasifica.length ; i++) {
           textoclasi = clasifica[i].getText();


           if (tipopeticion.equals("Altre equipament")) {
              if (textoclasi.equals("Altres_HW")) {
                 sc.setClassification(clasifica[i]);
              }
           }
           if (tipopeticion2.equals("Trasllat")) {
              if (textoclasi.equals("Trasllat")) {
                 sc.setClassification(clasifica[i]);
              }
           }
           if (tipopeticion.equals("Ordinador sobretaula")) {
              if (textoclasi.equals("PC Ofim�tic")) {
                 sc.setClassification(clasifica[i]);

              }
           }
           if (tipopeticion.equals("Ordinador port�til")) {
              if (textoclasi.equals("Port�til")) {
                 sc.setClassification(clasifica[i]);
              }
           }
           if (tipopeticion.equals("Impressora")) {
              if (textoclasi.equals("impressora")) {
                 sc.setClassification(clasifica[i]);
              }
           }
		   if (tipopeticion.equals("Tablet")) {
              if (textoclasi.equals("Tablet")) {
                 sc.setClassification(clasifica[i]);
              }
           }
        }

	String errores = "no";
       String serveinom = "PROVISI�-HW";
       if (tipopeticion.equals("")) {
          errores = "si";
          %>
            <script language = "JavaScript" type="text/javascript">
              alert('Tipus de equipament �s obligatori');
            </script>
          <%
          if (_destinataripeti.equals("")) {
             errores = "si";
             %>
               <script language = "JavaScript" type="text/javascript">
                 alert('Destinatari de la petici� est� buit');
               </script>
             <%
          }

       } else {
          if (tipopeticion.equals("Ordinador sobretaula")) {
             serveinom = "PROVISI�-HW";
             if (tipopeticion2.equals("")){
                errores = "si";
                %>
                  <script language = "JavaScript" type="text/javascript">
                    alert('Tipus actuaci� �s obligatori');
                  </script>
                <%
             } else {
                errores = "no";
             }
             			 
			 
             if (_destinataripeti.equals("")) {
                errores = "si";
                %>
                  <script language = "JavaScript" type="text/javascript">
                    alert('Destinatari de la petici� est� buit');
                  </script>
                <%
             }
          }
          if (tipopeticion.equals("Ordinador port�til")) {
             serveinom = "PROVISI�-HW";
             if (tipopeticion2.equals("")){
                errores = "si";
                %>
                  <script language = "JavaScript" type="text/javascript">
                    alert('Tipus actuaci� �s obligatori');
                  </script>
                <%
             } else {
                errores = "no";
             }


             if (_destinataripeti.equals("")) {
                errores = "si";
                %>
                  <script language = "JavaScript" type="text/javascript">
                    alert('Destinatari de la petici� est� buit');
                  </script>
                <%
             }
          }
          if (tipopeticion.equals("Impressora")) {
             serveinom = "IMPRESSIO";
             if (tipopeticion2.equals("")){
                errores = "si";
                %>
                  <script language = "JavaScript" type="text/javascript">
                    alert('Tipus actuaci� �s obligatori');
                  </script>
                <%
             } else {
                errores = "no";
             }

             if (_destinataripeti.equals("")) {
                errores = "si";
                %>
                  <script language = "JavaScript" type="text/javascript">
                    alert('Destinatari de la petici� est� buit');
                  </script>
                <%
             }
          }
		  
		  if (tipopeticion.equals("Tablet")) {
             serveinom = "PROVISI�-HW";
             if (tipopeticion2.equals("")){
                errores = "si";
                %>
                  <script language = "JavaScript" type="text/javascript">
                    alert('Tipus actuaci� �s obligatori');
                  </script>
                <%
             } else {
                errores = "no";
             }
             if (_destinataripeti.equals("")) {
                errores = "si";
                %>
                  <script language = "JavaScript" type="text/javascript">
                    alert('Destinatari de la petici� est� buit');
                  </script>
                <%
             }
          }
		  
       }
       if (tipopeticion.equals("Altre equipament")) {
          serveinom = "PROVISI�-HW";
          errores = "no";
          if (_destinataripeti.equals("")) {
             errores = "si";
             %>
               <script language = "JavaScript" type="text/javascript">
                alert('Destinatari de la petici� est� buit');
               </script>
             <%
          }

          if (_altres.equals("")) {
              errores = "si";
             %>
               <script language = "JavaScript" type="text/javascript">
                alert('Descripci� est� buit');
               </script>
             <%
          }
       }

// XDG comprovaci� de tipus de equipament i tipus d'actuaci�
			//Tipus d'equipament
			String tipusEquipament="";
			if ("Ordinador sobretaula".equals(tipopeticion)){
				tipusEquipament="PC";
			}else if ("Ordinador port�til".equals(tipopeticion)){
				tipusEquipament="Port�til";
			}else {
				tipusEquipament=tipopeticion;
			}
			
			
			//Tipus d'actuaci�
			String tipusPeticio="";
			if ("Retirada equip actual".equals(tipopeticion2)){
				tipusPeticio="Retirada ";
			}else if("Nou equip".equals(tipopeticion2)){
				tipusPeticio="Instal�laci� ";
			}
			
			
			if (errores.equals("no")) {
				if (tipopeticion.equals("Altre equipament")){
					info = "Equipament....... " + _peti + "\r\n" + "Observacions.... " + _observacions + _Motiusub + _altres + "\r\n";
					description = description + " - " + tipusEquipament;
				} else {
					description = description + " - " + tipusPeticio + tipusEquipament;
					//info = info + "\r\n" + "\r\n" + "A OMPLIR PEL T�CNIC INSTAL�LADOR" + "\r\n" + "\r\n" + "Dades de l'equip instal�lat" + "\r\n\t" + "Marca i model........." + "\r\n\t" + "N� de s�rie.............." + "\r\n\t" + "N� Inventari............." + "\r\n\t" + "Data (dd/mm/aa)...."  + "\r\n" + "\r\n" + "Dades de l'equip retirat (si n'hi ha)"  + "\r\n\t" + "Marca i model........." + "\r\n\t" + "N� de s�rie.............." + "\r\n\t" + "N� Inventari............" + "\r\n" + "\r\n" + "(Un cop feta la instal�laci� i consignades les dades, REASSIGNAR" + "\r\n" + "l'entrada de servei a SUPORT USUARI deixant \"A persona\" buit)";
					info = info + "\r\n" + "\r\n" + "A OMPLIR PEL T�CNIC INSTAL�LADOR" + "\r\n" + "\r\n" + "Dades de l'equip instal�lat" + "\r\n\t" + "Marca i model........." + "\r\n\t" + "N� de s�rie.............." + "\r\n\t" + "N� Inventari............." + "\r\n\t" + "Data (dd/mm/aa)...."  + "\r\n" + "\r\n" + "(Un cop feta la instal�laci� i consignades les dades, REASSIGNAR" + "\r\n" + "l'entrada de servei a SUPORT USUARI deixant \"A persona\" buit)";
				}
				if (description != null) {
					sc.setDescription(description);
				}
				sc.setInformation(info);
			}			
      
          try {
             sc.save();
			 //XDG
			 Thread.sleep(1000);
             String loginname = "system";
             String password = "servicedesk";
			 //String servidor = "swcs574";
             String servidor = "servicedesk";
             SdClientBean bean2 = null;
             try {
                bean2 = new SdClientBean(servidor, loginname, password);
             } catch (Throwable exc) {
                bean2 = null;
             }
             IServicecall item = null;
             IServicecallHome scHome = bean2.sd_session().getServicecallHome();
             item = scHome.openServicecall(sc_oid);
			 
			 //XDG Tipus de formulari en historial
			String asuntolinea = "Formulari";
			String infoh="Formulari T�cnics Equipament2";	
			IHistoryLineServicecallHome his_hm = bean2.sd_session().getHistoryLineServicecallHome();
			IHistoryLineServicecall lineasc = his_hm.openNewHistoryLineServicecall();
			lineasc.setSubject(asuntolinea);
			lineasc.setInformation(infoh);
			item.addHistoryLine(lineasc);
			 
             IMediumHome me_hm = bean2.sd_session().getMediumHome();
             IMedium medis[] = me_hm.findAllMedium();
             IServiceHome ser_hm = bean2.sd_session().getServiceHome();
             IServiceWhere serWhere = ser_hm.createServiceWhere();
             IImpactHome imp2_hm = bean2.sd_session().getImpactHome();
             IImpact impacts2[] = imp2_hm.findAllImpact();
             //String serveinom = "PROVISI�-HW";
             String textomedi = "";
             String textoimpacte = "";
             for (int i=0 ; i<medis.length ; i++) {
                textomedi = medis[i].getText();
                if (textomedi.equals("Formulari web t�cnics SSI")) {
                  item.setServicecallMedium(medis[i]);
                }
             }
             IService servei = null;
             serWhere.addCriteriumOnName(serveinom);
             IService serveis[] = ser_hm.findService(serWhere);
             for (int j=0 ; j<serveis.length ; j++) {
                servei = serveis[j];
             }
             IService serveiamida = servei.getServeiPeticioAmida();
             IService serveistandard = servei.getServeiPeticioStandard();
             item.setService(serveiamida);
             item.setServeiPeticio(servei);
			 
             //XDG en el cas d'Impressora l'impacte �s baix en la resta l'impacte �s mig
             IClassificationSer clasi = item.getClassification();
             String clasification = clasi.getText();			 
             if ( clasification.equals("impressora")) {
                for (int z=0 ; z<impacts2.length ; z++) {
                   textoimpacte = impacts2[z].getText();
                   if (textoimpacte.equals("Baix")) {
                      item.setImpact(impacts2[z]);
                   }
                }
             }  else {
                for (int z=0 ; z<impacts2.length ; z++) {
                   textoimpacte = impacts2[z].getText();
                   if (textoimpacte.equals("Mig")) {
                      item.setImpact(impacts2[z]);
                   }
                }
             }
             item.save();
			 if (tipopeticion2.equals("Substituci� equip actual")) {
				%>
					<jsp:forward page="Create2ServiceCall.jsp" >
					<jsp:param name="vSc" value="<%= sc.oid() %>" />
					</jsp:forward>
				<%			 
			 }else{
				 %>
				   <jsp:forward page="ViewEditServiceCall.jsp" >
					 <jsp:param name="vSc" value="<%= sc.oid() %>" />
				   </jsp:forward>
				 <%			 
			 }
          } catch (RuntimeException e) {
    		    System.out.println(e.getMessage());
		}

       if (errores.equals("si")) {
         // bean.ot_add(sc);
          %>
            <jsp:include page="CreateServiceCall.jsp" flush="true">
              <jsp:param name="vSc" value="<%= sc.oid() %>" />
              <jsp:param name="vRetry" value="yes" />
            </jsp:include>
          <%
       }

      }
    }
  }
%>



