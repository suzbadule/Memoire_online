using System.Data;

namespace OneConnexion
{
    internal interface IConnexion
    {
        IDbConnection Initialise(Connexion connexion, TypeConnexion type);
    }
}
