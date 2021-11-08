using System;
using System.IO;
using System.Threading.Tasks;

namespace DigitalHubLMS.API.Utility
{
    public interface ICertificateGenerator
    {
        public Task<FileInfo> GeneratePDF(string name, string title);
    }
}
