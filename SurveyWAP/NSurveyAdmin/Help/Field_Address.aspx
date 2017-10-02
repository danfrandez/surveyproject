﻿<%@ Page Language="c#" MasterPageFile="~/nsurveyadmin/MsterPageTabs.master" AutoEventWireup="false"
    Inherits="Votations.NSurvey.WebAdmin.HelpFiles" CodeBehind="default.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><div id="helpPanel"><div>
                <asp:ImageButton ID="btnBack" ImageUrl="~/Images/index-icon.png" runat="server" CssClass="buttonIndex"
                    PostBackUrl="~/NSurveyAdmin/Help/default.aspx#FieldTypes" Visible="True" ToolTip="Back to Helpfiles Index" />
            </div><div>
                <h2 style="color:#5720C6;">Field - Address</h2>
<hr style="color:#e2e2e2;" /> 
This field answertype renders a Google Maps based entry field for addresses.
                On entering address information (street, streetnumber, city etc.) location information 
                will be automatically presented (through Google) to select from. 
                The selected address information will be presented on the page and a map will show
                a marker at the selected location.                 
                 Default Type settings can be used also.
<br /><br />

<u>Installation & Activation</u><br /><br />
- to make use of the (Google) Address Answer Type a Google Subscription is needed in order to get a key;<br />
- the key must be copied to the Address.xml file at the XmlData\Address directory;<br />
- the key will become part of the url as provided by Google and which is programmed into SP;<br />
- the complete Google  url:<br /><br />
 https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&sensor=false&key=AIzaSyDwh2agwB_vfybUaiuLrl4Hopr9EDX6rUI&language=en
<br />
<br />
Google Maps Keys Information & Links:<br />
                <a href="https://developers.google.com/maps/documentation/javascript/get-api-key" target="_blank">https://developers.google.com/maps/documentation/javascript/get-api-key</a>
                <br /><br />
                Note: the working of the Google Maps features is determined by the Google Company. Limitations may apply. <br />
               <br /> More information can be found at:<br />
                <a href="https://developers.google.com/maps/documentation/javascript/usage" target="_blank">https://developers.google.com/maps/documentation/javascript/usage</a>

                <br /><br />

<u>Default Type Settings</u><br />
<br />
<i>* Type </i><br /> -  option to change the current answer type of the answer to add to the question. Respondent answers already collected will not be deleted if
  the answer type is changed after submissions have been made.<br />
<br />
<i>* ID </i><br /> - Option to add an ID manually that will be saved to the database and can be used in (reporting) queries. The ID does 
               not show on the survey.
<br />
<br />
<i>* Alias </i><br /> -Option to add an Alias manually that will be saved to the database and can be used in (reporting) queries. The Alias does 
               not show on the survey.
<br />
<br />
<i>* Answer Text </i><br /> - the text that will be shown next to the selection item (radio, checkbox) or inside the dropdown list. 
                <br />
<br />
<i>* Image URL</i><br /> -  option to enter an image URL
  (<a href="http://www.mydomain.com/myimage.gif" target="_blank">http://www.mydomain.com/myimage.gif</a>) in order to show an image instead of
  the answer text. <br />
<br />


<i>* Default Text Value </i><br /> - option to set a default value inside the
  textbox field. It is also possible to fill the textbox with a default
  value coming from an external source using one of the following tags :<br />
<br />

 <code> ##yourquerystringvariablename## </code>-  will set the default text with a query
  string variable's value.<br />
  <code>@@yoursessionvariablename@@ </code>- will set the default text with a session
  variable's value.<br />
  <code>&amp;&amp;yourcookievariablename&amp;&amp; </code>- will set the default text with a cookie
  variable's value.<br />
  <code>%%servervariablename%% </code>- will set the default text with a server side
  variable's value.<br />
<br />

<i>* RegEx Server Side Validation </i><br /> - option to validate (check) the content of the
  textbox field using a 'regular expression'. Several regular expression
  validations are provided out of the box and it is possible to create a 
  new one using the regular expression editor. When answering the survey the validation is done server-side.<br />
<br />
<i>* Mandatory </i><br /> - option to determine if writing an answer in the textbox field is required. When answering the surey this check is done server-side.<br />
<br />


<i>* Pipe Alias </i><br /> - option to specify an alias that we can use in other
  questions by 'piping' the textbox field value. To learn about piping and pipe alias read hte <a href="new/AP_Introduction.aspx" title=" Piping Introduction " > Answer Piping Introduction </a>.
                <br />
<br /> 


<hr style="color:#e2e2e2;" /><h3>More Information</h3><br />
                    <a href="new/AT_Introduction.aspx" title=" Introduction " > Answer Types Introduction </a>	<br />
                <a href="new/Answers Editor.aspx" title=" Answers Editor " >Answers Editor </a>	<br />
                <a href="FieldT_Introduction.aspx" title=" Introduction " > Field Answertypes Introduction </a>	<br />
<br />            </div>
<div id="fillerDiv" class="fillerDiv">&nbsp;</div></div></asp:Content>
