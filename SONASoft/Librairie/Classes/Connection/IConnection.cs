using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Librairie.Classes.Connection
{
    interface IConnection                                                     
    {
        IDbConnection Initialize(Connection connection, ConnectionType connectionType);
    }
}
