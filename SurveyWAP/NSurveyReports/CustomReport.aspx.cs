using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing.Printing;
using Microsoft.VisualBasic;
using System.Web.UI.DataVisualization.Charting;

using Votations.NSurvey.BusinessRules;
using Votations.NSurvey.DataAccess;
using Votations.NSurvey.Data;
using Votations.NSurvey.WebAdmin.UserControls;
using Votations.NSurvey.Enums;
using Votations.NSurvey.Security;
using Votations.NSurvey.Helpers;
using Votations.NSurvey.WebControls;

using Votations.NSurvey.WebAdmin.NSurveyAdmin;
using System.Web.UI.HtmlControls;

namespace Votations.NSurvey.WebAdmin
{
    public partial class CustomReport : System.Web.UI.Page
    {

        private int GetIdFromUrl()
        {
            if (Request.PathInfo.Length == 0)
            {
                //MessageLabel.Text = ResourceManager.GetString("InvalidSurveyUrl");
                //MessageLabel.Visible = true;
                return -1;
            }
            string friendlyName = Request.PathInfo.Substring(1);
            int id = new Surveys().GetSurveyIdFromFriendlyName(friendlyName);
            if (id <= 0)
            {
                //MessageLabel.Text = ResourceManager.GetString("InvalidSurveyUrl");
                //MessageLabel.Visible = true;
                return -1;
            }
            return id;
        }
        private int GetIdFromQueryStr()
        {
            Guid guid;
            if (Guid.TryParse(Request[Votations.NSurvey.Constants.Constants.QRYSTRGuid], out guid))
            {
                int id = new Surveys().GetSurveyIdFromGuid(guid);
                if (id <= 0)
                {
                    //MessageLabel.Text = ResourceManager.GetString("InvalidSurveyGuid");
                    //MessageLabel.Visible = true; 
                    return -1;
                }
                else return id;
            }
            else
            {
                //MessageLabel.Text = ResourceManager.GetString("InvalidSurveyGuid");
                //MessageLabel.Visible = true; 
                return -1;
            }
        }
        private int GetSurveyId()
        {
            if (Request[Votations.NSurvey.Constants.Constants.QRYSTRGuid] != null) return GetIdFromQueryStr();
            return GetIdFromUrl();
        }

        public int SurveyId;
        int _voterId;

        /// <summary>
        /// SP Demo data for the Charting Example: yval, xval
        /// </summary>
        // Initialize an array of doubles
        double[] yval = { 20, 9, 40, 55, 3 };

        // Initialize an array of strings
        string[] xval = { "Peter", "Andrew", "Julie", "Mary", "Dave" };


        protected void Page_Load(object sender, EventArgs e)
        {
            int id = GetSurveyId();

            LocalizePage();

            // voterid taken from session created at surveybox.cs:
            if (Session["voterid"] != null)
                _voterId = Convert.ToInt32(Session["voterid"]);



            if (!Page.IsPostBack)
            {
                // Header.SurveyId = SurveyId;
                SurveyId = id;
                BindData();

                //SP Demo charting
                // Bind the double array to the Y axis points of the Default data series
                Chart1.Series["Series1"].Points.DataBindXY(xval, yval);

            }
                // jQuery (necessary for Bootstrap's JavaScript plugins) + answerfieldslideritem.cs
                Page.Header.Controls.Add(new LiteralControl(Environment.NewLine));

                HtmlGenericControl javascriptControl = new HtmlGenericControl("script");
                javascriptControl.Attributes.Add("type", "text/Javascript");
                javascriptControl.Attributes.Add("src", ResolveUrl("~/Scripts/jquery-3.1.1.min.js"));
                Page.Header.Controls.Add(javascriptControl);

                Page.Header.Controls.Add(new LiteralControl(Environment.NewLine));

                javascriptControl = new HtmlGenericControl("script");
                javascriptControl.Attributes.Add("type", "text/Javascript");
                javascriptControl.Attributes.Add("src", ResolveUrl("~/Scripts/jquery-ui-1.12.1.min.js"));
                Page.Header.Controls.Add(javascriptControl);

                Page.Header.Controls.Add(new LiteralControl(Environment.NewLine));
            


        }

        private void LocalizePage()
        {
        }

        private void BindData()
        {

            // Bind data from SP database to datagrid on webpage:
            DataSet customScores = new Reports().GetReportScores(SurveyId, _voterId);

            CustomReportDataGrid.DataSource = customScores;
            CustomReportDataGrid.DataKeyField = "VoterID";
            CustomReportDataGrid.DataBind();
        }



        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.CustomReportDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.BindItemData);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void BindItemData(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            // Hides or shows columns depending on number of values/ answers returned from Stored Procedure

            //0 = voterid
            e.Item.Cells[0].Visible = false;
            //1 = first value
            e.Item.Cells[1].Visible = true;

            //e.Item.Cells[2].Visible = true;
            //e.Item.Cells[3].Visible = true;
            //e.Item.Cells[4].Visible = true;


            e.Item.Cells[e.Item.Cells.Count - 1].Visible = true;

            if (e.Item.ItemType == ListItemType.Header)
            {
                for (int i = 0; i < e.Item.Cells.Count; i++)
                {
                    // Get only the name - ? = to make it non functioning
                    e.Item.Cells[i].Text = (e.Item.Cells[i].Text.Split('?'))[0];
                    e.Item.Cells[i].Wrap = false;
                }
            }
            else
            {
                // Remove time from date
               // e.Item.Cells[3].Text = (e.Item.Cells[3].Text.Split(' '))[0];
                for (int i = 0; i < e.Item.Cells.Count; i++)
                {
                    e.Item.Cells[i].Wrap = false;
                }
            }
        }





    }
}