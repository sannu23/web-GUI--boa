<%
if Request_Form("formcommit") = "1" then
	TCWebApi_set("WebCurSet_Entry","VlanBind_id","entryidx")
	TCWebApi_set("VlanBind_Entry","Active","bindmode")
	if Request_Form("bindmode") = "Yes" then
		TCWebApi_set("VlanBind_Entry","mn","bindvalue")
	else
		TCWebApi_set("VlanBind_Entry","mn","empty")
	end if
	TCWebApi_commit("VlanBind_Entry")	
	tcWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE><%tcWebApi_get("String_Entry","BindingSetText","s")%></TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="/JS/stylemain.css" type=text/css rel=stylesheet>
<style type="text/css">
.title_01 {
	COLOR: #5c5d55
}
.prompt {
	PADDING-BOTTOM: 5px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; FONT-FAMILY: "Tohama", "Arial", "????"; FONT-SIZE: 12px; PADDING-TOP: 5px
}
</style>
<SCRIPT language=javascript src="/JS/menu.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/jquery.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util.js"></SCRIPT>
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=JavaScript type=text/javascript>
function LoadFrame()
{
}

function ModifyInstance(index)
{
  var lanmode = LanArray[index -1].Mode;
  var vlanpair = LanArray[index -1].Vlan;

  document.getElementById("TableUrlInfo").style.display = "block";
  getElById("UrlAddressControl").value = vlanpair;
  
  if (lanmode == 0)
  {
      getElById("ChooseDeviceType").value = "lanwanbinding";
      getElById("BindVlanRow").style.display = "none";        
  }
  else if (lanmode == 1)
  {
      getElById("ChooseDeviceType").value = "vlanbinding"; 
      getElById("BindVlanRow").style.display = "block";       
  }
}

 
function setControl(index) 
{ 
	var identi = "";

	selectIndex = index;
	if (index < -1)
		return;

<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
	if(index <= 12)
<% else %>
	if(index <= 8)
<% end if %>
	{
		identi = index > 4 ? "SSID"+(index-4) : "LAN"+index;
	}
	else
	{
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
		identi = "SSIDAC"+(index-12);
<% else %>
		identi = "SSIDAC"+(index-10);
<% end if %>
	}
	document.getElementById("PortId").innerHTML = identi;

	return ModifyInstance(index);
}



function BindInfoClass(Mode, Vlan)
{
    this.Mode = ( 'Yes' == Mode ) ? 1 : 0;
    this.Vlan = ( 'N/A' == Vlan ) ? '' : Vlan;
}

var LanArray = new Array(
new BindInfoClass('<% tcWebApi_get("VlanBind_Entry0","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry0","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry1","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry1","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry2","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry2","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry3","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry3","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry4","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry4","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry5","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry5","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry6","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry6","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry7","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry7","mn","s") %>')
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry8","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry8","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry9","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry9","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry10","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry10","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry11","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry11","mn","s") %>')
<% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") <> "Yes" then %>
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry8","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry8","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry9","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry9","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry10","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry10","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry11","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry11","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry12","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry12","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry13","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry13","mn","s") %>')
<% else %>
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry12","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry12","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry13","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry13","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry14","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry14","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry15","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry15","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry16","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry16","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry17","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry17","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry18","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry18","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry19","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry19","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry20","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry20","mn","s") %>')
, new BindInfoClass('<% tcWebApi_get("VlanBind_Entry21","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry21","mn","s") %>')
<% end if %>
<% end if %>
,null);


//port vlan · 
function CreateRouteList()
{     
  var HtmlCode = "";
  var Lan_Indenti1 = "LAN";
  var Lan_Indenti2 = "SSID";
  var Lan_Indenti3 = "SSIDAC";
  var Lan = "";
  var LanCnt = 4;
<% if tcWebApi_get("WebCustom_Entry", "isHideLan4Supported","h") <> "Yes" then %>  
  var LanWire = 4;
<% else %>
  var LanWire = 3;
<% end if %>	

<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
  for(var i = 1; i <= 22; i++)
<% else %>
  for(var i = 1; i <= 14; i++)
<% end if %>
<% else %>
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
  for(var i = 1; i <= 12; i++)
<% else %>
  for(var i = 1; i <= 8; i++)
<% end if %>
<% end if %>
  {  
		var modestr = ""
		if (LanArray[i-1].Mode == 0)
		{
		    modestr = "<%tcWebApi_get("String_Entry","PortBindingText","s")%>";
		}
		else if (LanArray[i-1].Mode == 1)
		{
		    modestr = "VLAN<%tcWebApi_get("String_Entry","BindingText","s")%>";
		}

<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then%>
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
		if(i <= 12)
		{
			Lan = i > LanWire ? (Lan_Indenti2+(i-4)) : (Lan_Indenti1+i);
		}
		else if (i <= 20)
		{
			Lan = Lan_Indenti3+(i-12);
		}
		else
		{
			continue;
		}
<% else %>
		if(i <= 8)
		{
			Lan = i > LanWire ? (Lan_Indenti2+(i-4)) : (Lan_Indenti1+i);
		}
		else
		{
			if(i == 9 || i == 10)
				continue;
		
			Lan = Lan_Indenti3+(i-10);
		}
<% end if %>
<% else %>
		Lan = i > LanWire ? (Lan_Indenti2+(i-4)) : (Lan_Indenti1+i);
<% end if %>

      HtmlCode += '<tr id= "record_' + i +'" align = "center" class="table1_01" onclick="selectLine(this.id); " >';
      HtmlCode += '<td >' + Lan + '</td>';

      HtmlCode += '<td>' +modestr + '</td>';
      
      if( (LanArray[i-1].Vlan == "") || (LanArray[i-1].Mode == 0))
      {
          HtmlCode += '<td>--</td>';
      }
      else
      {
          HtmlCode += '<td style="word-break:break-all;word-wrap:break-word;">' + LanArray[i-1].Vlan + '</td>'; 
      }
      
      HtmlCode += '</tr>'            
  }  
  
  return HtmlCode;    
}

function OnChooseDeviceType(Select)
{
   var Mode = getElementById("ChooseDeviceType").value;

   if (Mode == "lanwanbinding")
       getElById("BindVlanRow").style.display = 'none';        
   else if (Mode == "vlanbinding")
       getElById("BindVlanRow").style.display = '';
}

//�ûȡťĴ߼�
function OnCancelButtonClick()
{
    document.getElementById("TableUrlInfo").style.display = "none";
    return false;
}

function getEntryIndex(portid)
{
	switch ( portid )
	{
		case 'LAN1':
		case 'LAN2':
		case 'LAN3':
		case 'LAN4':
			return parseInt(portid.substring(3, 4)) - 1;
		case 'SSID1':
		case 'SSID2':
		case 'SSID3':
		case 'SSID4':
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
		case 'SSID5':
		case 'SSID6':
		case 'SSID7':
		case 'SSID8':
<% end if %>
			return parseInt(portid.substring(4, 5)) + 3;
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>			
		case 'SSIDAC1':
		case 'SSIDAC2':
		case 'SSIDAC3':
		case 'SSIDAC4':
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
		case 'SSIDAC5':
		case 'SSIDAC6':
		case 'SSIDAC7':
		case 'SSIDAC8':
			return parseInt(portid.substring(6, 7)) + 11;
<% end if %>
			return parseInt(portid.substring(6, 7)) + 9;
<% end if %>			
		default:
			return -1;
	}
}

function OnApplyButtonClick()
{
		var entryidx = 0;
		var PortId = getElementById("PortId").innerHTML;

		if (FillBindInfo() == false)
		  return false;

		entryidx = getEntryIndex(PortId);
		if ( entryidx < 0 )
		{
			alert('Invalid entry!')
			return false;	
		}
		document.forms[0].entryidx.value = entryidx;
		document.forms[0].formcommit.value = 1;
		document.forms[0].bindmode.value = ('vlanbinding' == getElById("ChooseDeviceType").value) ? 'Yes' : 'No';
		if ( 'Yes' == document.forms[0].bindmode.value )
			document.forms[0].bindvalue.value = getElById("UrlAddressControl").value;
		
		if( true == setEBooValueCookie(document.forms[0]) )
			document.forms[0].submit();
		return true;
}

function FillBindInfo(Form)
{
	if (CheckParameter() == false)
		return false;

	return true;
}

function CheckParameter()
{
	var BindVlan = getElById("UrlAddressControl").value;
	
	var Mode = getElementById("ChooseDeviceType").value;
	if ((0 == BindVlan.length) && (Mode == "vlanbinding"))
	{
	    alert('<%tcWebApi_get("String_Entry","ShouldSetVLANText","s")%>');
			return false;
	}

	if (Mode == "vlanbinding")
	{
		if (IsBindBindVlanValid(BindVlan) == false)
		{
			return false;
		}
	}

	return true;
}

function checkwVlanDup( vlanid )
{
	var wanNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
	<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "23") %>
	// num 23
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
	var Wan_VidPRI = vArrayStr.split(',');
	var idx = 0;
	var wVlan = 0;
	var svlan = '';
	var wVlanDupCnt = 0;

	for ( idx = 0; 	idx < wanNum; idx ++ )
	{
			svlan = Wan_VidPRI[idx].split('/');
			wVlan = parseInt(svlan[0]);
			if ( wVlan == vlanid )
				wVlanDupCnt ++;
	}

	if ( wVlanDupCnt >= 2 )
		return 1;
	else
		return 0;
}

function IsBindBindVlanValid(BindVlan)
{   
	var LanVlanWanVlanList = BindVlan.split(";");
	var LanVlan0;
	var WanVlan;
	var TempList;

	for (var i = 0; i < LanVlanWanVlanList.length; i++)
	{
		TempList = LanVlanWanVlanList[i].split("/");
		
		/* �Ƿ�a/bʽ */
		if (TempList.length != 2)
		{
			alert(BindVlan+"<%tcWebApi_get("String_Entry","FormatInvalidText","s")%>");
			return false;
		}
		
		/* ab�Ƿ�Ϊ */
		if ((isNaN(parseInt(TempList[0]))) || (isNaN(parseInt(TempList[1]))))
		{
			alert(BindVlan+"<%tcWebApi_get("String_Entry","FormatInvalidText","s")%>");
			return false;
		}
		
		/* lan�ڵ�vlan�Ƿ�Ϸ� */
		if (!(parseInt(TempList[0]) >= 1 && parseInt(TempList[0]) <= 4094))
		{
			alert(BindVlan+"<%tcWebApi_get("String_Entry","UserText","s")%>Vlan\""+parseInt(TempList[0])+"\"<%tcWebApi_get("String_Entry","IsInvalidText","s")%>");
			return false;
		}
		
		if (!(parseInt(TempList[1]) >= 1 && parseInt(TempList[1]) <= 4094))
		{
			alert(BindVlan+"<%tcWebApi_get("String_Entry","exportText","s")%>Vlan\""+parseInt(TempList[1])+"\"<%tcWebApi_get("String_Entry","IsInvalidText","s")%>");
			return false;
		}
		
		if ( 1 == checkwVlanDup(parseInt(TempList[1])) )
		{
			alert(BindVlan+"<%tcWebApi_get("String_Entry","exportText","s")%>Vlan\""+parseInt(TempList[1])+"\"<%tcWebApi_get("String_Entry","MultiWANConnectText","s")%>");
			return false;
		}
	}

	if ( LanVlanWanVlanList.length > 20 )
	{
			alert("<%tcWebApi_get("String_Entry","Support20VLANText","s")%>");
			return false;
	}

	return true;
}
</SCRIPT>      
 
<META content="MSHTML 6.00.6000.16809" name=GENERATOR></HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="DisplayLocation(getElement('Selected_Menu').value);FinishLoad();if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=808 align=center 
border=0>
  <TBODY>
  <TR>
    <TD height=1>
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo.jpg border=0>
<% else %>
<% if tcwebApi_get("WebCustom_Entry","isCTPONTYLOGOSupported","h") = "Yes" then %>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo.jpg border=0>
<% else %>
      <TABLE height=90 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo.jpg border=0>
<% end if %> 
<% end if %> 
        <TBODY>
        <TR>
          <TD>&nbsp;</TD>
          <TD vAlign=bottom align=right width=358>
            <TABLE id=table8 cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD vAlign=bottom align=right><SPAN class=curUserName>&nbsp; 
                  </SPAN></TD>
                <TD class=welcom vAlign=bottom align=middle width=120><%tcWebApi_get("String_Entry","TitleWelcomeText","s")%></TD>
                <TD vAlign=bottom width=50><A onclick=DoLogout() 
                  href="/cgi-bin/logout.cgi" id=logOut name=logOut target=_top><SPAN 
                  class=logout><%tcWebApi_get("String_Entry","TitleLogOutText","s")%>
      </SPAN></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE id=table2 height=100 cellSpacing=0 cellPadding=0 width=808 
border=0>
        <TBODY>
        <TR>
          <TD class=LocationDisplay id=LocationDisplay align=middle width=163 
          bgColor=#ef8218 rowSpan=3></TD>
          <TD width=434 bgColor=#427594 height=33>
            <P align=right><FONT face=<%tcWebApi_get("String_Entry","RomanText","s")%> color=#ffffff><B><FONT face=<%tcWebApi_get("String_Entry","RomanText","s")%>
            color=#ffffff size=6><INPUT id=Selected_Menu type=hidden 
            value="<%tcWebApi_get("String_Entry","ContentNetText","s")%>-><%tcWebApi_get("String_Entry","ContentBindingText","s")%>" name=Net_Bind> </FONT></B><SPAN 
            class=GatewayName><%tcWebApi_get("String_Entry","TitleGateWayNameText","s")%>
            <SCRIPT 
            language=javascript>
document.write(top.gateWayName);
</SCRIPT>
             </SPAN></FONT></P></TD>
          <TD width=211 bgColor=#ef8218 height=33>
            <P class=GatewayType align=center><%tcWebApi_get("String_Entry","TitleGateWayTypeText","s")%>
            <SCRIPT language=javascript>
document.write(top.ModelName);
</SCRIPT>
             </P></TD></TR>
        <TR>
          <TD id=MenuArea_L1 vAlign=bottom bgColor=#ef8218 colSpan=2 
          height=43>&nbsp;</TD></TR>
        <TR>
          <TD id=MenuArea_L2 bgColor=#427594 colSpan=2 
      height=24></TD></TR></TBODY></TABLE>
      <SCRIPT 
      language=javascript>
MakeMenu(getElById ('Selected_Menu').value);
</SCRIPT>

      <TABLE id=table3 height=15 cellSpacing=0 cellPadding=0 width=808 
        border=0><TBODY>
        <TR>
          <TD height=15><IMG height=15 src="/img/panel1.gif" 
            width=164 border=0> </TD>
          <TD><IMG height=15 src="/img/panel2.gif" width=645 
            border=0> </TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD vAlign=top>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD class=Item_L1 width=157 bgColor=#ef8218 height=30>
            <P><%tcWebApi_get("String_Entry","BindingModeText","s")%></P></TD>
          <TD width=7 bgColor=#ef8218></TD>
          <TD width=474></TD>
          <TD vAlign=top width=170 background=/img/panel4.gif 
          rowSpan=4>
            <TABLE cellSpacing=0 cellPadding=20 width="100%" border=0 height='100%'>
              <TBODY>
              <TR>
                <TD valign='top'><A href="/cgi-bin/help_content.asp#<%tcWebApi_get("String_Entry","BindingSetText","s")%>" 
                  target=_blank><IMG height=34 src="<%tcWebApi_get("String_Entry","IMGHelpText","s")%>" 
                  width=40 border=0></A></TD></TR>
<% if tcwebApi_get("WebCustom_Entry","isWebTYLOGOSupported","h") = "Yes" then %>
              <TR>
                <TD valign='bottom'><IMG src='/img/tybottom.jpg' height=76 width=112></TD></TR>
<% end if %>
              </TBODY></TABLE></TD></TR>
        <TR>
          <TD vAlign=top width=157 bgColor=#e7e7e7 height=10></TD>
          <TD width=7 background=/img/panel3.gif></TD>
          <TD></TD></TR>
        <TR>
          <TD class=Item_L2 vAlign=top width=157 bgColor=#e7e7e7 height=30>
            <P></P></TD>
          <TD width=7 background=/img/panel3.gif></TD>
          <TD>
          	<FORM name="ConfigForm" action="/cgi-bin/net-binding.asp" method="post">
						<!--ͷ-->
						<div id="PromptPanel">
						    <table width="100%" border="0" cellpadding="0" cellspacing="0">
						        <tr>
						            <td class="prompt">
						                <table width="100%" border="0" cellspacing="0" cellpadding="0">
						                    <tr>
						                        <td width="100%" class="title_01" style="padding-left: 10px;">
						                            <%tcWebApi_get("String_Entry","VLANBindText","s")%>
						                        </td>
						                    </tr>
						                </table>
						            </td>
						        </tr>
						        <tr>
						        <td height="5px"></td>
						        </tr>
						
						    </table>
						  
					</div>

					<!--TODO:�ľ�ҳչ-->
					  <table class="table1_bg" border="0" cellspacing="1" style="margin-left: 5px;" width="98%">
					    <tr class="table1_title">
						       <td width="10%"><%tcWebApi_get("String_Entry","PortText","s")%></td>
						       <td width="15%"><%tcWebApi_get("String_Entry","BindingModeText","s")%></td>
						       <td width="75%"><%tcWebApi_get("String_Entry","BindingVLANPairText","s")%></td>
						  </tr>    
						    <script>
						   document.write(CreateRouteList()); 
<% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") = "Yes" then %>
						   setDisplay('record_2', 0);
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") = "Yes" then %>
						   setDisplay('record_3', 0);
						   setDisplay('record_4', 0);
<% end if %>
<% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) <> "Yes" then %>
<% if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) <> "Yes" then %>
							for(var i = 5; i <= 8; i++){
<% else %>
							for(var i = 5; i <= 12; i++){
<% end if %>
								var ctlID = 'record_'+i;
								setDisplay(ctlID, 0);
							}
<% else %>
<% if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) <> "Yes" then %>
							var ssidNum = parseInt('<% tcWebApi_get("WLan_Common","BssidNum","s") %>');
							if(ssidNum == 1)
							{
								setDisplay('record_6', 0);
								setDisplay('record_7', 0);
								setDisplay('record_8', 0);
							}
							else if(ssidNum == 2)  
							{
								setDisplay('record_7', 0);
								setDisplay('record_8', 0);
							}
							else if(ssidNum == 3)  
							{
								setDisplay('record_8', 0);
							}	
<% else %>
							var ssidNum = parseInt('<% tcWebApi_get("WLan_Common","BssidNum","s") %>');
							if(ssidNum == 1)
							{
								setDisplay('record_6', 0);
								setDisplay('record_7', 0);
								setDisplay('record_8', 0);
								setDisplay('record_9', 0);
								setDisplay('record_10', 0);
								setDisplay('record_11', 0);
								setDisplay('record_12', 0);
							}
							else if(ssidNum == 2)  
							{
								setDisplay('record_7', 0);
								setDisplay('record_8', 0);
								setDisplay('record_9', 0);
								setDisplay('record_10', 0);
								setDisplay('record_11', 0);
								setDisplay('record_12', 0);
							}
							else if(ssidNum == 3)  
							{
								setDisplay('record_8', 0);
								setDisplay('record_9', 0);
								setDisplay('record_10', 0);
								setDisplay('record_11', 0);
								setDisplay('record_12', 0);
							}	
							else if(ssidNum == 4)  
							{
								setDisplay('record_9', 0);
								setDisplay('record_10', 0);
								setDisplay('record_11', 0);
								setDisplay('record_12', 0);
							}
							else if(ssidNum == 5)  
							{
								setDisplay('record_10', 0);
								setDisplay('record_11', 0);
								setDisplay('record_12', 0);
							}
							else if(ssidNum == 6)  
							{
								setDisplay('record_11', 0);
								setDisplay('record_12', 0);
							}
							else if(ssidNum == 7)  
							{
								setDisplay('record_12', 0);
							}
<% end if %>
<% end if %>
<% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) <> "Yes" then %>
<% if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) <> "Yes" then %>
							for(var i = 11; i <= 14; i++){
<% else %>
							for(var i = 13; i <= 20; i++){
<% end if %>
								var ctlID = 'record_'+i;
								setDisplay(ctlID, 0);
							}
<% else %>
<% if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) <> "Yes" then %>
							var ssidacNum = parseInt('<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>');
							if(ssidacNum == 1)
							{
								setDisplay('record_12', 0);
								setDisplay('record_13', 0);
								setDisplay('record_14', 0);
							}
							else if(ssidacNum == 2)  
							{
								setDisplay('record_13', 0);
								setDisplay('record_14', 0);
							}
							else if(ssidacNum == 3)  
							{
								setDisplay('record_14', 0);
							}
<% else %>
							var ssidacNum = parseInt('<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>');
							if(ssidacNum == 1)
							{
								setDisplay('record_14', 0);
								setDisplay('record_15', 0);
								setDisplay('record_16', 0);
								setDisplay('record_17', 0);
								setDisplay('record_18', 0);
								setDisplay('record_19', 0);
								setDisplay('record_20', 0);
							}
							else if(ssidacNum == 2)  
							{
								setDisplay('record_15', 0);
								setDisplay('record_16', 0);
								setDisplay('record_17', 0);
								setDisplay('record_18', 0);
								setDisplay('record_19', 0);
								setDisplay('record_20', 0);
							}
							else if(ssidacNum == 3)  
							{
								setDisplay('record_16', 0);
								setDisplay('record_17', 0);
								setDisplay('record_18', 0);
								setDisplay('record_19', 0);
								setDisplay('record_20', 0);
							}
							else if(ssidacNum == 4)  
							{
								setDisplay('record_17', 0);
								setDisplay('record_18', 0);
								setDisplay('record_19', 0);
								setDisplay('record_20', 0);
							}
							else if(ssidacNum == 5)  
							{
								setDisplay('record_18', 0);
								setDisplay('record_19', 0);
								setDisplay('record_20', 0);
							}
							else if(ssidacNum == 6)  
							{
								setDisplay('record_19', 0);
								setDisplay('record_20', 0);
							}
							else if(ssidacNum == 7)  
							{
								setDisplay('record_20', 0);
							}
<% end if %>
<% end if %>
						   </script>  
					  
					 </table>

					 <!--ApplyCancelť-->
					  <div id="TableUrlInfo" style="display:none">
					
					  <table cellspacing="1" cellpadding="0" class="table1_bg" style="margin-left: 5px;" width="98%">
					  
					    <tr class="trTabConfigure">  
					    <td align= left width=25% class="table1_left"><%tcWebApi_get("String_Entry","PortText","s")%><td  class="table1_right"> <div id="PortId"></div></td> </td>
					    </tr>
					</table>
					
					  <table cellspacing="1" cellpadding="0" class="table1_bg" style="margin-left: 5px;" width="98%">
					    <tr class="trTabConfigure">
					    <td  align=left width="25%" class="table1_left"><%tcWebApi_get("String_Entry","PoryModeText","s")%></td><td  class="table1_right"><select id="ChooseDeviceType" name="ChooseDeviceType" onchange="OnChooseDeviceType(this);"><option value="vlanbinding"><%tcWebApi_get("String_Entry","VLANBindingText","s")%></option><option value="lanwanbinding"><%tcWebApi_get("String_Entry","PortBindingText","s")%></option></select>
					    </td>
					    </tr>
					  </table>
					  <div id="BindVlanRow">
					  <table cellspacing="1" cellpadding="0" class="table1_bg" style="margin-left: 5px;" width="98%">
					    <tr class="trTabConfigure"><td width="25%"  align=left class="table1_left"><%tcWebApi_get("String_Entry","BindingVLANPairText","s")%></td><td class="table1_right"><input type=text id="UrlAddressControl" name="UrlAddressControl" style="width:300px" maxlength=255 /></td></tr>
					  </table>
					  </div>
					  <table id="ConfigPanelButtons" width="100%" cellspacing="1" class="table1_button">
					    <tr>
					        <td width="25%">
					        </td>
					        <td class="table1_submit" style="padding-left: 5px">
					        		<input type='hidden' value='0' id='entryidx' name='entryidx'>
					        		<input type='hidden' value='0' id='formcommit' name='formcommit'>
					        		<input type='hidden' value='0' id='bindmode' name='bindmode'>
					        		<input type='hidden' value='0' id='bindvalue' name='bindvalue'>
					        		<input type='hidden' value='' id='empty' name='empty'>
					            <input id="ButtonApply" name="ButtonApply" type="button" value="<%tcWebApi_get("String_Entry","ApplyText","s")%>" onclick="javascript:return OnApplyButtonClick();" class="submit" />
					            <input id="ButtonCancel" name="ButtonCancel" type="button" value="<%tcWebApi_get("String_Entry","CancelText","s")%>" onclick="javascript:OnCancelButtonClick();" class="submit" />
					        </td>
					    </tr>
					  </table>
					</div>

            </FORM></TD></TR>
        <TR>
          <TD vAlign=top width=157 bgColor=#e7e7e7></TD>
          <TD width=7 background=/img/panel3.gif></TD>
          <TD></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD height=1>
      <TABLE id=table7 height=35 cellSpacing=0 cellPadding=0 width=808 
        border=0><TBODY>
        <TR>
          <TD width=162 bgColor=#ef8218></TD>
          <TD width=278 bgColor=#427594></TD>
          <TD width=196 bgColor=#427594>
            <P align=center></P></TD>
          <TD width=170 
bgColor=#313031></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></BODY></HTML>
