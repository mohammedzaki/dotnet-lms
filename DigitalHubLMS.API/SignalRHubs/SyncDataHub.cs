using DigitalHubLMS.Core.Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using TableDependency.SqlClient;
using TableDependency.SqlClient.Base.Enums;

namespace DigitalHubLMS.API.SignalRHubs
{
    public class SyncDataHub : Hub
    {
        private readonly static ConnectionMapping<string> _connections =
                new ConnectionMapping<string>();

        private bool disposedValue = false;
        private SqlTableDependency<Announcement> _tableDependency;
        static SyncDataHub()
        {
        }

        public override Task OnConnectedAsync()
        {
            var userId = ((ClaimsIdentity)Context.User.Identity).FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (!string.IsNullOrEmpty(userId))
            {
                _connections.Add(userId, Context.ConnectionId);
                Groups.AddToGroupAsync(Context.ConnectionId, userId);
            }
            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            var userId = ((ClaimsIdentity)Context.User.Identity).FindFirst(ClaimTypes.Name)?.Value;
            if (!string.IsNullOrEmpty(userId))
            {
                _connections.Remove(userId, Context.ConnectionId);
            }
            return base.OnDisconnectedAsync(exception);
        }

        public async Task SendUpdateData()
        {
            var userId = ((ClaimsIdentity)Context.User.Identity).FindFirst(ClaimTypes.Name)?.Value;
            var clients = Clients.Clients(_connections.GetConnections(userId));
            await clients.SendAsync("newDataInserted");

        }

        public class ConnectionMapping<T>
        {
            private readonly Dictionary<T, HashSet<string>> _connections =
                new Dictionary<T, HashSet<string>>();

            public int Count
            {
                get
                {
                    return _connections.Count;
                }
            }

            public void Add(T key, string connectionId)
            {
                lock (_connections)
                {
                    HashSet<string> connections;
                    if (!_connections.TryGetValue(key, out connections))
                    {
                        connections = new HashSet<string>();
                        _connections.Add(key, connections);
                    }

                    lock (connections)
                    {
                        connections.Add(connectionId);
                    }
                }
            }

            public IEnumerable<string> GetConnections(T key)
            {
                HashSet<string> connections;
                if (_connections.TryGetValue(key, out connections))
                {
                    return connections;
                }

                return Enumerable.Empty<string>();
            }

            public void Remove(T key, string connectionId)
            {
                lock (_connections)
                {
                    HashSet<string> connections;
                    if (!_connections.TryGetValue(key, out connections))
                    {
                        return;
                    }

                    lock (connections)
                    {
                        connections.Remove(connectionId);

                        if (connections.Count == 0)
                        {
                            _connections.Remove(key);
                        }
                    }
                }
            }
        }

    }
}