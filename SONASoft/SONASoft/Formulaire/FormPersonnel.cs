using DevExpress.XtraEditors;
using Librairie.Classes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SONASoft.Formulaire
{
    public partial class FormPersonnel : Form
    {
        private Form form = null;
        private Service serv = null;
        private Agent agent = null;
        private Conge conge = null;

        public FormPersonnel()
        {
            InitializeComponent();
        }

        private void FormPersonnel_Load(object sender, EventArgs e)
        {
            LoadGridControl();
            LoadCombos();
        }

        private void LoadCombos()
        {
            try
            {
                Glossaire.Instance.LoadCombos("id", "conge", CmbConge);
                Glossaire.Instance.LoadCombos("id", "paie", CmbPaie);
                Glossaire.Instance.LoadCombos("id", "presence", CmbPresence);
                Glossaire.Instance.LoadCombos("id", "service", CmbService);
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void LoadGridControl(int index = 0)
        {
            try
            {
                if (index == 1)
                {
                    DgvService.DataSource = Glossaire.Instance.LoadGrid("service");
                }
                else if (index == 2)
                {
                    DgvConge.DataSource = Glossaire.Instance.LoadGrid("conge");
                }
                else if (index == 3)
                {
                    DgvAgent.DataSource = Glossaire.Instance.LoadGrid("agent");
                }
                else
                {
                    DgvAgent.DataSource = Glossaire.Instance.LoadGrid("agent");
                    DgvService.DataSource = Glossaire.Instance.LoadGrid("service");
                    DgvConge.DataSource = Glossaire.Instance.LoadGrid("conge");
                }
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void ClearFields(int index = 0)
        {
            if (index == 1)
            {
                TxtIdService.Text = "";
                TxtDesignService.Text = "";
                TxtFonctionService.Text = "";
                TxtDesignService.Focus();

                BtnDeleteService.Enabled = false;
                BtnEditService.Enabled = true;
                BtnSaveService.Enabled = true;
            }
            else if (index == 2)
            {
                TxtIdConge.Text = "";
                TxtDebutConge.Text = "";
                TxtFinConge.Text = "";
                TxtDesignConge.Text = "";
                TxtDesignConge.Focus();

                BtnDeleteConge.Enabled = false;
                BtnEditConge.Enabled = true;
                BtnSaveConge.Enabled = true;
            }
            else if (index == 3)
            {
                TxtIdAgent.Text = "";
                TxtMatricule.Text = "";
                TxtNoms.Text = "";
                TxtAdresse.Text = "";
                TxtEmail.Text = "";
                TxtMatricule.Focus();
                CmbConge.SelectedIndex = -1;
                CmbPaie.SelectedIndex = -1;
                CmbPresence.SelectedIndex = -1;
                CmbService.SelectedIndex = -1;

                BtnDeleteAgent.Enabled = false;
                BtnEditAgent.Enabled = true;
                BtnSaveAgent.Enabled = true;
            }
            else
            {
            }
        }

        private void button13_Click(object sender, EventArgs e)
        {
            form = new FormPresence();
            form.ShowDialog(this);
        }

        private void button16_Click(object sender, EventArgs e)
        {
            form = new FormPaie();
            form.ShowDialog(this);
        }

        #region Service

        private void ControleService_Click(object sender, EventArgs e)
        {
            switch (((Control)sender).Name)
            {
                case "BtnNewService":
                    ClearFields(1);
                    break;

                case "BtnSaveService":
                    ControleService(1);
                    break;

                case "BtnEditService":
                    //Controle(2);
                    break;

                case "BtnDeleteService":
                    ControleService(3);
                    break;

                default:
                    break;
            }
        }

        private void ControleService(int operation = 1)
        {
            try
            {
                if (serv == null)
                {
                    serv = new Service();
                }

                serv.Id = string.IsNullOrEmpty(TxtIdService.Text) ? 0 : Convert.ToInt32(TxtIdService.Text);
                serv.Designation = TxtDesignService.Text.Trim().ToUpper();
                serv.Fonctionnalite = TxtFonctionService.Text.Trim().ToUpper();              

                if (operation == 1 || operation == 2)
                {
                    if (!string.IsNullOrEmpty(TxtFonctionService.Text) && !string.IsNullOrEmpty(TxtDesignService.Text))
                    {
                        Glossaire.Instance.InsertUpdateService(serv);
                    }
                    else
                    {
                        MessageBox.Show(this, "Certains champs ne sont pas conformes", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    if (serv.Id != 0)
                    {
                        if (MessageBox.Show(this, "Voulez-vous vraiment supprimer ?", "Question", MessageBoxButtons.OK, MessageBoxIcon.Question) == DialogResult.OK)
                        {
                            Glossaire.Instance.Delete("service", serv.Id);
                        }
                    }
                    else
                    {
                        MessageBox.Show(this, "Selectionne un élément à supprimer", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Une erreur s'est produite lors de cette opération. \nERREUR : " + ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                ClearFields(1);
                LoadGridControl();
            }
        }

        private void GridViewService_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                if (serv == null)
                {
                    serv = new Service();
                }

                serv.Id = Convert.ToInt32(DgvService.SelectedRows[0].Cells["id"].Value.ToString());
                TxtIdService.Text = serv.Id.ToString();

                BtnDeleteService.Enabled = true;
                BtnEditService.Enabled = true;
                BtnSaveService.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Une erreur s'est produite lors de cette opération. \nERREUR : " + ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        #endregion

        #region Conge

        private void ControleConge_Click(object sender, EventArgs e)
        {
            switch (((Control)sender).Name)
            {
                case "BtnNewConge":
                    ClearFields(2);
                    break;

                case "BtnSaveConge":
                    ControleConge(1);
                    break;

                case "BtnEditConge":
                    //Controle(2);
                    break;

                case "BtnDeleteConge":
                    ControleConge(3);
                    break;

                default:
                    break;
            }
        }

        private void ControleConge(int operation = 1)
        {
            try
            {
                if (conge == null)
                {
                    conge = new Conge();
                }

                conge.Id = string.IsNullOrEmpty(TxtIdConge.Text) ? 0 : Convert.ToInt32(TxtIdConge.Text);
                conge.Designation = TxtDesignConge.Text.Trim().ToUpper();
                conge.DateDebut = TxtDebutConge.Text.Trim().ToUpper();
                conge.DateFin = TxtFinConge.Text.Trim().ToUpper();

                if (operation == 1 || operation == 2)
                {
                    if (!string.IsNullOrEmpty(TxtDesignConge.Text) && !string.IsNullOrEmpty(TxtDebutConge.Text)
                        && !string.IsNullOrEmpty(TxtFinConge.Text))
                    {
                        Glossaire.Instance.InsertUpdateConge(conge);
                    }
                    else
                    {
                        MessageBox.Show(this, "Certains champs ne sont pas conformes", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    if (conge.Id != 0)
                    {
                        if (MessageBox.Show(this, "Voulez-vous vraiment supprimer ?", "Question", MessageBoxButtons.OK, MessageBoxIcon.Question) == DialogResult.OK)
                        {
                            Glossaire.Instance.Delete("conge", conge.Id);
                        }
                    }
                    else
                    {
                        MessageBox.Show(this, "Selectionne un élément à supprimer", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Une erreur s'est produite lors de cette opération. \nERREUR : " + ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                ClearFields(2);
                LoadGridControl();
            }
        }

        private void GridViewConge_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                if (conge == null)
                {
                    conge = new Conge();
                }

                conge.Id = Convert.ToInt32(DgvConge.SelectedRows[0].Cells["id"].Value.ToString());
                TxtIdConge.Text = conge.Id.ToString();

                BtnDeleteConge.Enabled = true;
                BtnEditConge.Enabled = true;
                BtnSaveConge.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Une erreur s'est produite lors de cette opération. \nERREUR : " + ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        #endregion

        #region Agent

        private void ControleAgent_Click(object sender, EventArgs e)
        {
            switch (((Control)sender).Name)
            {
                case "BtnNewAgent":
                    ClearFields(3);
                    break;

                case "BtnSaveAgent":
                    ControleAgent(1);
                    break;

                case "BtnEditAgent":
                    //Controle(2);
                    break;

                case "BtnDeleteAgent":
                    ControleAgent(3);
                    break;

                default:
                    break;
            }
        }

        private void ControleAgent(int operation = 1)
        {
            try
            {
                if (agent == null)
                {
                    agent = new Agent();
                }

                agent.Id = string.IsNullOrEmpty(TxtIdAgent.Text) ? 0 : Convert.ToInt32(TxtIdAgent.Text);
                agent.Matricule = TxtMatricule.Text.Trim().ToUpper();
                agent.Nom = TxtNoms.Text.Trim().ToUpper();
                agent.Adresse = TxtAdresse.Text.Trim().ToUpper();
                agent.Email = TxtEmail.Text.Trim().ToUpper();
                agent.RefConge = string.IsNullOrEmpty(CmbConge.Text) ? 0 : Convert.ToInt32(CmbConge.Text);
                agent.RefPaie = string.IsNullOrEmpty(CmbPaie.Text) ? 0 : Convert.ToInt32(CmbPaie.Text);
                agent.RefPresence = string.IsNullOrEmpty(CmbPresence.Text) ? 0 : Convert.ToInt32(CmbPresence.Text);
                agent.RefService = string.IsNullOrEmpty(CmbService.Text) ? 0 : Convert.ToInt32(CmbService.Text);

                if (operation == 1 || operation == 2)
                {
                    if (!string.IsNullOrEmpty(TxtMatricule.Text) && !string.IsNullOrEmpty(TxtNoms.Text)
                        && !string.IsNullOrEmpty(TxtAdresse.Text) && !string.IsNullOrEmpty(CmbPaie.Text))
                    {
                        Glossaire.Instance.InsertUpdateAgent(agent);
                    }
                    else
                    {
                        MessageBox.Show(this, "Certains champs ne sont pas conformes", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    if (agent.Id != 0)
                    {
                        if (MessageBox.Show(this, "Voulez-vous vraiment supprimer ?", "Question", MessageBoxButtons.OK, MessageBoxIcon.Question) == DialogResult.OK)
                        {
                            Glossaire.Instance.Delete("agent", agent.Id);
                        }
                    }
                    else
                    {
                        MessageBox.Show(this, "Selectionne un élément à supprimer", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Une erreur s'est produite lors de cette opération. \nERREUR : " + ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                ClearFields(3);
                LoadGridControl();
            }
        }

        private void GridViewAgent_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                if (agent == null)
                {
                    agent = new Agent();
                }

                agent.Id = Convert.ToInt32(DgvAgent.SelectedRows[0].Cells["id"].Value.ToString());
                TxtIdAgent.Text = agent.Id.ToString();

                BtnDeleteAgent.Enabled = true;
                BtnEditAgent.Enabled = true;
                BtnSaveAgent.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Une erreur s'est produite lors de cette opération. \nERREUR : " + ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        #endregion
    }
}
