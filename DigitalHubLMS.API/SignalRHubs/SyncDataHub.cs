using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace DigitalHubLMS.API.SignalRHubs
{
    public class SyncDataHub : Hub
    {
        private readonly static Dictionary<int, List<string>> Connections = new Dictionary<int, List<string>>();
        static SyncDataHub()
        {
        }

        public override Task OnConnectedAsync()
        {
            var userId = GetLoggedUserId();
            if (userId != 0)
            {
                if (Connections.ContainsKey(userId))
                {
                    Connections[userId].Add(Context.ConnectionId);
                }
                else
                {
                    Connections[userId] = new List<string> { Context.ConnectionId };
                }
            }


            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            var userId = GetLoggedUserId();
            if (userId != 0)
            {
                if (Connections.ContainsKey(userId))
                {
                    Connections[userId]?.Remove(Context.ConnectionId);
                }
            }

            return base.OnDisconnectedAsync(exception);
        }

        public async Task SendUpdateData(int userId)
        {
            var clients = GetClientsByUserId(userId);
            await clients.SendAsync("newDataInserted");

        }

        private IClientProxy GetClientsByUserId(int userId)
        {
            List<string> connentionIds;
            Connections.TryGetValue(userId, out connentionIds);
            if (connentionIds?.Count > 0)
            {
                return Clients.Clients(connentionIds);
            }
            else
            {
                return null;
            }
        }

        private int GetLoggedUserId()
        {
            try
            {
                var testUserId = "1";
                return Convert.ToInt32(((ClaimsIdentity)Context.User.Identity).FindFirst(ClaimTypes.Name)?.Value ?? testUserId);
            }
            catch
            {

                return 0;
            }
        }

    }
}
