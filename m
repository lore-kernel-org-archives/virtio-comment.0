Return-Path: <virtio-comment-return-6861-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791AFC001B0
	for <virtio-comment@archiver.kernel.org>; Sun, 16 Jul 2023 20:04:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ADE3826A22
	for <virtio-comment@archiver.kernel.org>; Sun, 16 Jul 2023 20:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id 98FDA38F03; Sun, 16 Jul 2023 20:04:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62C6A98640A
	for <virtio-comment@lists.oasis-open.org>; Sun, 16 Jul 2023 20:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689537823; x=1692129823;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZGmKN9vrPaOWOBwaybDI6oEYe6SplI2nabxF4qy+ks=;
        b=AI8c/QCT7gFukag3DEv4TxO5eZNp9txhxPJDeD0SRPqxHG3sgPILUMl1XbjOi5vGcm
         G/Q3oFTilbhFv0DuDT052S/PgYFQGxubWbooCX1SomA7GbDysdYD6EpO3HXxGE3sTtIs
         TFwfm13t2nCzGDR70yVv9Km3CrDj7fmz7qn4Rl8I3S+yfGWMbMDzqDPaEttiJJA1Xenm
         VrCMAoFsAGN/1ldos1bMXGoAnatVo6QJ5RGeOzBxHBa/6Cf9hH3uEO/UgMH1kmCuObRN
         j5CuI2xcwJyAf78RNUaORKfjYSynHMy24ph0XLw7HaMVSIAIuDy59k3Oa4+ndlzgMJpT
         YQZw==
X-Gm-Message-State: ABy/qLYjHa7tgfYAKemVZhzQD1jgKtoBDeIwsdkFOQhsb3y3GhUMMJcp
	heO+2LiaoH/LlzEqmDSeoxEQjffq9HcHSwzmsAu9YqTk5yvAwsk=
X-Google-Smtp-Source: APBJJlG7vob73g/8pJikxEE5Xg0Z5jLIuQ3lja9d9JSrqZsI+kZm1pK5TiFYfa01JxHs38R+hGlPc23nlpOMskrpX4aS
MIME-Version: 1.0
X-Received: by 2002:a0d:e007:0:b0:57a:50ba:b3a0 with SMTP id
 j7-20020a0de007000000b0057a50bab3a0mr10565651ywe.12.1689537823638; Sun, 16
 Jul 2023 13:03:43 -0700 (PDT)
Reply-To: parav@nvidia.com
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <calendar-a2a9d853-d6be-4d7a-88ae-4a6291075a87@google.com>
Date: Sun, 16 Jul 2023 20:03:43 +0000
From: parav@nvidia.com
To: virtio-comment@lists.oasis-open.org, virtio@lists.oasis-open.org, 
	sburla@marvell.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com, 
	si-wei.liu@oracle.com
Content-Type: multipart/mixed; boundary="000000000000d024000600a02d03"
Subject: [virtio-comment] Invitation: virtio-net collaboration bi-weekly @ Wed Jul 26, 2023
 12am - 12:45am (CDT) (virtio-comment@lists.oasis-open.org)

--000000000000d024000600a02d03
Content-Type: multipart/alternative; boundary="000000000000d023fe0600a02d01"

--000000000000d023fe0600a02d01
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

dmlydGlvLW5ldCBjb2xsYWJvcmF0aW9uIGJpLXdlZWtseQ0KV2VkbmVzZGF5IEp1bCAyNiwgMjAy
MyDii4UgMTJhbSDigJMgMTI6NDVhbQ0KQ2VudHJhbCBUaW1lIC0gQ2hpY2Fnbw0KDQpKb2luIHdp
dGggR29vZ2xlIE1lZXQNCmh0dHBzOi8vbWVldC5nb29nbGUuY29tL2drai1yYXdpLXVmcD9ocz0y
MjQNCg0KDQoJDQpKb2luIGJ5IHBob25lDQooVVMpICsxIDk3OC00MDMtMDU4NA0KUElOOiA3NTY5
Njk3NjQNCg0KTW9yZSBwaG9uZSBudW1iZXJzDQpodHRwczovL3RlbC5tZWV0L2drai1yYXdpLXVm
cD9waW49NzU3MzY4MDc4MzMyNiZocz0wDQoNCg0KSGkgQWxsLFRoaXMgaXMgYSBiaS13ZWVrbHkg
Y29sbGFib3JhdGlvbiBtZWV0aW5nIGZvciB2aXJ0aW8gbmV0ICANCnNwZWNpZmljYXRpb24gZGV2
ZWxvcGVycy5UaGlzIHdlZWsgYWdlbmRhOjEuIENsb3NlIG9uIHJlY2VpdmUgZmxvdyBmaWx0ZXJz
ICANCnN0ZWVyaW5nIHJlcXVpcmVtZW50cyBvZiAgDQpbMV1odHRwczovL2xpc3RzLm9hc2lzLW9w
ZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1jb21tZW50LzIwMjMwNi9tc2cwMDAxNS5odG1swqAyLiAg
DQpDb3VudGVycyBhbmQgd2hpY2ggY291bnRlcnMgdmlzaWJpbGl0eSBpbiBkcml2ZXLCoC0tLS0t
LS1hLiBBbGwgZGVjaXNpb25zICANCmFyZSBzdGlsbCBtYWRlIGJ5IFRDIGVsZWN0cm9uaWMgYmFs
bG90IGFzIHVzdWFsLiBQcm9wb3NlZCBjb2xsYWJvcmF0aW9uICANCm1lZXRpbmdzIGFyZSB1bnJl
bGF0ZWQgdG8gVEMgYmFsbG90LmIuIEFsbCBkaXNjdXNzaW9ucyBmb2xsb3cgT0FTSVMgIA0KZmVl
ZGJhY2sgbGljZW5zZS4gIA0KaHR0cHM6Ly93d3cub2FzaXMtb3Blbi5vcmcvcG9saWNpZXMtZ3Vp
ZGVsaW5lcy9pcHIvI2FwcGVuZGl4YQ0KDQpPcmdhbml6ZXINCnBhcmF2QG52aWRpYS5jb20NCnBh
cmF2QG52aWRpYS5jb20NCg0KR3Vlc3RzDQpwYXJhdkBudmlkaWEuY29tIC0gb3JnYW5pemVyDQp2
aXJ0aW9AbGlzdHMub2FzaXMtb3Blbi5vcmcNCnNidXJsYUBtYXJ2ZWxsLmNvbQ0KaGVuZ3FpQGxp
bnV4LmFsaWJhYmEuY29tDQp4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbQ0Kc2ktd2VpLmxpdUBv
cmFjbGUuY29tDQp2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KVmlldyBhbGwg
Z3Vlc3QgaW5mbyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/
YWN0aW9uPVZJRVcmZWlkPU5qVm5kbWQxWXpBNWFuUmtOR1Z5TURWa2MyMWpPR2RoYW5VZ2RtbHlk
R2x2TFdOdmJXMWxiblJBYkdsemRITXViMkZ6YVhNdGIzQmxiaTV2Y21jJnRvaz1NVFlqY0dGeVlY
WkFiblpwWkdsaExtTnZiVEUwTXpBMU1HWTNOREU1TnpJMVkyWmxNMk00WVdRNVlUQXhaR1k1TXpj
MVptRTJOR0ZrTWprJmN0ej1BbWVyaWNhJTJGQ2hpY2FnbyZobD1lbiZlcz0wDQoNClJlcGx5IGZv
ciB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZyBhbmQgdmlldyBtb3JlIGRldGFp
bHMgIA0KaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1W
SUVXJmVpZD1OalZuZG1kMVl6QTVhblJrTkdWeU1EVmtjMjFqT0dkaGFuVWdkbWx5ZEdsdkxXTnZi
VzFsYm5SQWJHbHpkSE11YjJGemFYTXRiM0JsYmk1dmNtYyZ0b2s9TVRZamNHRnlZWFpBYm5acFpH
bGhMbU52YlRFME16QTFNR1kzTkRFNU56STFZMlpsTTJNNFlXUTVZVEF4WkdZNU16YzFabUUyTkdG
a01qayZjdHo9QW1lcmljYSUyRkNoaWNhZ28maGw9ZW4mZXM9MA0KWW91ciBhdHRlbmRhbmNlIGlz
IG9wdGlvbmFsLg0KDQp+fi8vfn4NCkludml0YXRpb24gZnJvbSBHb29nbGUgQ2FsZW5kYXI6IGh0
dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci8NCg0KWW91IGFyZSByZWNlaXZpbmcg
dGhpcyBlbWFpbCBiZWNhdXNlIHlvdSBhcmUgYW4gYXR0ZW5kZWUgb24gdGhlIGV2ZW50LiBUbyAg
DQpzdG9wIHJlY2VpdmluZyBmdXR1cmUgdXBkYXRlcyBmb3IgdGhpcyBldmVudCwgZGVjbGluZSB0
aGlzIGV2ZW50Lg0KDQpGb3J3YXJkaW5nIHRoaXMgaW52aXRhdGlvbiBjb3VsZCBhbGxvdyBhbnkg
cmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0byAgDQp0aGUgb3JnYW5pemVyLCBiZSBhZGRl
ZCB0byB0aGUgZ3Vlc3QgbGlzdCwgaW52aXRlIG90aGVycyByZWdhcmRsZXNzIG9mICANCnRoZWly
IG93biBpbnZpdGF0aW9uIHN0YXR1cywgb3IgbW9kaWZ5IHlvdXIgUlNWUC4NCg0KTGVhcm4gbW9y
ZSBodHRwczovL3N1cHBvcnQuZ29vZ2xlLmNvbS9jYWxlbmRhci9hbnN3ZXIvMzcxMzUjZm9yd2Fy
ZGluZw0K
--000000000000d023fe0600a02d01
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
emtype=3D"http://schema.org/Person"><meta itemprop=3D"description" content=
=3D"Invitation from parav@nvidia.com"/></span><span itemprop=3D"object" ite=
mscope itemtype=3D"http://schema.org/Event"><meta itemprop=3D"eventStatus" =
content=3D"http://schema.org/EventScheduled"/><span itemprop=3D"publisher" =
itemscope itemtype=3D"http://schema.org/Organization"><meta itemprop=3D"nam=
e" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/googleCale=
ndar" content=3D"65gvguc09jtd4er05dsmc8gaju"/><span style=3D"display: none;=
 font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; w=
idth: 0; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">vir=
tio-net collaboration bi-weekly</span><meta itemprop=3D"url" content=3D"htt=
ps://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNjVndmd1YzA=
5anRkNGVyMDVkc21jOGdhanUgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&am=
p;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbTE0MzA1MGY3NDE5NzI1Y2ZlM2M4YWQ5YTAxZGY5Mzc=
1ZmE2NGFkMjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0"/><span ari=
a-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20230726T050000Z=
"></time><time itemprop=3D"endDate" datetime=3D"20230726T054500Z"></time></=
span><div style=3D"display: none; font-size: 1px; color: #fff; line-height:=
 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity: 0; overflo=
w: hidden;">Join with Google Meet =E2=80=93 Hi All,This is a bi-weekly coll=
aboration meeting for virtio net specification developers.This week agenda:=
1. Close on receive flow filters steering requirements of [1]https://lists.=
oasis-open.org/arch</div><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%;" class=
=3D"body-container"><tbody><tr><td style=3D"" class=3D"" align=3D"left"><!-=
-[if mso | IE]><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation"><tr><td height=3D"16" style=3D"height:16px;"><![endif]-->=
<div style=3D"height:16px;" aria-hidden=3D"true"> &nbsp; </div><!--[if mso =
| IE]></td></tr></table><![endif]--><table border=3D"0" cellpadding=3D"0" c=
ellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%=
;" class=3D""><tbody><tr><td style=3D"border: solid 1px #dadce0; border-rad=
ius: 8px; direction: rtl; font-size: 0; padding: 24px 32px; text-align: lef=
t; vertical-align: top;" class=3D"main-container-inner"><!--[if mso | IE]><=
table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation=
"><tr><![endif]--><!--[if mso | IE]><td class=3D"" style=3D"vertical-align:=
top;width:37%;" ><![endif]--><div class=3D"column-per-37 outlook-group-fix"=
 style=3D"font-size: 13px; text-align: left; direction: ltr; display: inlin=
e-block; vertical-align: top; width: 100%;overflow: hidden; word-wrap: brea=
k-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" width=3D"100%"><tbody><tr><td style=3D"vertical-align:top;paddi=
ng:0;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pres=
entation" width=3D"100%"><tr><td style=3D"font-size: 0; padding: 0; text-al=
ign: left; word-break: break-word;;padding-bottom:28px;"><a href=3D"https:/=
/meet.google.com/gkj-rawi-ufp?hs=3D224" class=3D"primary-button-text" style=
=3D"display: inline-block;font-family: &#39;Google Sans&#39;, Roboto, sans-=
serif;font-size: 14px; letter-spacing: 0.25px; line-height: 20px; mso-line-=
height-rule: exactly; text-decoration: none; text-transform: none; word-wra=
p: break-word; white-space: nowrap;color: #fff;font-weight: 700;white-space=
: normal;" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" role=3D"presentation" style=3D"display: inline-block"><tr><td ali=
gn=3D"center" role=3D"presentation" valign=3D"middle" style=3D"background-c=
olor: #1a73e8; cursor: auto; padding: 10px 25px; border: none; border-radiu=
s: 4px; margin: 0;" class=3D"primary-button"><!--[if mso]><a href=3D"https:=
//meet.google.com/gkj-rawi-ufp?hs=3D224" class=3D"primary-button-text" targ=
et=3D"_blank"><![endif]--><span class=3D"primary-button-text" style=3D"font=
-family: &#39;Google Sans&#39;, Roboto, sans-serif;font-size: 14px; letter-=
spacing: 0.25px; line-height: 20px; mso-line-height-rule: exactly; text-dec=
oration: none; text-transform: none; word-wrap: break-word; white-space: no=
wrap;color: #fff;font-weight: 700;white-space: normal;">Join with Google Me=
et</span><!--[if mso]></a><![endif]--></td></tr></table></a></td></tr><tr><=
td style=3D"font-size: 0; padding: 0; text-align: left; word-break: break-w=
ord;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;fo=
nt-size: 14px; line-height: 20px; mso-line-height-rule: exactly; text-align=
: left;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"pr=
esentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"primary-tex=
t" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;font-weig=
ht: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">Meeting=
 link</h2></td></tr></table><!-- Use grey text for the Meet link--><div><a =
style=3D"display: inline-block;;color: #70757a; text-decoration: none;" cla=
ss=3D"secondary-text underline-on-hover" href=3D"https://meet.google.com/gk=
j-rawi-ufp?hs=3D224">meet.google.com/gkj-rawi-ufp</a></div></div></td></tr>=
<tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: br=
eak-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-ser=
if;font-size: 14px; line-height: 20px; mso-line-height-rule: exactly; text-=
align: left;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=
=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"prima=
ry-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;fon=
t-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">J=
oin by phone</h2></td></tr></table><span class=3D"secondary-text" style=3D"=
color: #70757a; text-decoration: none;;">(US) </span><a href=3D"tel:+1-978-=
403-0584%3B756969764%23" style=3D"display: inline-block;color: #1a73e8; tex=
t-decoration: none;" target=3D"_blank" class=3D"accent-text underline-on-ho=
ver">+1 978-403-0584</a> <br><span class=3D"secondary-text" style=3D"color:=
 #70757a; text-decoration: none;;">PIN: 756969764</span><br><br><a href=3D"=
https://tel.meet/gkj-rawi-ufp?pin=3D7573680783326&amp;hs=3D0" style=3D"disp=
lay: inline-block;color: #1a73e8; text-decoration: none;" target=3D"_blank"=
 class=3D"accent-text underline-on-hover">More phone numbers</a><br></div><=
/td></tr></table></td></tr></tbody></table></div><!--[if mso | IE]></td><![=
endif]--><!--[if mso | IE]><td class=3D"" style=3D"vertical-align:top;width=
:63%;padding-right:32px;" ><![endif]--><div class=3D"column-per-63 outlook-=
group-fix" style=3D"font-size: 13px; text-align: left; direction: ltr; disp=
lay: inline-block; vertical-align: top; width: 100%;overflow: hidden; word-=
wrap: break-word;"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
role=3D"presentation" width=3D"100%" class=3D"main-column-table-ltr" style=
=3D"padding-right: 32px; padding-left: 0;;table-layout: fixed;"><tbody><tr>=
<td class=3D"main-column-td" style=3D"padding:0; vertical-align:top;"><tabl=
e border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation" wi=
dth=3D"100%" style=3D"table-layout: fixed;"><tr><td style=3D"font-size: 0; =
padding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;"=
><div style=3D"font-family: Roboto, sans-serif;font-style: normal; font-wei=
ght: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: =
#3c4043; text-decoration: none;" class=3D"primary-text" role=3D"presentatio=
n"><span>Hi All,<br><br>This is a bi-weekly collaboration meeting for virti=
o net specification developers.<br><br>This week agenda:<br>1. Close on rec=
eive flow filters steering requirements of [1]<br><a href=3D"https://www.go=
ogle.com/url?q=3Dhttps%3A%2F%2Flists.oasis-open.org%2Farchives%2Fvirtio-com=
ment%2F202306%2Fmsg00015.html&amp;sa=3DD&amp;ust=3D1689969780000000&amp;usg=
=3DAOvVaw1vnZyOXRKH-4U6G6_6A4Bg" target=3D"_blank">https://lists.oasis-open=
.org/archives/virtio-comment/202306/msg00015.html</a><br>=C2=A0<br>2. Count=
ers and which counters visibility in driver<br><br>=C2=A0-------<br>a. All =
decisions are still made by TC electronic ballot as usual. Proposed collabo=
ration <span>meetings are unrelated to TC ballot.</span><br><span>b. All di=
scussions follow OASIS feedback license. </span><a href=3D"https://www.goog=
le.com/url?q=3Dhttps%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fipr=
%2F%23appendixa&amp;sa=3DD&amp;ust=3D1689969780000000&amp;usg=3DAOvVaw31sXl=
OVbq1_Wk__o8I8kEb" target=3D"_blank">https://www.oasis-open.org/policies-gu=
idelines/ipr/#appendixa</a></span><meta itemprop=3D"description" content=3D=
"Hi All,This is a bi-weekly collaboration meeting for virtio net specificat=
ion developers.This week agenda:1. Close on receive flow filters steering r=
equirements of [1]https://lists.oasis-open.org/archives/virtio-comment/2023=
06/msg00015.html=C2=A02. Counters and which counters visibility in driver=
=C2=A0-------a. All decisions are still made by TC electronic ballot as usu=
al. Proposed collaboration meetings are unrelated to TC ballot.b. All discu=
ssions follow OASIS feedback license. https://www.oasis-open.org/policies-g=
uidelines/ipr/#appendixa"/></div></td></tr><tr><td style=3D"font-size: 0; p=
adding: 0; text-align: left; word-break: break-word;;padding-bottom:24px;">=
<div style=3D"font-family: Roboto, sans-serif;font-style: normal; font-weig=
ht: 400; font-size: 14px; line-height: 20px; letter-spacing: 0.2px;color: #=
3c4043; text-decoration: none;" class=3D"primary-text" role=3D"presentation=
"><span aria-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20230=
726T050000Z"></time><time itemprop=3D"endDate" datetime=3D"20230726T054500Z=
"></time></span><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" rol=
e=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D"prim=
ary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: none;fo=
nt-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding: 0;">=
When</h2></td></tr></table><span>Wednesday Jul 26, 2023 =E2=8B=85 12am =E2=
=80=93 12:45am (Central Time - Chicago)</span></div></td></tr><tr><td style=
=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;pad=
ding-bottom:24px;"><div style=3D"font-family: Roboto, sans-serif;font-style=
: normal; font-weight: 400; font-size: 14px; line-height: 20px; letter-spac=
ing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"primary-text" r=
ole=3D"presentation"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0=
" role=3D"presentation" style=3D"padding-bottom: 4px;"><tr><td><h2 class=3D=
"primary-text" style=3D"font-size: 14px;color: #3c4043; text-decoration: no=
ne;font-weight: 700;-webkit-font-smoothing: antialiased;margin: 0; padding:=
 0;">Guests</h2></td></tr></table><div style=3D"padding-bottom: 4px; text-a=
lign: left;;color: #3c4042;"><div><span itemprop=3D"attendee" itemscope ite=
mtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notrans=
late"><a class=3D"primary-text underline-on-hover" style=3D"display: inline=
-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:parav@nvidia=
.com">parav@nvidia.com</a></span><meta itemprop=3D"email" content=3D"parav@=
nvidia.com"/></span><span itemprop=3D"organizer" itemscope itemtype=3D"http=
://schema.org/Person"><meta itemprop=3D"name" content=3D"parav@nvidia.com"/=
><meta itemprop=3D"email" content=3D"parav@nvidia.com"/></span><span class=
=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;"> - org=
anizer</span></div><div><span itemprop=3D"attendee" itemscope itemtype=3D"h=
ttp://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"><a c=
lass=3D"primary-text underline-on-hover" style=3D"display: inline-block;;co=
lor: #3c4043; text-decoration: none;" href=3D"mailto:virtio@lists.oasis-ope=
n.org">virtio@lists.oasis-open.org</a></span><meta itemprop=3D"email" conte=
nt=3D"virtio@lists.oasis-open.org"/></span><span class=3D"secondary-text" s=
tyle=3D"color: #70757a; text-decoration: none;"></span></div><div><span ite=
mprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span it=
emprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on=
-hover" style=3D"display: inline-block;;color: #3c4043; text-decoration: no=
ne;" href=3D"mailto:sburla@marvell.com">sburla@marvell.com</a></span><meta =
itemprop=3D"email" content=3D"sburla@marvell.com"/></span><span class=3D"se=
condary-text" style=3D"color: #70757a; text-decoration: none;"></span></div=
><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/P=
erson"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-te=
xt underline-on-hover" style=3D"display: inline-block;;color: #3c4043; text=
-decoration: none;" href=3D"mailto:hengqi@linux.alibaba.com">hengqi@linux.a=
libaba.com</a></span><meta itemprop=3D"email" content=3D"hengqi@linux.aliba=
ba.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a; tex=
t-decoration: none;"></span></div><div><span itemprop=3D"attendee" itemscop=
e itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"no=
translate"><a class=3D"primary-text underline-on-hover" style=3D"display: i=
nline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:xuanzhu=
o@linux.alibaba.com">xuanzhuo@linux.alibaba.com</a></span><meta itemprop=3D=
"email" content=3D"xuanzhuo@linux.alibaba.com"/></span><span class=3D"secon=
dary-text" style=3D"color: #70757a; text-decoration: none;"></span></div><d=
iv><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Pers=
on"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text =
underline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-de=
coration: none;" href=3D"mailto:si-wei.liu@oracle.com">si-wei.liu@oracle.co=
m</a></span><meta itemprop=3D"email" content=3D"si-wei.liu@oracle.com"/></s=
pan><span class=3D"secondary-text" style=3D"color: #70757a; text-decoration=
: none;"></span></div><div><span itemprop=3D"attendee" itemscope itemtype=
=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notranslate"=
><a class=3D"primary-text underline-on-hover" style=3D"display: inline-bloc=
k;;color: #3c4043; text-decoration: none;" href=3D"mailto:virtio-comment@li=
sts.oasis-open.org">virtio-comment@lists.oasis-open.org</a></span><meta ite=
mprop=3D"email" content=3D"virtio-comment@lists.oasis-open.org"/></span><sp=
an class=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;=
"></span></div></div><a href=3D"https://calendar.google.com/calendar/event?=
action=3DVIEW&amp;eid=3DNjVndmd1YzA5anRkNGVyMDVkc21jOGdhanUgdmlydGlvLWNvbW1=
lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbTE0MzA1=
MGY3NDE5NzI1Y2ZlM2M4YWQ5YTAxZGY5Mzc1ZmE2NGFkMjk&amp;ctz=3DAmerica%2FChicago=
&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;color: #1a73e8; te=
xt-decoration: none;font-weight: 700;" target=3D"_blank" class=3D"accent-te=
xt underline-on-hover">View all guest info</a></div></td></tr><tr><td style=
=3D"font-size: 0; padding: 0; text-align: left; word-break: break-word;;pad=
ding-bottom:0px;"><div style=3D"color: #3c4043; text-decoration: none;;font=
-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line-he=
ight-rule: exactly; text-align: left;" class=3D"primary-text"><div><span st=
yle=3D"font-weight: 700;-webkit-font-smoothing: antialiased;">Reply</span><=
span class=3D"secondary-text" style=3D"color: #70757a; text-decoration: non=
e;"> for <a class=3D"secondary-text underline-on-hover" style=3D"display: i=
nline-block;;color: #70757a; text-decoration: none;" href=3D"mailto:virtio-=
comment@lists.oasis-open.org">virtio-comment@lists.oasis-open.org</a></span=
></div></div></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-alig=
n: left; word-break: break-word;;padding-bottom:16px;"><div style=3D"font-f=
amily: Roboto, sans-serif;font-size: 14px; line-height: 20px; mso-line-heig=
ht-rule: exactly; text-align: left;"><table border=3D"0" cellpadding=3D"0" =
cellspacing=3D"0" role=3D"presentation" style=3D"border-collapse: separate;=
"><tr><td style=3D"padding-top: 8px; padding-left: 0; padding-right: 12px;"=
><!-- RSVP buttons --><table border=3D"0" cellpadding=3D"0" cellspacing=3D"=
0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-radius:=
 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, Roboto=
, sans-serif;;display: inline-block;;margin-right: 12px; margin-left: 0;"><=
tr><td align=3D"center" vertical-align=3D"middle" role=3D"presentation"><sp=
an itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/Rsv=
pAction"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAtt=
endance/Yes"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schem=
a.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.or=
g/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https:=
//calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DNjVndmd1YzA=
5anRkNGVyMDVkc21jOGdhanUgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&am=
p;rst=3D1&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbTE0MzA1MGY3NDE5NzI1Y2ZlM2M4YWQ=
5YTAxZGY5Mzc1ZmE2NGFkMjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0=
" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, san=
s-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height=
-rule: exactly; margin: 0; text-decoration: none; text-transform: none;" cl=
ass=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td al=
ign=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padding: 6p=
x 0; padding-left: 16px; padding-right: 12px; white-space: nowrap;"><!--[if=
 mso]><a href=3D"https://calendar.google.com/calendar/event?action=3DRESPON=
D&amp;eid=3DNjVndmd1YzA5anRkNGVyMDVkc21jOGdhanUgdmlydGlvLWNvbW1lbnRAbGlzdHM=
ub2FzaXMtb3Blbi5vcmc&amp;rst=3D1&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbTE0MzA1=
MGY3NDE5NzI1Y2ZlM2M4YWQ5YTAxZGY5Mzc1ZmE2NGFkMjk&amp;ctz=3DAmerica%2FChicago=
&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"url" target=
=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"font-weig=
ht: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: #5f63=
68; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly; marg=
in: 0; text-decoration: none; text-transform: none;">Yes</span><!--[if mso]=
></a><![endif]--></td></tr></table></a></span></span></span></td><td align=
=3D"center" vertical-align=3D"middle" role=3D"presentation" style=3D"border=
-left: solid 1px #dadce0; border-right: solid 1px #dadce0;"><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/No"=
/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpAc=
tionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReques=
tMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https://calendar.g=
oogle.com/calendar/event?action=3DRESPOND&amp;eid=3DNjVndmd1YzA5anRkNGVyMDV=
kc21jOGdhanUgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;rst=3D2&am=
p;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbTE0MzA1MGY3NDE5NzI1Y2ZlM2M4YWQ5YTAxZGY5Mzc=
1ZmE2NGFkMjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0" style=3D"f=
ont-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;colo=
r: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exact=
ly; margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-=
button-text" itemprop=3D"url" target=3D"_blank"><table border=3D"0" cellpad=
ding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td align=3D"center"=
 role=3D"presentation" valign=3D"middle" style=3D"padding: 6px 12px; white-=
space: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calenda=
r/event?action=3DRESPOND&amp;eid=3DNjVndmd1YzA5anRkNGVyMDVkc21jOGdhanUgdmly=
dGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;rst=3D2&amp;tok=3DMTYjcGFyY=
XZAbnZpZGlhLmNvbTE0MzA1MGY3NDE5NzI1Y2ZlM2M4YWQ5YTAxZGY5Mzc1ZmE2NGFkMjk&amp;=
ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" =
itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-t=
ext" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, =
sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-hei=
ght-rule: exactly; margin: 0; text-decoration: none; text-transform: none;"=
>No</span><!--[if mso]></a><![endif]--></td></tr></table></a></span></span>=
</span></td><td align=3D"center" vertical-align=3D"middle" role=3D"presenta=
tion"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schem=
a.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.or=
g/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"h=
ttp://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http:=
//schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a hre=
f=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3D=
NjVndmd1YzA5anRkNGVyMDVkc21jOGdhanUgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3B=
lbi5vcmc&amp;rst=3D3&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbTE0MzA1MGY3NDE5NzI1=
Y2ZlM2M4YWQ5YTAxZGY5Mzc1ZmE2NGFkMjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den=
&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, =
Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-=
line-height-rule: exactly; margin: 0; text-decoration: none; text-transform=
: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><tab=
le border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><=
tr><td align=3D"center" role=3D"presentation" valign=3D"middle" style=3D"pa=
dding: 6px 0; padding-left: 12px; padding-right: 16px; white-space: nowrap;=
"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DNjVndmd1YzA5anRkNGVyMDVkc21jOGdhanUgdmlydGlvLWNvbW1lbn=
RAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;rst=3D3&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmN=
vbTE0MzA1MGY3NDE5NzI1Y2ZlM2M4YWQ5YTAxZGY5Mzc1ZmE2NGFkMjk&amp;ctz=3DAmerica%=
2FChicago&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=3D"ur=
l" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" style=3D"=
font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;col=
or: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exac=
tly; margin: 0; text-decoration: none; text-transform: none;">Maybe</span><=
!--[if mso]></a><![endif]--></td></tr></table></a></span></span></span></td=
></tr></table><!-- More options --><a href=3D"https://calendar.google.com/c=
alendar/event?action=3DVIEW&amp;eid=3DNjVndmd1YzA5anRkNGVyMDVkc21jOGdhanUgd=
mlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;tok=3DMTYjcGFyYXZAbnZpZG=
lhLmNvbTE0MzA1MGY3NDE5NzI1Y2ZlM2M4YWQ5YTAxZGY5Mzc1ZmE2NGFkMjk&amp;ctz=3DAme=
rica%2FChicago&amp;hl=3Den&amp;es=3D0" style=3D"display: inline-block;;font=
-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-serif;color: =
#5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule: exactly;=
 margin: 0; text-decoration: none; text-transform: none;" class=3D"grey-but=
ton-text" target=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspaci=
ng=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; border-r=
adius: 16px; border-collapse: separate;font-family: &#39;Google Sans&#39;, =
Roboto, sans-serif;"><tr><td align=3D"center" vertical-align=3D"middle" rol=
e=3D"presentation" style=3D"padding: 6px 0; padding-left: 16px; padding-rig=
ht: 12px; white-space: nowrap;;color: #5f6367;"><!--[if mso]><a href=3D"htt=
ps://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNjVndmd1YzA=
5anRkNGVyMDVkc21jOGdhanUgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&am=
p;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbTE0MzA1MGY3NDE5NzI1Y2ZlM2M4YWQ5YTAxZGY5Mzc=
1ZmE2NGFkMjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0" class=3D"g=
rey-button-text" target=3D"_blank"><![endif]--><span class=3D"grey-button-t=
ext" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, =
sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-hei=
ght-rule: exactly; margin: 0; text-decoration: none; text-transform: none;"=
>More options</span><!--[if mso]></a><![endif]--></td></tr></table></a></td=
></tr></table></div></td></tr></table></td></tr></tbody></table></div><!--[=
if mso | IE]></td><![endif]--><!--[if mso | IE]></tr></table><![endif]--></=
td></tr></tbody></table><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" align=3D"center" style=3D"width:100%;" class=
=3D""><tbody><tr><td style=3D"font-size: 0; padding: 0; text-align: left; w=
ord-break: break-word;;padding:4px 12px;" class=3D"" align=3D"left"><div cl=
ass=3D"secondary-text" style=3D"color: #70757a; text-decoration: none;font-=
family: Roboto, sans-serif;font-size: 12px; line-height: 16px; mso-line-hei=
ght-rule: exactly; text-align: left;"><p>Invitation from <a href=3D"https:/=
/calendar.google.com/calendar/" class=3D"accent-text underline-on-hover" st=
yle=3D"font-family: Roboto, sans-serif;font-size: 12px; line-height: 16px; =
mso-line-height-rule: exactly;;color: #1a73e8; text-decoration: none;" targ=
et=3D"_blank">Google Calendar</a></p><p>You are receiving this email becaus=
e you are an attendee on the event. To stop receiving future updates for th=
is event, decline this event.</p><p>Forwarding this invitation could allow =
any recipient to send a response to the organizer, be added to the guest li=
st, invite others regardless of their own invitation status, or modify your=
 RSVP. <a class=3D"accent-text underline-on-hover" style=3D"font-family: Ro=
boto, sans-serif;font-size: 12px; line-height: 16px; mso-line-height-rule: =
exactly;;color: #1a73e8; text-decoration: none;" href=3D"https://support.go=
ogle.com/calendar/answer/37135#forwarding">Learn more</a></p></div></td></t=
r></tbody></table></td></tr></tbody></table></span></span></body></html>
--000000000000d023fe0600a02d01
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: quoted-printable

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20230726T050000Z
DTEND:20230726T054500Z
DTSTAMP:20230716T200343Z
ORGANIZER;CN=3Dparav@nvidia.com:mailto:parav@nvidia.com
UID:65gvguc09jtd4er05dsmc8gaju@google.com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dvirtio@lists.oasis-open.org;X-NUM-GUESTS=3D0:mailto:virtio@lists=
.oasi
 s-open.org
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DACCEPTED;RSV=
P=3DTRUE
 ;CN=3Dparav@nvidia.com;X-NUM-GUESTS=3D0:mailto:parav@nvidia.com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dsburla@marvell.com;X-NUM-GUESTS=3D0:mailto:sburla@marvell.com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dhengqi@linux.alibaba.com;X-NUM-GUESTS=3D0:mailto:hengqi@linux.al=
ibaba
 .com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dxuanzhuo@linux.alibaba.com;X-NUM-GUESTS=3D0:mailto:xuanzhuo@linu=
x.ali
 baba.com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dsi-wei.liu@oracle.com;X-NUM-GUESTS=3D0:mailto:si-wei.liu@oracle.=
com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dvirtio-comment@lists.oasis-open.org;X-NUM-GUESTS=3D0:mailto:virt=
io-co
 mment@lists.oasis-open.org
X-GOOGLE-CONFERENCE:https://meet.google.com/gkj-rawi-ufp
X-MICROSOFT-CDO-OWNERAPPTID:1101814344
CREATED:20230716T200341Z
DESCRIPTION:Hi All\,<br><br>This is a bi-weekly collaboration meeting for v
 irtio net specification developers.<br><br>This week agenda:<br>1. Close o=
n
  receive flow filters steering requirements of [1]<br><a href=3D"https://l=
ist
 s.oasis-open.org/archives/virtio-comment/202306/msg00015.html">https://lis=
t
 s.oasis-open.org/archives/virtio-comment/202306/msg00015.html</a><br>=C2=
=A0<br>2
 . Counters and which counters visibility in driver<br><br>=C2=A0-------<br=
>a. Al
 l decisions are still made by TC electronic ballot as usual. Proposed coll=
a
 boration <span>meetings are unrelated to TC ballot.</span><br><span>b. All=
=20
 discussions follow OASIS feedback license. </span><a href=3D"https://www.o=
asi
 s-open.org/policies-guidelines/ipr/#appendixa">https://www.oasis-open.org/=
p
 olicies-guidelines/ipr/#appendixa</a>\n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~=
:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nJoin with Google Me=
e
 t: https://meet.google.com/gkj-rawi-ufp\nOr dial: (US) +1 978-403-0584 PIN=
:
  756969764#\nMore phone numbers: https://tel.meet/gkj-rawi-ufp?pin=3D75736=
807
 83326&hs=3D7\n\nLearn more about Meet at: https://support.google.com/a/use=
rs/
 answer/9282720\n\nPlease do not edit this section.\n-::~:~::~:~:~:~:~:~:~:=
~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20230716T200341Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:virtio-net collaboration bi-weekly
TRANSP:OPAQUE
BEGIN:VALARM
ACTION:DISPLAY
DESCRIPTION:This is an event reminder
TRIGGER:-P0DT0H10M0S
END:VALARM
END:VEVENT
END:VCALENDAR

--000000000000d023fe0600a02d01--
--000000000000d024000600a02d03
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjMwNzI2VDA1MDAwMFoNCkRURU5EOjIwMjMwNzI2
VDA1NDUwMFoNCkRUU1RBTVA6MjAyMzA3MTZUMjAwMzQzWg0KT1JHQU5JWkVSO0NOPXBhcmF2QG52
aWRpYS5jb206bWFpbHRvOnBhcmF2QG52aWRpYS5jb20NClVJRDo2NWd2Z3VjMDlqdGQ0ZXIwNWRz
bWM4Z2FqdUBnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1Q
QVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPXZpcnRpb0Bs
aXN0cy5vYXNpcy1vcGVuLm9yZztYLU5VTS1HVUVTVFM9MDptYWlsdG86dmlydGlvQGxpc3RzLm9h
c2kNCiBzLW9wZW4ub3JnDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1BQ0NFUFRFRDtSU1ZQPVRSVUUNCiA7Q049cGFyYXZAbnZpZGlhLmNv
bTtYLU5VTS1HVUVTVFM9MDptYWlsdG86cGFyYXZAbnZpZGlhLmNvbQ0KQVRURU5ERUU7Q1VUWVBF
PUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JT
VlA9DQogVFJVRTtDTj1zYnVybGFAbWFydmVsbC5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOnNi
dXJsYUBtYXJ2ZWxsLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFS
VElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj1oZW5ncWlAbGlu
dXguYWxpYmFiYS5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmhlbmdxaUBsaW51eC5hbGliYWJh
DQogLmNvbQ0KQVRURU5ERUU7Q1VUWVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7
UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9DQogVFJVRTtDTj14dWFuemh1b0BsaW51eC5hbGli
YWJhLmNvbTtYLU5VTS1HVUVTVFM9MDptYWlsdG86eHVhbnpodW9AbGludXguYWxpDQogYmFiYS5j
b20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRT
VEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049c2ktd2VpLmxpdUBvcmFjbGUuY29tO1gt
TlVNLUdVRVNUUz0wOm1haWx0bzpzaS13ZWkubGl1QG9yYWNsZS5jb20NCkFUVEVOREVFO0NVVFlQ
RT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtS
U1ZQPQ0KIFRSVUU7Q049dmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc7WC1OVU0t
R1VFU1RTPTA6bWFpbHRvOnZpcnRpby1jbw0KIG1tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnDQpY
LUdPT0dMRS1DT05GRVJFTkNFOmh0dHBzOi8vbWVldC5nb29nbGUuY29tL2drai1yYXdpLXVmcA0K
WC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOjExMDE4MTQzNDQNCkNSRUFURUQ6MjAyMzA3MTZU
MjAwMzQxWg0KREVTQ1JJUFRJT046SGkgQWxsXCw8YnI+PGJyPlRoaXMgaXMgYSBiaS13ZWVrbHkg
Y29sbGFib3JhdGlvbiBtZWV0aW5nIGZvciB2DQogaXJ0aW8gbmV0IHNwZWNpZmljYXRpb24gZGV2
ZWxvcGVycy48YnI+PGJyPlRoaXMgd2VlayBhZ2VuZGE6PGJyPjEuIENsb3NlIG9uDQogIHJlY2Vp
dmUgZmxvdyBmaWx0ZXJzIHN0ZWVyaW5nIHJlcXVpcmVtZW50cyBvZiBbMV08YnI+PGEgaHJlZj0i
aHR0cHM6Ly9saXN0DQogcy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8y
MDIzMDYvbXNnMDAwMTUuaHRtbCI+aHR0cHM6Ly9saXN0DQogcy5vYXNpcy1vcGVuLm9yZy9hcmNo
aXZlcy92aXJ0aW8tY29tbWVudC8yMDIzMDYvbXNnMDAwMTUuaHRtbDwvYT48YnI+wqA8YnI+Mg0K
IC4gQ291bnRlcnMgYW5kIHdoaWNoIGNvdW50ZXJzIHZpc2liaWxpdHkgaW4gZHJpdmVyPGJyPjxi
cj7CoC0tLS0tLS08YnI+YS4gQWwNCiBsIGRlY2lzaW9ucyBhcmUgc3RpbGwgbWFkZSBieSBUQyBl
bGVjdHJvbmljIGJhbGxvdCBhcyB1c3VhbC4gUHJvcG9zZWQgY29sbGENCiBib3JhdGlvbiA8c3Bh
bj5tZWV0aW5ncyBhcmUgdW5yZWxhdGVkIHRvIFRDIGJhbGxvdC48L3NwYW4+PGJyPjxzcGFuPmIu
IEFsbCANCiBkaXNjdXNzaW9ucyBmb2xsb3cgT0FTSVMgZmVlZGJhY2sgbGljZW5zZS4gPC9zcGFu
PjxhIGhyZWY9Imh0dHBzOi8vd3d3Lm9hc2kNCiBzLW9wZW4ub3JnL3BvbGljaWVzLWd1aWRlbGlu
ZXMvaXByLyNhcHBlbmRpeGEiPmh0dHBzOi8vd3d3Lm9hc2lzLW9wZW4ub3JnL3ANCiBvbGljaWVz
LWd1aWRlbGluZXMvaXByLyNhcHBlbmRpeGE8L2E+XG5cbi06On46fjo6fjp+On46fjp+On46fjp+
On46fjp+On46fjoNCiB+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46On46fjo6LVxuSm9pbiB3aXRoIEdvb2dsZSBNZWUNCiB0OiBodHRwczovL21lZXQuZ29vZ2xl
LmNvbS9na2otcmF3aS11ZnBcbk9yIGRpYWw6IChVUykgKzEgOTc4LTQwMy0wNTg0IFBJTjoNCiAg
NzU2OTY5NzY0I1xuTW9yZSBwaG9uZSBudW1iZXJzOiBodHRwczovL3RlbC5tZWV0L2drai1yYXdp
LXVmcD9waW49NzU3MzY4MDcNCiA4MzMyNiZocz03XG5cbkxlYXJuIG1vcmUgYWJvdXQgTWVldCBh
dDogaHR0cHM6Ly9zdXBwb3J0Lmdvb2dsZS5jb20vYS91c2Vycy8NCiBhbnN3ZXIvOTI4MjcyMFxu
XG5QbGVhc2UgZG8gbm90IGVkaXQgdGhpcyBzZWN0aW9uLlxuLTo6fjp+Ojp+On46fjp+On46fjp+
On4NCiA6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjo6fjp+OjotDQpMQVNULU1PRElGSUVEOjIwMjMwNzE2VDIwMDM0MVoNCkxPQ0FUSU9OOg0K
U0VRVUVOQ0U6MA0KU1RBVFVTOkNPTkZJUk1FRA0KU1VNTUFSWTp2aXJ0aW8tbmV0IGNvbGxhYm9y
YXRpb24gYmktd2Vla2x5DQpUUkFOU1A6T1BBUVVFDQpCRUdJTjpWQUxBUk0NCkFDVElPTjpESVNQ
TEFZDQpERVNDUklQVElPTjpUaGlzIGlzIGFuIGV2ZW50IHJlbWluZGVyDQpUUklHR0VSOi1QMERU
MEgxME0wUw0KRU5EOlZBTEFSTQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--000000000000d024000600a02d03
Content-Type: text/plain; charset=us-ascii


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/
--000000000000d024000600a02d03--

