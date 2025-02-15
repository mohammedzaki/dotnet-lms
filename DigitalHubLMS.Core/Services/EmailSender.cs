﻿using DigitalHubLMS.Core.Data;
using DigitalHubLMS.Core.Services;
using DigitalHubLMS.Core.Services.Contracts;
using MailKit.Net.Smtp;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DigitalHubLMS.Core.Services
{
    public class EmailSender : IEmailSender
    {
        private EmailConfiguration _emailConfig;
        public EmailSender()
        {
            _emailConfig = new EmailConfiguration();
            _emailConfig.From = "lms@mped.gov.eg";
            _emailConfig.SmtpServer = "mail.ipi.gov.eg";
            _emailConfig.Port = 587;
            _emailConfig.UserName = "lms@mped.gov.eg";
            _emailConfig.Password = "tp45TN$!";
            _emailConfig.FromName = "MPED LMS";

        }

        public void SendEmail(Message message)
        {
            var emailMessage = CreateEmailMessage(message);

            Send(emailMessage);
        }

        private MimeMessage CreateEmailMessage(Message message)
        {
            var emailMessage = new MimeMessage();
            emailMessage.From.Add(new MailboxAddress(_emailConfig.From));
            emailMessage.To.AddRange(message.To);
            emailMessage.Subject = message.Subject;
            emailMessage.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = message.Content };

            return emailMessage;
        }

        private void Send(MimeMessage mailMessage)
        {
            using (var client = new SmtpClient())
            {
                try
                {
                    client.Connect(_emailConfig.SmtpServer, _emailConfig.Port, false);
                    client.AuthenticationMechanisms.Remove("XOAUTH2");
                    client.Authenticate(_emailConfig.UserName, _emailConfig.Password);

                    client.Send(mailMessage);
                }
                catch
                {
                    //log an error message or throw an exception or both.
                    throw;
                }
                finally
                {
                    client.Disconnect(true);
                    client.Dispose();
                }
            }
        }
    }
}
