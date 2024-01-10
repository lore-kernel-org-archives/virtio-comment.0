Return-Path: <virtio-comment-return-8898-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50437C3DA6E
	for <virtio-comment@archiver.kernel.org>; Wed, 10 Jan 2024 03:46:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 808A22B028
	for <virtio-comment@archiver.kernel.org>; Wed, 10 Jan 2024 03:46:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 678F4986671
	for <virtio-comment@archiver.kernel.org>; Wed, 10 Jan 2024 03:46:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5B2BF98666F; Wed, 10 Jan 2024 03:46:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4346C986673
	for <virtio-comment@lists.oasis-open.org>; Wed, 10 Jan 2024 03:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704858356; x=1705463156;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDPOPI7xbDD5oA856BhJ16uQs73Xm3jmCz3C/Ve8+xE=;
        b=DfB+Gd4PwHVK7Go0wXbThu2bg4sTkCtcTnXiKwV5QMlwWidRzJQg7MGTKkLaijUNto
         L95VaaUHF/9Ym3h/mE/09cSp2FzQuKcpR+qb5XzNYAHScmN3WpB5tkzQgLruJYR2BY0a
         Tg4D7YZNGucxc/02ivlwEz3eX4GpM9KUf5/O/QMac2Ori/+HODfuptFfwelTdmkG5BSL
         402XYLkov8EI1sxawnRo6dTeJU+n0E0q4rZlwJxEyJ3fi9ZeeljtcV3RZEEeZb3HU+D9
         ErsAjeC8o1wDYPawJv1wv38f0Y32g/LI8bHyMi/X/KKabLENvKyF57kMnAb1RFCeTP06
         o7lw==
X-Gm-Message-State: AOJu0Yw9+qW89kzhk9X1D+zgHKpuZ4x3OooYJfWVsl6ZHhlu1LHyJXxs
	xxb2q08dba9xuwOE8Tmt9CP8OwfPigiaeg1WG4Z3CakFOw1ghw==
X-Google-Smtp-Source: AGHT+IFBpcBlFMkC1kaXib+bsIUiIWtUCE2DEONdP5MsV0mRFEhdMQDFf8tiunLPpMtZLNmpS4T0pteNdBeroJiFVwwd
MIME-Version: 1.0
X-Received: by 2002:a05:620a:469e:b0:780:e6b9:621a with SMTP id
 bq30-20020a05620a469e00b00780e6b9621amr595302qkb.67.1704858355092; Tue, 09
 Jan 2024 19:45:55 -0800 (PST)
Reply-To: Parav Pandit <parav@nvidia.com>
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <calendar-f31007d9-6ee0-47ad-b2c2-86e16fbe73c4@google.com>
Date: Wed, 10 Jan 2024 03:45:55 +0000
From: Parav Pandit <parav@nvidia.com>
To: hengqi@linux.alibaba.com, sburla@marvell.com, si-wei.liu@oracle.com, 
	virtio-comment@lists.oasis-open.org, virtio@lists.oasis-open.org, 
	xuanzhuo@linux.alibaba.com, Parav Pandit <parav@nvidia.com>
Content-Type: multipart/alternative; boundary="000000000000a5e809060e8f449d"
Subject: [virtio-comment] virtio-net collaboration bi-weekly

--000000000000a5e809060e8f449d
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

R2VudGxlIHJlbWluZCBhbmQgdGVzdCBtZXNzYWdlIGZvciBuZXcgbWVldGluZyBpbnZpdGUgdGhp
cyB5ZWFyLg0KDQp2aXJ0aW8tbmV0IGNvbGxhYm9yYXRpb24gYmktd2Vla2x5DQpXZWRuZXNkYXkg
SmFuIDEwLCAyMDI0IOKLhSAxMDozMGFtIOKAkyAxMToxNWFtDQpJbmRpYSBTdGFuZGFyZCBUaW1l
IC0gS29sa2F0YQ0KDQpKb2luIHdpdGggR29vZ2xlIE1lZXQNCmh0dHBzOi8vbWVldC5nb29nbGUu
Y29tL2drai1yYXdpLXVmcD9ocz0yMjQNCg0KDQoJDQpKb2luIGJ5IHBob25lDQooVVMpICsxIDk3
OC00MDMtMDU4NA0KUElOOiA3NTY5Njk3NjQNCg0KTW9yZSBwaG9uZSBudW1iZXJzDQpodHRwczov
L3RlbC5tZWV0L2drai1yYXdpLXVmcD9waW49NzU3MzY4MDc4MzMyNiZocz0wDQoNCg0KQXR0YWNo
bWVudHMNCnZpcnRpby1uZXQgY29sbGFib3JhdGlvbiBiaS13ZWVrbHkgbWVldGluZyBub3RlcyAg
DQpodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC91LzEvZC8xTUUtakZuY3ZQTXdIX0d5
ZUxoaElZZ3FtRmhUQWJsc0lvcHFIQ1paeHVmTS9lZGl0DQoNCkhpIEFsbCxUaGlzIGlzIGEgYmkt
d2Vla2x5IGNvbGxhYm9yYXRpb24gbWVldGluZyBmb3IgdmlydGlvIG5ldCAgDQpzcGVjaWZpY2F0
aW9uIGRldmVsb3BlcnMuUmVuZXdpbmcgdGhlIHNlcmllcy7CoE1lZXRpbmcgYWdlbmRhIGFuZCBt
aW51dGVzICANCmFyZSBjYXB0dXJlZCBhdCBbMV0uWzFdICANCmh0dHBzOi8vZG9jcy5nb29nbGUu
Y29tL2RvY3VtZW50L2QvMU1FLWpGbmN2UE13SF9HeWVMaGhJWWdxbUZoVEFibHNJb3BxSENaWnh1
Zk0vZWRpdD91c3A9c2hhcmluZ8KgLS0tLS0tLWEuICANCkFsbCBkZWNpc2lvbnMgYXJlIHN0aWxs
IG1hZGUgYnkgVEMgZWxlY3Ryb25pYyBiYWxsb3QgYXMgdXN1YWwuIFByb3Bvc2VkICANCmNvbGxh
Ym9yYXRpb24gbWVldGluZ3MgYXJlIHVucmVsYXRlZCB0byBUQyBiYWxsb3QuYi4gQWxsIGRpc2N1
c3Npb25zIGZvbGxvdyAgDQpPQVNJUyBmZWVkYmFjayBsaWNlbnNlLiAgDQpodHRwczovL3d3dy5v
YXNpcy1vcGVuLm9yZy9wb2xpY2llcy1ndWlkZWxpbmVzL2lwci8jYXBwZW5kaXhhDQoNCk9yZ2Fu
aXplcg0KUGFyYXYgUGFuZGl0DQpwYXJhdkBudmlkaWEuY29tDQoNCkd1ZXN0cw0KUGFyYXYgUGFu
ZGl0IC0gb3JnYW5pemVyDQpoZW5ncWlAbGludXguYWxpYmFiYS5jb20NCnNidXJsYUBtYXJ2ZWxs
LmNvbQ0Kc2ktd2VpLmxpdUBvcmFjbGUuY29tDQp2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1v
cGVuLm9yZw0KdmlydGlvQGxpc3RzLm9hc2lzLW9wZW4ub3JnDQp4dWFuemh1b0BsaW51eC5hbGli
YWJhLmNvbQ0KDQoNCg==
--000000000000a5e809060e8f449d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!doctype html><html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:=
schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:offi=
ce"><head><title></title><!--[if !mso]><meta http-equiv=3D"X-UA-Compatible"=
 content=3D"IE=3Dedge"><![endif]--><meta http-equiv=3D"Content-Type" conten=
t=3D"text/html; charset=3DUTF-8"><meta name=3D"viewport" content=3D"width=
=3Ddevice-width,initial-scale=3D1"><meta name=3D"color-scheme" content=3D"l=
ight dark"><meta name=3D"supported-color-schemes" content=3D"light dark">
    <style>
      body, html {
        font-family: Roboto, Helvetica, Arial, sans-serif;
      }

      body {
        margin: 0;
        padding: 0;
        -webkit-font-smoothing: antialiased;
        -webkit-text-size-adjust: 100%;
        -ms-text-size-adjust: 100%;
      }

      #outlook a {
        padding: 0;
      }

      .ReadMsgBody {
        width: 100%;
      }

      .ExternalClass {
        width: 100%;
      }

      .ExternalClass * {
        line-height: 100%;
      }

      table,
      td {
        mso-table-lspace: 0pt;
        mso-table-rspace: 0pt;
      }

      img {
        border: 0;
        height: auto;
        line-height: 100%;
        outline: none;
        text-decoration: none;
        -ms-interpolation-mode: bicubic;
      }

      p {
        display: block;
        margin: 13px 0;
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      @media only screen and (max-width:580px) {
        @-ms-viewport {
          width: 320px;
        }

        @viewport {
          width: 320px;
        }
      }
    </style>
    <!--<![endif]-->
    <!--[if mso]>
          <xml>
          <o:OfficeDocumentSettings>
            <o:AllowPNG/>
            <o:PixelsPerInch>96</o:PixelsPerInch>
          </o:OfficeDocumentSettings>
          </xml>
          <![endif]-->
    <!--[if lte mso 11]>
          <style>
            .outlook-group-fix { width:100% !important; }
          </style>
    <![endif]-->

    <!--[if !mso]><!-- -->
  <style>body, html {font-family:Roboto,Helvetica,Arial,sans-serif;}@font-f=
ace {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4mxP.ttf) forma=
t('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBBc9.ttf) f=
ormat('truetype');
}
@font-face {
  font-family: 'Material Icons Extended';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/materialiconsextended/v149/kJEjBvgX7BgnkSr=
UwT8UnLVc38YydejYY-oE_LvM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Material Icons';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialicons/v137/Gw6kwdfw6UnXLJCcm=
afZyFRXb3BL9rvi0QZG3g.otf) format('opentype');
}

.google-material-icons {
  font-family: 'Google Material Icons';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Material Icons Filled';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlematerialiconsfilled/v113/WWXFlimHYg6=
HKI3TavMkbKdhBmDvgach8TVpeGsuueSZJH4.otf) format('opentype');
}

.google-material-icons-filled {
  font-family: 'Google Material Icons Filled';
  font-weight: normal;
  font-style: normal;
  font-size: 24px;
  line-height: 1;
  letter-spacing: normal;
  text-transform: none;
  display: inline-block;
  white-space: nowrap;
  word-wrap: normal;
  direction: ltr;
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 400;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UaGrENHsxJlGDuGo1OIlL3Owps=
.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 500;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLU94Yt=
zCwM.ttf) format('truetype');
}
@font-face {
  font-family: 'Google Sans';
  font-style: normal;
  font-weight: 700;
  src: url(//fonts.gstatic.com/s/googlesans/v14/4UabrENHsxJlGDuGo1OIlLV154t=
zCwM.ttf) format('truetype');
}
</style><!--<![endif]-->
      <style>
        .body-container {
          padding-left: 16px;
          padding-right: 16px;
        }
      </style>
 =20
      <style>
        u+.body .body-container,
        body[data-outlook-cycle] .body-container,
        #MessageViewBody .body-container {
          padding-left: 0;
          padding-right: 0;
        }
      </style>
 =20
    <style>
      @media only screen and (min-width:580px) {
        .column-per-37 {
          width: 37% !important;
          max-width: 37%;
        }

        .column-per-63 {
          width: 63% !important;
          max-width: 63%;
        }
      }
    </style>
 =20
    <style>
      .appointment-buttons th {
        display: block;
        clear: both;
        float: left;
        margin-top: 12px;
      }

      .appointment-buttons th a {
        float: left;
      }

      #MessageViewBody .appointment-buttons th {
       margin-top: 24px;
      }
    </style>
 =20
    <style>
      @media only screen and (max-width:580px) {
        table.full-width-mobile {
          width: 100% !important;
        }

        td.full-width-mobile {
          width: auto !important;
        }
      }
    </style>
    <style>
      .main-container-inner,
      .info-bar-inner {
        padding: 12px 16px !important;
      }

      .main-column-table-ltr {
        padding-right: 0 !important;
      }

      .main-column-table-rtl {
        padding-left: 0 !important;
      }

      @media only screen and (min-width:580px) {
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .main-column-table-ltr {
          padding-right: 32px !important;
        }

        .main-column-table-rtl {
          padding-left: 32px !important;
        }

        .appointment-buttons th {
          display: table-cell;
          clear: none;
        }
      }

      .primary-text {
        color: #3c4043 !important;
      }

      .secondary-text,
      .phone-number a {
        color: #70757a !important;
      }

      .accent-text {
        color: #1a73e8 !important;
      }

      .accent-text-dark {
        color: #185abc !important;
      }

      .grey-button-text,
      .attachment-chip a {
        color: #5f6368 !important;
      }

      .primary-button {
        background-color: #1a73e8 !important;
      }

      .primary-button-text {
        color: #fff !important;
      }

      .underline-on-hover:hover {
        text-decoration: underline !important;
      }

      .grey-infobar-text {
        color: #202124 !important;
      }

      @media (prefers-color-scheme: dark) {
        .primary-text:not([class^=3D"x_"]) {
          color: #e8eaed !important;
        }

        .secondary-text:not([class^=3D"x_"]),
        .phone-number:not([class^=3D"x_"]) a {
          color: #9aa0a6 !important;
        }

        .grey-button-text:not([class^=3D"x_"]),
        .attachment-chip:not([class^=3D"x_"]) a {
          color: #bdc1c6 !important;
        }

        .accent-text:not([class^=3D"x_"]),
        .hairline-button-text:not([class^=3D"x_"]) {
          color: #8ab4f8 !important;
        }

        .primary-button:not([class^=3D"x_"]) {
          background-color: #8ab4f8 !important;
        }

        .primary-button-text:not([class^=3D"x_"]) {
          color: #202124 !important;
        }
      }
    </style>
    <style>
      @media (prefers-color-scheme: dark) {
        .cse-banner:not([class^=3D"x_"]) {
          background-color: #3c4043 !important; /* Google Grey 800 */
        }

        .encryption-icon:not([class^=3D"x_"]) {
          /* WARNING: This causes the whole style tag to get stripped in Gm=
ail. */
          background-image: url('https://fonts.gstatic.com/s/i/googlemateri=
aliconsfilled/encrypted/v3/gm_grey200-24dp/2x/gm_filled_encrypted_gm_grey20=
0_24dp.png') !important;
        }
      }
    </style>
    <!--[if !mso]><!-->
    <style>
      .prevent-link a {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
      }
    </style>
    <!--<![endif]-->

    <!--[if mso | IE]>
      <style>
        .main-container-inner {
          padding: 24px 32px !important;
        }

        .info-bar-inner {
          padding: 12px 32px !important;
        }

        .cse-banner .encryption-icon {
          /* We use the IE workaround instead. */
          background-image: none !important;
        }

        .cse-banner .encryption-icon .ms-fallback {
          display: block !important;
        }

        /* NB: Some MS clients ignore dark-scheme styling and apply their o=
wn, so there's nothing we can do to help there. */
        @media (prefers-color-scheme: dark) {
          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback {
            display: none !important;
          }

          .cse-banner:not([class^=3D"x_"]) .encryption-icon .ms-fallback-da=
rk {
            display: block !important;
          }
        }
      </style>
    <![endif]-->
  </head><body class=3D"body"><span itemscope itemtype=3D"http://schema.org=
/InformAction"><span style=3D"display:none" itemprop=3D"about" itemscope it=
emtype=3D"http://schema.org/EmailMessage"><meta itemprop=3D"description" co=
ntent=3D"Parav Pandit: Gentle remind and test message for new meeting invit=
e this year."/></span><span itemprop=3D"object" itemscope itemtype=3D"http:=
//schema.org/Event"><meta itemprop=3D"eventStatus" content=3D"http://schema=
.org/EventScheduled"/><span itemprop=3D"publisher" itemscope itemtype=3D"ht=
tp://schema.org/Organization"><meta itemprop=3D"name" content=3D"Google Cal=
endar"/></span><meta itemprop=3D"eventId/googleCalendar" content=3D"5kphppm=
3u089dmnf4bpk46b98a_20240110T050000Z"/><span style=3D"display: none; font-s=
ize: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; width: 0=
; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">virtio-net=
 collaboration bi-weekly</span><span aria-hidden=3D"true"><time itemprop=3D=
"startDate" datetime=3D"20240110T050000Z"></time><time itemprop=3D"endDate"=
 datetime=3D"20240110T054500Z"></time></span><table border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"w=
idth:100%;" class=3D"body-container"><tbody><tr><td style=3D"" class=3D"" a=
lign=3D"left"><!--[if mso | IE]><table border=3D"0" cellpadding=3D"0" cells=
pacing=3D"0" role=3D"presentation"><tr><td height=3D"16" style=3D"height:16=
px;"><![endif]--><div style=3D"height:16px;" aria-hidden=3D"true"> &nbsp; <=
/div><!--[if mso | IE]></td></tr></table><![endif]--><table border=3D"0" ce=
llpadding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" st=
yle=3D"width:100%;" class=3D""><tbody><tr><td style=3D"" class=3D"" align=
=3D"left"><span itemscope itemtype=3D"http://schema.org/EmailMessage"><p it=
emprop=3D"description">Gentle remind and test message for new meeting invit=
e this year.</p></span></td></tr></tbody></table><table border=3D"0" cellpa=
dding=3D"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=
=3D"width:100%;" class=3D""><tbody><tr><td style=3D"border: solid 1px #dadc=
e0; border-radius: 8px; direction: rtl; font-size: 0; padding: 24px 32px; t=
ext-align: left; vertical-align: top;" class=3D"main-container-inner"><!--[=
if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation"><tr><![endif]--><!--[if mso | IE]><td class=3D"" style=3D=
"vertical-align:top;width:37%;" ><![endif]--><div class=3D"column-per-37 ou=
tlook-group-fix" style=3D"font-size: 13px; text-align: left; direction: ltr=
; display: inline-block; vertical-align: top; width: 100%;overflow: hidden;=
 word-wrap: break-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" width=3D"100%"><tbody><tr><td style=3D"vertica=
l-align:top;padding:0;"><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" width=3D"100%"><tr><td style=3D"font-size: 0; =
padding: 0; text-align: left; word-break: break-word;;padding-bottom:28px;"=
><a href=3D"https://meet.google.com/gkj-rawi-ufp?hs=3D224" class=3D"primary=
-button-text" style=3D"display: inline-block;font-family: &#39;Google Sans&=
#39;, Roboto, sans-serif;font-size: 14px; letter-spacing: 0.25px; line-heig=
ht: 20px; mso-line-height-rule: exactly; text-decoration: none; text-transf=
orm: none; word-wrap: break-word; white-space: nowrap;color: #fff;font-weig=
ht: 700;white-space: normal;" target=3D"_blank"><table border=3D"0" cellpad=
ding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"display: inline=
-block"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" st=
yle=3D"background-color: #1a73e8; cursor: auto; padding: 10px 25px; border:=
 none; border-radius: 4px; margin: 0;" class=3D"primary-button"><!--[if mso=
]><a href=3D"https://meet.google.com/gkj-rawi-ufp?hs=3D224" class=3D"primar=
y-button-text" target=3D"_blank"><![endif]--><span class=3D"primary-button-=
text" style=3D"font-family: &#39;Google Sans&#39;, Roboto, sans-serif;font-=
size: 14px; letter-spacing: 0.25px; line-height: 20px; mso-line-height-rule=
: exactly; text-decoration: none; text-transform: none; word-wrap: break-wo=
rd; white-space: nowrap;color: #fff;font-weight: 700;white-space: normal;">=
Join with Google Meet</span><!--[if mso]></a><![endif]--></td></tr></table>=
</a></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; =
word-break: break-word;;padding-bottom:24px;"><div style=3D"font-family: Ro=
boto, sans-serif;font-size: 14px; line-height: 20px; mso-line-height-rule: =
exactly; text-align: left;"><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 c=
lass=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decorat=
ion: none;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; p=
adding: 0;">Meeting link</h2></td></tr></table><!-- Use grey text for the M=
eet link--><div><a style=3D"display: inline-block;;color: #70757a; text-dec=
oration: none;" class=3D"secondary-text underline-on-hover" href=3D"https:/=
/meet.google.com/gkj-rawi-ufp?hs=3D224">meet.google.com/gkj-rawi-ufp</a></d=
iv></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: l=
eft; word-break: break-word;;padding-bottom:24px;"><div style=3D"font-famil=
y: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line-height-r=
ule: exactly; text-align: left;"><table border=3D"0" cellpadding=3D"0" cell=
spacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td>=
<h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c4043; text-de=
coration: none;font-weight: 700;-webkit-font-smoothing: antialiased;margin:=
 0; padding: 0;">Join by phone</h2></td></tr></table><span class=3D"seconda=
ry-text" style=3D"color: #70757a; text-decoration: none;;">(US) </span><a h=
ref=3D"tel:+1-978-403-0584%3B756969764%23" style=3D"display: inline-block;c=
olor: #1a73e8; text-decoration: none;" target=3D"_blank" class=3D"accent-te=
xt underline-on-hover">+1 978-403-0584</a> <br><span class=3D"secondary-tex=
t" style=3D"color: #70757a; text-decoration: none;;">PIN: 756969764</span><=
br><br><a href=3D"https://tel.meet/gkj-rawi-ufp?pin=3D7573680783326&amp;hs=
=3D0" style=3D"display: inline-block;color: #1a73e8; text-decoration: none;=
" target=3D"_blank" class=3D"accent-text underline-on-hover">More phone num=
bers</a><br></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text=
-align: left; word-break: break-word;;padding-bottom:0px;"><div style=3D"fo=
nt-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line-=
height-rule: exactly; text-align: left;" class=3D"primary-text" role=3D"pre=
sentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"=
presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-t=
ext" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-we=
ight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Attac=
hments</h2></td></tr></table></div></td></tr><tr><td style=3D"font-size: 0;=
 padding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;=
padding-left: 1px; padding-right: 1px;"><table border=3D"0" cellpadding=3D"=
0" cellspacing=3D"0" role=3D"presentation" class=3D"attachment-chip" style=
=3D"border: solid 1px #dadce0; border-radius: 16px; border-collapse: separa=
te; padding: 4px 0 4px 0;"><tr><td style=3D"padding: 3px 10px; height: 14px=
; width: 14px;"><img src=3D"https://drive-thirdparty.googleusercontent.com/=
16/type/application/vnd.google-apps.document" width=3D"14" height=3D"14" al=
t=3D"" style=3D"display: inline-block; vertical-align: middle;"></td><td al=
ign=3D"left" style=3D"padding: 0; padding-left: 0; padding-right: 10px; max=
-width: 160px; overflow: hidden; text-overflow: ellipsis; white-space: nowr=
ap;"><div style=3D"overflow: hidden; height: 20px;"><a href=3D"https://docs=
.google.com/document/u/1/d/1ME-jFncvPMwH_GyeLhhIYgqmFhTAblsIopqHCZZxufM/edi=
t" target=3D"_blank" style=3D"font-weight: 400;font-family: &#39;Google San=
s&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 12=
0%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-t=
ransform: none;;font-family: Roboto, sans-serif;; display: inline-block; he=
ight: 20px; max-width: 160px; line-height: 20px; overflow: hidden; text-ove=
rflow: ellipsis; vertical-align: middle; white-space: normal;" class=3D"gre=
y-button-text" title=3D"virtio-net collaboration bi-weekly meeting notes">v=
irtio-net collaborati...</a></div></td></tr></table></td></tr></table></td>=
</tr></tbody></table></div><!--[if mso | IE]></td><![endif]--><!--[if mso |=
 IE]><td class=3D"" style=3D"vertical-align:top;width:63%;padding-right:32p=
x;" ><![endif]--><div class=3D"column-per-63 outlook-group-fix" style=3D"fo=
nt-size: 13px; text-align: left; direction: ltr; display: inline-block; ver=
tical-align: top; width: 100%;overflow: hidden; word-wrap: break-word;"><ta=
ble border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" =
width=3D"100%" class=3D"main-column-table-ltr" style=3D"padding-right: 32px=
; padding-left: 0;;table-layout: fixed;"><tbody><tr><td class=3D"main-colum=
n-td" style=3D"padding:0; vertical-align:top;"><table border=3D"0" cellpadd=
ing=3D"0" cellspacing=3D"0" role=3D"presentation" width=3D"100%" style=3D"t=
able-layout: fixed;"><tr><td style=3D"font-size: 0; padding: 0; text-align:=
 left; word-break: break-word;;padding-bottom:2px;"><div style=3D"font-fami=
ly: &#39;Google Sans&#39;, Roboto, sans-serif;font-weight: 400; font-size: =
22px; line-height: 28px;color: #3c4043; text-decoration: none;" class=3D"pr=
imary-text" role=3D"presentation"><span itemprop=3D"name">virtio-net collab=
oration bi-weekly</span></div></td></tr><tr><td style=3D"font-size: 0; padd=
ing: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"><di=
v style=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight:=
 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4=
043; text-decoration: none;" class=3D"primary-text" role=3D"presentation"><=
span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20240110=
T050000Z"></time><time itemprop=3D"endDate" datetime=3D"20240110T054500Z"><=
/time></span><span>Wednesday Jan 10, 2024 =E2=8B=85 10:30am =E2=80=93 11:15=
am (India Standard Time - Kolkata)</span></div></td></tr><tr><td style=3D"f=
ont-size: 0; padding: 0; text-align: left; word-break: break-word;;padding-=
bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style: nor=
mal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spacing: =
0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" role=
=3D"presentation"><span>Hi All,<br><br>This is a bi-weekly collaboration me=
eting for virtio net specification developers.<br>Renewing the series.<br>=
=C2=A0<br>Meeting agenda and minutes are captured at [1].<br><br>[1] <a hre=
f=3D"https://docs.google.com/document/d/1ME-jFncvPMwH_GyeLhhIYgqmFhTAblsIop=
qHCZZxufM/edit?usp=3Dsharing" target=3D"_blank">https://docs.google.com/doc=
ument/d/1ME-jFncvPMwH_GyeLhhIYgqmFhTAblsIopqHCZZxufM/edit?usp=3Dsharing</a>=
<br>=C2=A0<br>-------<br>a. All decisions are still made by TC electronic b=
allot as usual. Proposed collaboration <span>meetings are unrelated to TC b=
allot.</span><br><span>b. All discussions follow OASIS feedback license. </=
span><a href=3D"https://www.google.com/url?q=3Dhttps%3A%2F%2Fwww.oasis-open=
.org%2Fpolicies-guidelines%2Fipr%2F%23appendixa&amp;sa=3DD&amp;ust=3D170529=
0300000000&amp;usg=3DAOvVaw0tLxNc91eE_1z2yZZ2psp8" target=3D"_blank">https:=
//www.oasis-open.org/policies-guidelines/ipr/#appendixa</a></span><meta ite=
mprop=3D"description" content=3D"Hi All,This is a bi-weekly collaboration m=
eeting for virtio net specification developers.Renewing the series.=C2=A0Me=
eting agenda and minutes are captured at [1].[1] https://docs.google.com/do=
cument/d/1ME-jFncvPMwH_GyeLhhIYgqmFhTAblsIopqHCZZxufM/edit?usp=3Dsharing=C2=
=A0-------a. All decisions are still made by TC electronic ballot as usual.=
 Proposed collaboration meetings are unrelated to TC ballot.b. All discussi=
ons follow OASIS feedback license. https://www.oasis-open.org/policies-guid=
elines/ipr/#appendixa"/></div></td></tr><tr><td style=3D"font-size: 0; padd=
ing: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"><di=
v style=3D"font-family: Roboto, sans-serif;font-style: normal; font-weight:=
 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #3c4=
043; text-decoration: none;" class=3D"primary-text" role=3D"presentation"><=
table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation=
" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-text" style=
=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weight: 700;=
-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Guests</h2></td=
></tr></table><div style=3D"padding-bottom: 4px; text-align: left;;color: #=
3c4042;"><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://sche=
ma.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"pr=
imary-text underline-on-hover" style=3D"display: inline-block;;color: #3c40=
43; text-decoration: none;" href=3D"mailto:parav@nvidia.com">Parav Pandit</=
a></span><meta itemprop=3D"email" content=3D"parav@nvidia.com"/></span><spa=
n itemprop=3D"organizer" itemscope itemtype=3D"http://schema.org/Person"><m=
eta itemprop=3D"name" content=3D"Parav Pandit"/><meta itemprop=3D"email" co=
ntent=3D"parav@nvidia.com"/></span><span class=3D"secondary-text" style=3D"=
color: #70757a; text-decoration: none;"> - organizer</span></div><div><span=
 itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><spa=
n itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underlin=
e-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration=
: none;" href=3D"mailto:hengqi@linux.alibaba.com">hengqi@linux.alibaba.com<=
/a></span><meta itemprop=3D"email" content=3D"hengqi@linux.alibaba.com"/></=
span><span class=3D"secondary-text" style=3D"color: #70757a; text-decoratio=
n: none;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=
=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"=
><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bloc=
k;;color: #3c4043; text-decoration: none;" href=3D"mailto:sburla@marvell.co=
m">sburla@marvell.com</a></span><meta itemprop=3D"email" content=3D"sburla@=
marvell.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a=
; text-decoration: none;"></span></div><div><span itemprop=3D"attendee" ite=
mscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=3D"disp=
lay: inline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:s=
i-wei.liu@oracle.com">si-wei.liu@oracle.com</a></span><meta itemprop=3D"ema=
il" content=3D"si-wei.liu@oracle.com"/></span><span class=3D"secondary-text=
" style=3D"color: #70757a; text-decoration: none;"></span></div><div><span =
itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span=
 itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline=
-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration:=
 none;" href=3D"mailto:virtio-comment@lists.oasis-open.org">virtio-comment@=
lists.oasis-open.org</a></span><meta itemprop=3D"email" content=3D"virtio-c=
omment@lists.oasis-open.org"/></span><span class=3D"secondary-text" style=
=3D"color: #70757a; text-decoration: none;"></span></div><div><span itempro=
p=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itempr=
op=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hov=
er" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;"=
 href=3D"mailto:virtio@lists.oasis-open.org">virtio@lists.oasis-open.org</a=
></span><meta itemprop=3D"email" content=3D"virtio@lists.oasis-open.org"/><=
/span><span class=3D"secondary-text" style=3D"color: #70757a; text-decorati=
on: none;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=
=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"=
><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bloc=
k;;color: #3c4043; text-decoration: none;" href=3D"mailto:xuanzhuo@linux.al=
ibaba.com">xuanzhuo@linux.alibaba.com</a></span><meta itemprop=3D"email" co=
ntent=3D"xuanzhuo@linux.alibaba.com"/></span><span class=3D"secondary-text"=
 style=3D"color: #70757a; text-decoration: none;"></span></div></div></div>=
</td></tr></table></td></tr></tbody></table></div><!--[if mso | IE]></td><!=
[endif]--><!--[if mso | IE]></tr></table><![endif]--></td></tr></tbody></ta=
ble></td></tr></tbody></table></span></span></body></html>
--000000000000a5e809060e8f449d--
