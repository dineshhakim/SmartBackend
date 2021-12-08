

using System.Threading.Tasks;

namespace SmartBackend.Hub
{
    public interface ITypedHubClient
    {
        Task BroadcastMessage(string type, string payload);
    }
}
