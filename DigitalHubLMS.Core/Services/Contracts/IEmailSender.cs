using DigitalHubLMS.Core.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DigitalHubLMS.Core.Services.Contracts
{
    public interface IEmailSender
    {
        void SendEmail(Message message);
    }
}
