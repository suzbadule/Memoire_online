using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Librairie.Classes
{
    public class User : Base
    {
        public static User _user;

        public string Username { get; set; }

        public string Password { get; set; }

        public string UsernameSession { get; set; }

        public static User Instance
        {
            get
            {
                if (_user == null)
                    _user = new User();
                return _user;
            }
        }

        public bool Islogged()
        {
            if (this.Username != null)
                return true;
            return false;
        }

        public void UpdateOnlineStatus(User user)
        {
            if (user != null)
            {
                this.UsernameSession = user.Username;
            }
        }
    }
}
