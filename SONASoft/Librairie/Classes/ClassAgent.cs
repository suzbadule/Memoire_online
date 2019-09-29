using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Librairie.Classes
{
    public class Agent : Base
    {
        public string Matricule { get; set; }

        public string Nom { get; set; }

        public string Adresse { get; set; }

        public string Email { get; set; }

        public int RefService { get; set; }

        public int RefConge { get; set; }

        public int RefPaie { get; set; }

        public int RefPresence { get; set; }
    }
}
