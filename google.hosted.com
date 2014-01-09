#==============================================================================
set my_pw_google-apps       = `gpg-wallet google-apps jappelbaum`
set imap_user               = "jappelbaum@google.hosted.com"
set imap_pass               = $my_pw_hawaii
unset imap_authenticators
unset folder
set folder                  = "imaps://imap.gmail.com/"
unset spoolfile
set spoolfile               = +Inbox
unset postponed
set postponed               = +[Gmail]/Drafts
unset record
set imap_check_subscribed
unset imap_passive
set imap_keepalive          = 300
set mail_check              = 600
set rfc2047_parameters      = yes
set reverse_realname        = yes
#------------------------------------------------------------------------------
set realname                = 'jacob appelbaum'
set from                    = 'jappelbaum@google.hosted.com'
set my_username             = 'jappelbaum@google.hosted.com'
set smtp_pass               = $my_pw_google-apps
set hostname                = google.hosted.com
set use_from                = yes
set signature               = /home/hacker/.mutt/.signature
set sig_dashes              = no
set sig_on_top              = yes
set send_charset="utf-8"
set reply_to                = yes
unset pgp_sign_as
set pgp_sign_as             = 1234567807654321
unmy_hdr *
my_hdr OpenPGP: id=1234567807654321123456780765432112345678
unset hdrs
set hdrs                    = yes
unset smtp_authenticators
set smtp_url                = smtps://$my_username:"$smtp_pass"@smtp.googlemail.com
#------------------------------------------------------------------------------
account-hook $folder "set imap_user=$my_username imap_pass=$my_pw_google-apps"
#==============================================================================
