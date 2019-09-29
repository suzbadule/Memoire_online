using DevExpress.XtraEditors;
using Librairie.Classes;
using System;
using System.Windows.Forms;

namespace SONASoft.Formulaire
{
    public partial class FormPaie : Form
    {
        private Paie paie = null;

        public FormPaie()
        {
            InitializeComponent();
        }

        private void FormPaie_Load(object sender, EventArgs e)
        {
            LoadGridControl();
        }

        private void LoadGridControl()
        {
            try
            {
                DgvPaie.DataSource = Glossaire.Instance.LoadGrid("paie");
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show(ex.Message);
            }
        }

        private void ClearFields()
        {
            TxtId.Text = "";
            TxtAnnee.Text = "";
            TxtAout.Text = "0";
            TxtAvril.Text = "0";
            TxtDec.Text = "0";
            TxtFev.Text = "0";
            TxtJan.Text = "0";
            TxtJuil.Text = "0";
            TxtJuin.Text = "0";
            TxtMai.Text = "0";
            TxtMars.Text = "0";
            TxtNov.Text = "0";
            TxtOct.Text = "0";
            TxtSept.Text = "0";
            TxtAnnee.Focus();

            BtnDelete.Enabled = false;
            BtnEdit.Enabled = true;
            BtnSave.Enabled = true;

        }

        private void Controle_Click(object sender, EventArgs e)
        {
            switch (((Control)sender).Name)
            {
                case "BtnNew":
                    ClearFields();
                    break;

                case "BtnSave":
                    Controle(1);
                    break;

                case "BtnEdit":
                    //Controle(2);
                    break;

                case "BtnDelete":
                    Controle(3);
                    break;

                default:
                    break;
            }
        }

        private void Controle(int operation = 1)
        {
            try
            {
                if (paie == null)
                {
                    paie = new Paie();
                }

                paie.Id = string.IsNullOrEmpty(TxtId.Text) ? 0 : Convert.ToInt32(TxtId.Text);
                paie.Annee = TxtAnnee.Text.Trim().ToUpper();
                paie.Janvier = TxtJan.Text.Trim().ToUpper();
                paie.Fevrier = TxtFev.Text.Trim().ToUpper();
                paie.Mars = TxtMars.Text.Trim().ToUpper();
                paie.Avril = TxtAvril.Text.Trim().ToUpper();
                paie.Mai = TxtMai.Text.Trim().ToUpper();
                paie.Juin = TxtJuin.Text.Trim().ToUpper();
                paie.Juillet = TxtJuil.Text.Trim().ToUpper();
                paie.Aout = TxtAout.Text.Trim().ToUpper();
                paie.Septembre = TxtSept.Text.Trim().ToUpper();
                paie.Octobre = TxtOct.Text.Trim().ToUpper();
                paie.Novembre = TxtNov.Text.Trim().ToUpper();
                paie.Decembre = TxtDec.Text.Trim().ToUpper();

                if (operation == 1 || operation == 2)
                {
                    if (!string.IsNullOrEmpty(TxtAnnee.Text))
                    {
                        Glossaire.Instance.InsertUpdatePaie(paie);
                    }
                    else
                    {
                        MessageBox.Show(this, "Certains champs ne sont pas conformes", "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    if (paie.Id != 0)
                    {
                        if (MessageBox.Show(this, "Voulez-vous vraiment supprimer ?", "Question", MessageBoxButtons.OK, MessageBoxIcon.Question) == DialogResult.OK)
                        {
                            Glossaire.Instance.Delete("paie", paie.Id);
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
                ClearFields();
                LoadGridControl();
            }
        }

        private void GridView_DoubleClick(object sender, EventArgs e)
        {
            try
            {
                if (paie == null)
                {
                    paie = new Paie();
                }

                paie.Id = Convert.ToInt32(DgvPaie.SelectedRows[0].Cells["id"].Value.ToString());
                TxtId.Text = paie.Id.ToString();
                
                BtnDelete.Enabled = true;
                BtnEdit.Enabled = true;
                BtnSave.Enabled = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, "Une erreur s'est produite lors de cette opération. \nERREUR : " + ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
