using System;
using System.IO;
using System.Threading.Tasks;
using DinkToPdf;
using DinkToPdf.Contracts;

namespace DigitalHubLMS.API.Utility
{
    public class CertificateGenerator : ICertificateGenerator
    {
        protected readonly IConverter Converter;

        public CertificateGenerator(IConverter converter)
        {
            Converter = converter;
        }

        private static string GetPDFHTML(string certImg, string name, string title, string dateStr)
        {
            return @$"
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <link rel='preconnect' href='https://fonts.googleapis.com'>
                        <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
                        <link href='https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap' rel='stylesheet'>
                    </head>
                    <body>
                        <div class='container'>
                            <img id='bg' src='{certImg}' />
                            <label id='userName'>{name}</label>
                            <label id='courseTitle'>{title}</label>
                            <label id='issuedDate'>{dateStr}</label>
                        </div>
                    </body>
                    </html>
                    ";
        }

        public Task<FileInfo> GeneratePDF(string name, string title)
        {
            return Task.Run(() =>
            {
                var dir = Directory.GetCurrentDirectory();
                var certImg = Path.Combine(dir, "wwwroot/assets/pdf-cert/template.jpg");
                var certTempFilePath = Path.Combine(dir, "wwwroot/temp", Guid.NewGuid().ToString());
                var UserStyleSheet = Path.Combine(dir, "wwwroot/assets/pdf-cert/style.css");
                var dateStr = DateTime.Today.ToString("dd'/'MM'/'yyyy");
                var globalSettings = new GlobalSettings
                {
                    ColorMode = ColorMode.Color,
                    Orientation = Orientation.Landscape,
                    PaperSize = PaperKind.A4,
                    Margins = new MarginSettings { Top = 0, Bottom = 0, Left = 0, Right = 0 },
                    DocumentTitle = "PDF Certificate",
                    Out = certTempFilePath
                };
                var objectSettings = new ObjectSettings
                {
                    HtmlContent = GetPDFHTML(certImg, name, title, dateStr),
                    WebSettings = { DefaultEncoding = "utf-8", UserStyleSheet = UserStyleSheet }
                };
                var pdf = new HtmlToPdfDocument()
                {
                    GlobalSettings = globalSettings,
                    Objects = { objectSettings }
                };
                Converter.Convert(pdf);
                return new FileInfo(certTempFilePath);
            });
        }

    }
}
