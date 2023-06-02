Return-Path: <virtio-comment-return-6096-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A8DC77B7A
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 14:59:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 68AF12CAE3
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 14:59:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1486D9867F8
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 14:59:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 043539867EC; Fri,  2 Jun 2023 14:59:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7E5D9867E4
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 14:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685717973; x=1688309973;
        h=to:from:subject:date:message-id:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/rUbEj+A51pZdcRcaECBc9vEks6qwlXbjkvMJlSCOc=;
        b=jIWNChxU5wO3/298BSkhIO6XcToLotEEvJ9pWUOCd7HKLzk0iWESK4SuEzh6ihbeY6
         RVmSzIO5dJrULFzN4zn4+PJK4uy3Gr0Q0NMJsoX20EAfg+czFdPAqIJySGSshsO2gxIm
         SKO214z+W46eLeuu0VQAopTbEkhmxjyXLK7hhtbiorNwAuk58eYd/mdVIi+v2ylkC64I
         OZEwzsNENK3E1YRrNMgHmEGktFcXa5w7D4yKaWtd1OGOMkea2+EJb7PfiAGdrmCUKJiK
         OlJxQuZMjGHK8UYlq6UGNWS9e4S9JPHH7kUlEYhYm9i/Ke1IZhB+TPHoy+FXt4dj/P2K
         Y6QA==
X-Gm-Message-State: AC+VfDx4DmRCnFNeWrRQiotNnkQ70zINXGRibjivgl3Riivpv4YhWgaW
	TZFsC4ZCYafzrfu4wiAnmCPxkigTASaGXxyiPWBmuSFtoMbgHvI=
X-Google-Smtp-Source: ACHHUZ7t5mtd+cCYKSGIYVCVIp+SrmUTSTxhud3haZRR2lZFzzZX7Irmkwy8Atff6J+hoOcAZMDZCPbr91pc20zC/Zg+
MIME-Version: 1.0
X-Received: by 2002:a67:c894:0:b0:439:2efd:847d with SMTP id
 v20-20020a67c894000000b004392efd847dmr6531874vsk.5.1685717972960; Fri, 02 Jun
 2023 07:59:32 -0700 (PDT)
Reply-To: parav@nvidia.com
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <calendar-4a2a8320-6e0a-42a7-be18-d076337253c2@google.com>
Date: Fri, 02 Jun 2023 14:59:32 +0000
From: parav@nvidia.com
To: virtio-comment@lists.oasis-open.org, pandit.parav@gmail.com, 
	hengqi@linux.alibaba.com, sburla@marvell.com, si-wei.liu@oracle.com, 
	virtio@lists.oasis-open.org, xuanzhuo@linux.alibaba.com
Content-Type: multipart/mixed; boundary="000000000000f863f105fd26cc09"
Subject: [virtio-comment] Invitation: virtio-net collaboration bi-weekly @ Every 2 weeks from
 12am to 12:45am on Wednesday (CDT) (virtio-comment@lists.oasis-open.org)

--000000000000f863f105fd26cc09
Content-Type: multipart/alternative; boundary="000000000000f863ef05fd26cc07"

--000000000000f863ef05fd26cc07
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

dmlydGlvLW5ldCBjb2xsYWJvcmF0aW9uIGJpLXdlZWtseQ0KRXZlcnkgMiB3ZWVrcyBmcm9tIDEy
YW0gdG8gMTI6NDVhbSBvbiBXZWRuZXNkYXkNCkNlbnRyYWwgVGltZSAtIENoaWNhZ28NCg0KSm9p
biB3aXRoIEdvb2dsZSBNZWV0DQpodHRwczovL21lZXQuZ29vZ2xlLmNvbS9na2otcmF3aS11ZnA/
aHM9MjI0DQoNCg0KCQ0KSm9pbiBieSBwaG9uZQ0KKFVTKSArMSA5NzgtNDAzLTA1ODQNClBJTjog
NzU2OTY5NzY0DQoNCk1vcmUgcGhvbmUgbnVtYmVycw0KaHR0cHM6Ly90ZWwubWVldC9na2otcmF3
aS11ZnA/cGluPTc1NzM2ODA3ODMzMjYmaHM9MA0KDQoNCkhpIEFsbCxUaGlzIGlzIGEgYmktd2Vl
a2x5IGNvbGxhYm9yYXRpb24gbWVldGluZyBmb3IgdmlydGlvIG5ldCAgDQpzcGVjaWZpY2F0aW9u
IGRldmVsb3BlcnMuVGhpcyB3ZWVrIGFnZW5kYToxLiBEaXNjdXNzIHZpcnRpbyBuZXQgMS40IGZl
YXR1cmUgIA0KcmVxdWlyZW1lbnRzIHBvc3RlZCBhdCBbMV0gYW5kIGFueSAgDQpvdGhlcnMuaHR0
cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8yMDIzMDYv
bXNnMDAwMTUuaHRtbMKgMi4gIA0KaW5uZXIgaGFzaCBvcGVuwqAtLS0tLS0tYS4gQWxsIGRlY2lz
aW9ucyBhcmUgc3RpbGwgbWFkZSBieSBUQyBlbGVjdHJvbmljICANCmJhbGxvdCBhc3VzdWFsLiBQ
cm9wb3NlZCBjb2xsYWJvcmF0aW9uIG1lZXRpbmdzYXJlIHVucmVsYXRlZCB0byBUQyAgDQpiYWxs
b3QuYi4gQWxsIGRpc2N1c3Npb25zIGZvbGxvdyBPQVNJUyBmZWVkYmFjayBsaWNlbnNlLiAgDQpo
dHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9wb2xpY2llcy1ndWlkZWxpbmVzL2lwci8jYXBwZW5k
aXhhDQoNCk9yZ2FuaXplcg0KcGFyYXZAbnZpZGlhLmNvbQ0KcGFyYXZAbnZpZGlhLmNvbQ0KDQpH
dWVzdHMNCnBhcmF2QG52aWRpYS5jb20gLSBvcmdhbml6ZXINCnBhbmRpdC5wYXJhdkBnbWFpbC5j
b20NCmhlbmdxaUBsaW51eC5hbGliYWJhLmNvbQ0Kc2J1cmxhQG1hcnZlbGwuY29tDQpzaS13ZWku
bGl1QG9yYWNsZS5jb20NCnZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnDQp2aXJ0
aW9AbGlzdHMub2FzaXMtb3Blbi5vcmcNCnh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tDQpWaWV3
IGFsbCBndWVzdCBpbmZvICANCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci9l
dmVudD9hY3Rpb249VklFVyZlaWQ9TjNJMU1XZGlOakJzYW5ZMU1USndOMmR1ZERGMFptSnVhV1ln
ZG1seWRHbHZMV052YlcxbGJuUkFiR2x6ZEhNdWIyRnphWE10YjNCbGJpNXZjbWMmdG9rPU1UWWpj
R0Z5WVhaQWJuWnBaR2xoTG1OdmJXUm1ZVEJpTXprek56TXlPVEl6WmpnME1tVXhNemhsWWpGaE5E
VmhORGd5Tm1JNFlUaGtaamsmY3R6PUFtZXJpY2ElMkZDaGljYWdvJmhsPWVuJmVzPTANCg0KUmVw
bHkgZm9yIHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIGFuZCB2aWV3IG1vcmUg
ZGV0YWlscyAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0
aW9uPVZJRVcmZWlkPU4zSTFNV2RpTmpCc2FuWTFNVEp3TjJkdWRERjBabUp1YVdZZ2RtbHlkR2x2
TFdOdmJXMWxiblJBYkdsemRITXViMkZ6YVhNdGIzQmxiaTV2Y21jJnRvaz1NVFlqY0dGeVlYWkFi
blpwWkdsaExtTnZiV1JtWVRCaU16a3pOek15T1RJelpqZzBNbVV4TXpobFlqRmhORFZoTkRneU5t
STRZVGhrWmprJmN0ej1BbWVyaWNhJTJGQ2hpY2FnbyZobD1lbiZlcz0wDQpZb3VyIGF0dGVuZGFu
Y2UgaXMgb3B0aW9uYWwuDQoNCn5+Ly9+fg0KSW52aXRhdGlvbiBmcm9tIEdvb2dsZSBDYWxlbmRh
cjogaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLw0KDQpZb3UgYXJlIHJlY2Vp
dmluZyB0aGlzIGVtYWlsIGJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvbiB0aGUgZXZlbnQu
IFRvICANCnN0b3AgcmVjZWl2aW5nIGZ1dHVyZSB1cGRhdGVzIGZvciB0aGlzIGV2ZW50LCBkZWNs
aW5lIHRoaXMgZXZlbnQuDQoNCkZvcndhcmRpbmcgdGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93
IGFueSByZWNpcGllbnQgdG8gc2VuZCBhIHJlc3BvbnNlIHRvICANCnRoZSBvcmdhbml6ZXIsIGJl
IGFkZGVkIHRvIHRoZSBndWVzdCBsaXN0LCBpbnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3Mgb2YgIA0K
dGhlaXIgb3duIGludml0YXRpb24gc3RhdHVzLCBvciBtb2RpZnkgeW91ciBSU1ZQLg0KDQpMZWFy
biBtb3JlIGh0dHBzOi8vc3VwcG9ydC5nb29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNm
b3J3YXJkaW5nDQo=
--000000000000f863ef05fd26cc07
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
ndar" content=3D"7r51gb60ljv512p7gnt1tfbnif"/><span style=3D"display: none;=
 font-size: 1px; color: #fff; line-height: 1px; height: 0; max-height: 0; w=
idth: 0; max-width: 0; opacity: 0; overflow: hidden;" itemprop=3D"name">vir=
tio-net collaboration bi-weekly</span><meta itemprop=3D"url" content=3D"htt=
ps://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DN3I1MWdiNjB=
sanY1MTJwN2dudDF0ZmJuaWYgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&am=
p;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbWRmYTBiMzkzNzMyOTIzZjg0MmUxMzhlYjFhNDVhNDg=
yNmI4YThkZjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0"/><span ari=
a-hidden=3D"true"><time itemprop=3D"startDate" datetime=3D"20230607T050000Z=
"></time><time itemprop=3D"endDate" datetime=3D"20230607T054500Z"></time></=
span><div style=3D"display: none; font-size: 1px; color: #fff; line-height:=
 1px; height: 0; max-height: 0; width: 0; max-width: 0; opacity: 0; overflo=
w: hidden;">Join with Google Meet =E2=80=93 Hi All,This is a bi-weekly coll=
aboration meeting for virtio net specification developers.This week agenda:=
1. Discuss virtio net 1.4 feature requirements posted at [1] and any others=
.https://lists.oasi</div><table border=3D"0" cellpadding=3D"0" cellspacing=
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
o net specification developers.<br><br>This week agenda:<br>1. Discuss virt=
io net 1.4 feature requirements posted at [1] and any others.<br><a href=3D=
"https://www.google.com/url?q=3Dhttps%3A%2F%2Flists.oasis-open.org%2Farchiv=
es%2Fvirtio-comment%2F202306%2Fmsg00015.html&amp;sa=3DD&amp;ust=3D168614994=
0000000&amp;usg=3DAOvVaw0hp2bsXL4FfP_iO-EL4yWl" target=3D"_blank">https://l=
ists.oasis-open.org/archives/virtio-comment/202306/msg00015.html</a><br>=C2=
=A0<br>2. inner hash open<br>=C2=A0<br>-------<br>a. All decisions are stil=
l made by TC electronic ballot asusual. Proposed collaboration <span>meetin=
gsare unrelated to TC ballot.</span><br><span>b. All discussions follow OAS=
IS feedback license. </span><a href=3D"https://www.google.com/url?q=3Dhttps=
%3A%2F%2Fwww.oasis-open.org%2Fpolicies-guidelines%2Fipr%2F%23appendixa&amp;=
sa=3DD&amp;ust=3D1686149940000000&amp;usg=3DAOvVaw2C-QOcWPhEQShtnNHuu4c1" t=
arget=3D"_blank">https://www.oasis-open.org/policies-guidelines/ipr/#append=
ixa</a></span><meta itemprop=3D"description" content=3D"Hi All,This is a bi=
-weekly collaboration meeting for virtio net specification developers.This =
week agenda:1. Discuss virtio net 1.4 feature requirements posted at [1] an=
d any others.https://lists.oasis-open.org/archives/virtio-comment/202306/ms=
g00015.html=C2=A02. inner hash open=C2=A0-------a. All decisions are still =
made by TC electronic ballot asusual. Proposed collaboration meetingsare un=
related to TC ballot.b. All discussions follow OASIS feedback license. http=
s://www.oasis-open.org/policies-guidelines/ipr/#appendixa"/></div></td></tr=
><tr><td style=3D"font-size: 0; padding: 0; text-align: left; word-break: b=
reak-word;;padding-bottom:24px;"><div style=3D"font-family: Roboto, sans-se=
rif;font-style: normal; font-weight: 400; font-size: 14px; line-height: 20p=
x; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" class=3D"p=
rimary-text" role=3D"presentation"><span aria-hidden=3D"true"><time itempro=
p=3D"startDate" datetime=3D"20230607T050000Z"></time><time itemprop=3D"endD=
ate" datetime=3D"20230607T054500Z"></time></span><table border=3D"0" cellpa=
dding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom=
: 4px;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: =
#3c4043; text-decoration: none;font-weight: 700;-webkit-font-smoothing: ant=
ialiased;margin: 0; padding: 0;">When</h2></td></tr></table><span>Every 2 w=
eeks from 12am to 12:45am on Wednesday (Central Time - Chicago)</span></div=
></td></tr><tr><td style=3D"font-size: 0; padding: 0; text-align: left; wor=
d-break: break-word;;padding-bottom:24px;"><div style=3D"font-family: Robot=
o, sans-serif;font-style: normal; font-weight: 400; font-size: 14px; line-h=
eight: 20px; letter-spacing: 0.2px;color: #3c4043; text-decoration: none;" =
class=3D"primary-text" role=3D"presentation"><table border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"padding-bottom: 4p=
x;"><tr><td><h2 class=3D"primary-text" style=3D"font-size: 14px;color: #3c4=
043; text-decoration: none;font-weight: 700;-webkit-font-smoothing: antiali=
ased;margin: 0; padding: 0;">Guests</h2></td></tr></table><div style=3D"pad=
ding-bottom: 4px; text-align: left;;color: #3c4042;"><div><span itemprop=3D=
"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=
=3D"name" class=3D"notranslate"><a class=3D"primary-text underline-on-hover=
" style=3D"display: inline-block;;color: #3c4043; text-decoration: none;" h=
ref=3D"mailto:parav@nvidia.com">parav@nvidia.com</a></span><meta itemprop=
=3D"email" content=3D"parav@nvidia.com"/></span><span itemprop=3D"organizer=
" itemscope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" c=
ontent=3D"parav@nvidia.com"/><meta itemprop=3D"email" content=3D"parav@nvid=
ia.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a; tex=
t-decoration: none;"> - organizer</span></div><div><span itemprop=3D"attend=
ee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name"=
 class=3D"notranslate"><a class=3D"primary-text underline-on-hover" style=
=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=3D"=
mailto:pandit.parav@gmail.com">pandit.parav@gmail.com</a></span><meta itemp=
rop=3D"email" content=3D"pandit.parav@gmail.com"/></span><span class=3D"sec=
ondary-text" style=3D"color: #70757a; text-decoration: none;"></span></div>=
<div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Pe=
rson"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-tex=
t underline-on-hover" style=3D"display: inline-block;;color: #3c4043; text-=
decoration: none;" href=3D"mailto:hengqi@linux.alibaba.com">hengqi@linux.al=
ibaba.com</a></span><meta itemprop=3D"email" content=3D"hengqi@linux.alibab=
a.com"/></span><span class=3D"secondary-text" style=3D"color: #70757a; text=
-decoration: none;"></span></div><div><span itemprop=3D"attendee" itemscope=
 itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"not=
ranslate"><a class=3D"primary-text underline-on-hover" style=3D"display: in=
line-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:sburla@m=
arvell.com">sburla@marvell.com</a></span><meta itemprop=3D"email" content=
=3D"sburla@marvell.com"/></span><span class=3D"secondary-text" style=3D"col=
or: #70757a; text-decoration: none;"></span></div><div><span itemprop=3D"at=
tendee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"n=
ame" class=3D"notranslate"><a class=3D"primary-text underline-on-hover" sty=
le=3D"display: inline-block;;color: #3c4043; text-decoration: none;" href=
=3D"mailto:si-wei.liu@oracle.com">si-wei.liu@oracle.com</a></span><meta ite=
mprop=3D"email" content=3D"si-wei.liu@oracle.com"/></span><span class=3D"se=
condary-text" style=3D"color: #70757a; text-decoration: none;"></span></div=
><div><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/P=
erson"><span itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-te=
xt underline-on-hover" style=3D"display: inline-block;;color: #3c4043; text=
-decoration: none;" href=3D"mailto:virtio-comment@lists.oasis-open.org">vir=
tio-comment@lists.oasis-open.org</a></span><meta itemprop=3D"email" content=
=3D"virtio-comment@lists.oasis-open.org"/></span><span class=3D"secondary-t=
ext" style=3D"color: #70757a; text-decoration: none;"></span></div><div><sp=
an itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><s=
pan itemprop=3D"name" class=3D"notranslate"><a class=3D"primary-text underl=
ine-on-hover" style=3D"display: inline-block;;color: #3c4043; text-decorati=
on: none;" href=3D"mailto:virtio@lists.oasis-open.org">virtio@lists.oasis-o=
pen.org</a></span><meta itemprop=3D"email" content=3D"virtio@lists.oasis-op=
en.org"/></span><span class=3D"secondary-text" style=3D"color: #70757a; tex=
t-decoration: none;"></span></div><div><span itemprop=3D"attendee" itemscop=
e itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"no=
translate"><a class=3D"primary-text underline-on-hover" style=3D"display: i=
nline-block;;color: #3c4043; text-decoration: none;" href=3D"mailto:xuanzhu=
o@linux.alibaba.com">xuanzhuo@linux.alibaba.com</a></span><meta itemprop=3D=
"email" content=3D"xuanzhuo@linux.alibaba.com"/></span><span class=3D"secon=
dary-text" style=3D"color: #70757a; text-decoration: none;"></span></div></=
div><a href=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp=
;eid=3DN3I1MWdiNjBsanY1MTJwN2dudDF0ZmJuaWYgdmlydGlvLWNvbW1lbnRAbGlzdHMub2Fz=
aXMtb3Blbi5vcmc&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbWRmYTBiMzkzNzMyOTIzZjg0M=
mUxMzhlYjFhNDVhNDgyNmI4YThkZjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;=
es=3D0" style=3D"display: inline-block;;color: #1a73e8; text-decoration: no=
ne;font-weight: 700;" target=3D"_blank" class=3D"accent-text underline-on-h=
over">View all guest info</a></div></td></tr><tr><td style=3D"font-size: 0;=
 padding: 0; text-align: left; word-break: break-word;;padding-bottom:0px;"=
><div style=3D"color: #3c4043; text-decoration: none;;font-family: Roboto, =
sans-serif;font-size: 14px; line-height: 20px; mso-line-height-rule: exactl=
y; text-align: left;" class=3D"primary-text"><div><span style=3D"font-weigh=
t: 700;-webkit-font-smoothing: antialiased;">RSVP</span><span class=3D"seco=
ndary-text" style=3D"color: #70757a; text-decoration: none;"> for <a class=
=3D"secondary-text underline-on-hover" style=3D"display: inline-block;;colo=
r: #70757a; text-decoration: none;" href=3D"mailto:virtio-comment@lists.oas=
is-open.org">virtio-comment@lists.oasis-open.org</a> for all events in this=
 series</span></div></div></td></tr><tr><td style=3D"font-size: 0; padding:=
 0; text-align: left; word-break: break-word;;padding-bottom:16px;"><div st=
yle=3D"font-family: Roboto, sans-serif;font-size: 14px; line-height: 20px; =
mso-line-height-rule: exactly; text-align: left;"><table border=3D"0" cellp=
adding=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border-collap=
se: separate;"><tr><td style=3D"padding-top: 8px; padding-left: 0; padding-=
right: 12px;"><!-- RSVP buttons --><table border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" role=3D"presentation" style=3D"border: solid 1px #dadce0; b=
order-radius: 16px; border-collapse: separate;font-family: &#39;Google Sans=
&#39;, Roboto, sans-serif;;display: inline-block;;margin-right: 12px; margi=
n-left: 0;"><tr><td align=3D"center" vertical-align=3D"middle" role=3D"pres=
entation"><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://s=
chema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schem=
a.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope itemtype=3D=
"http://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"htt=
p://schema.org/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a h=
ref=3D"https://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=
=3DN3I1MWdiNjBsanY1MTJwN2dudDF0ZmJuaWYgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMt=
b3Blbi5vcmc&amp;rst=3D1&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbWRmYTBiMzkzNzMyO=
TIzZjg0MmUxMzhlYjFhNDVhNDgyNmI4YThkZjk&amp;ctz=3DAmerica%2FChicago&amp;hl=
=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#=
39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%;=
 mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tran=
sform: none;" class=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"=
><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentati=
on"><tr><td align=3D"center" role=3D"presentation" valign=3D"middle" style=
=3D"padding: 6px 0; padding-left: 16px; padding-right: 12px; white-space: n=
owrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calendar/event?=
action=3DRESPOND&amp;eid=3DN3I1MWdiNjBsanY1MTJwN2dudDF0ZmJuaWYgdmlydGlvLWNv=
bW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;rst=3D1&amp;tok=3DMTYjcGFyYXZAbnZpZ=
GlhLmNvbWRmYTBiMzkzNzMyOTIzZjg0MmUxMzhlYjFhNDVhNDgyNmI4YThkZjk&amp;ctz=3DAm=
erica%2FChicago&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text" itemprop=
=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button-text" sty=
le=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sans-ser=
if;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-height-rule=
: exactly; margin: 0; text-decoration: none; text-transform: none;">Yes</sp=
an><!--[if mso]></a><![endif]--></td></tr></table></a></span></span></span>=
</td><td align=3D"center" vertical-align=3D"middle" role=3D"presentation" s=
tyle=3D"border-left: solid 1px #dadce0; border-right: solid 1px #dadce0;"><=
span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/R=
svpAction"><meta itemprop=3D"attendance" content=3D"http://schema.org/RsvpA=
ttendance/No"/><span itemprop=3D"handler" itemscope itemtype=3D"http://sche=
ma.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http://schema.o=
rg/HttpRequestMethod/GET"/><span style=3D"color: #5f6367;"><a href=3D"https=
://calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DN3I1MWdiNj=
BsanY1MTJwN2dudDF0ZmJuaWYgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&a=
mp;rst=3D2&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbWRmYTBiMzkzNzMyOTIzZjg0MmUxMz=
hlYjFhNDVhNDgyNmI4YThkZjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D=
0" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sa=
ns-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-heigh=
t-rule: exactly; margin: 0; text-decoration: none; text-transform: none;" c=
lass=3D"grey-button-text" itemprop=3D"url" target=3D"_blank"><table border=
=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D"presentation"><tr><td al=
ign=3D"center" role=3D"presentation" valign=3D"middle" style=3D"padding: 6p=
x 12px; white-space: nowrap;"><!--[if mso]><a href=3D"https://calendar.goog=
le.com/calendar/event?action=3DRESPOND&amp;eid=3DN3I1MWdiNjBsanY1MTJwN2dudD=
F0ZmJuaWYgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;rst=3D2&amp;t=
ok=3DMTYjcGFyYXZAbnZpZGlhLmNvbWRmYTBiMzkzNzMyOTIzZjg0MmUxMzhlYjFhNDVhNDgyNm=
I4YThkZjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0" class=3D"grey=
-button-text" itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D=
"grey-button-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&=
#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%=
; mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-tra=
nsform: none;">No</span><!--[if mso]></a><![endif]--></td></tr></table></a>=
</span></span></span></td><td align=3D"center" vertical-align=3D"middle" ro=
le=3D"presentation"><span itemprop=3D"potentialaction" itemscope itemtype=
=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"=
http://schema.org/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemsco=
pe itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"metho=
d" href=3D"http://schema.org/HttpRequestMethod/GET"/><span style=3D"color: =
#5f6367;"><a href=3D"https://calendar.google.com/calendar/event?action=3DRE=
SPOND&amp;eid=3DN3I1MWdiNjBsanY1MTJwN2dudDF0ZmJuaWYgdmlydGlvLWNvbW1lbnRAbGl=
zdHMub2FzaXMtb3Blbi5vcmc&amp;rst=3D3&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbWRm=
YTBiMzkzNzMyOTIzZjg0MmUxMzhlYjFhNDVhNDgyNmI4YThkZjk&amp;ctz=3DAmerica%2FChi=
cago&amp;hl=3Den&amp;es=3D0" style=3D"font-weight: 400;font-family: &#39;Go=
ogle Sans&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-he=
ight: 120%; mso-line-height-rule: exactly; margin: 0; text-decoration: none=
; text-transform: none;" class=3D"grey-button-text" itemprop=3D"url" target=
=3D"_blank"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" role=3D=
"presentation"><tr><td align=3D"center" role=3D"presentation" valign=3D"mid=
dle" style=3D"padding: 6px 0; padding-left: 12px; padding-right: 16px; whit=
e-space: nowrap;"><!--[if mso]><a href=3D"https://calendar.google.com/calen=
dar/event?action=3DRESPOND&amp;eid=3DN3I1MWdiNjBsanY1MTJwN2dudDF0ZmJuaWYgdm=
lydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;rst=3D3&amp;tok=3DMTYjcGF=
yYXZAbnZpZGlhLmNvbWRmYTBiMzkzNzMyOTIzZjg0MmUxMzhlYjFhNDVhNDgyNmI4YThkZjk&am=
p;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0" class=3D"grey-button-text=
" itemprop=3D"url" target=3D"_blank"><![endif]--><span class=3D"grey-button=
-text" style=3D"font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto=
, sans-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-h=
eight-rule: exactly; margin: 0; text-decoration: none; text-transform: none=
;">Maybe</span><!--[if mso]></a><![endif]--></td></tr></table></a></span></=
span></span></td></tr></table><!-- More options --><a href=3D"https://calen=
dar.google.com/calendar/event?action=3DVIEW&amp;eid=3DN3I1MWdiNjBsanY1MTJwN=
2dudDF0ZmJuaWYgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmc&amp;tok=3DMT=
YjcGFyYXZAbnZpZGlhLmNvbWRmYTBiMzkzNzMyOTIzZjg0MmUxMzhlYjFhNDVhNDgyNmI4YThkZ=
jk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=3D0" style=3D"display: in=
line-block;;font-weight: 400;font-family: &#39;Google Sans&#39;, Roboto, sa=
ns-serif;color: #5f6368; font-size: 14px; line-height: 120%; mso-line-heigh=
t-rule: exactly; margin: 0; text-decoration: none; text-transform: none;" c=
lass=3D"grey-button-text" target=3D"_blank"><table border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0" role=3D"presentation" style=3D"border: solid 1px #=
dadce0; border-radius: 16px; border-collapse: separate;font-family: &#39;Go=
ogle Sans&#39;, Roboto, sans-serif;"><tr><td align=3D"center" vertical-alig=
n=3D"middle" role=3D"presentation" style=3D"padding: 6px 0; padding-left: 1=
6px; padding-right: 12px; white-space: nowrap;;color: #5f6367;"><!--[if mso=
]><a href=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp;e=
id=3DN3I1MWdiNjBsanY1MTJwN2dudDF0ZmJuaWYgdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaX=
Mtb3Blbi5vcmc&amp;tok=3DMTYjcGFyYXZAbnZpZGlhLmNvbWRmYTBiMzkzNzMyOTIzZjg0MmU=
xMzhlYjFhNDVhNDgyNmI4YThkZjk&amp;ctz=3DAmerica%2FChicago&amp;hl=3Den&amp;es=
=3D0" class=3D"grey-button-text" target=3D"_blank"><![endif]--><span class=
=3D"grey-button-text" style=3D"font-weight: 400;font-family: &#39;Google Sa=
ns&#39;, Roboto, sans-serif;color: #5f6368; font-size: 14px; line-height: 1=
20%; mso-line-height-rule: exactly; margin: 0; text-decoration: none; text-=
transform: none;">More options</span><!--[if mso]></a><![endif]--></td></tr=
></table></a></td></tr></table></div></td></tr></table></td></tr></tbody></=
table></div><!--[if mso | IE]></td><![endif]--><!--[if mso | IE]></tr></tab=
le><![endif]--></td></tr></tbody></table><table border=3D"0" cellpadding=3D=
"0" cellspacing=3D"0" role=3D"presentation" align=3D"center" style=3D"width=
:100%;" class=3D""><tbody><tr><td style=3D"font-size: 0; padding: 0; text-a=
lign: left; word-break: break-word;;padding:4px 12px;" class=3D"" align=3D"=
left"><div class=3D"secondary-text" style=3D"color: #70757a; text-decoratio=
n: none;font-family: Roboto, sans-serif;font-size: 12px; line-height: 16px;=
 mso-line-height-rule: exactly; text-align: left;"><p>Invitation from <a hr=
ef=3D"https://calendar.google.com/calendar/" class=3D"accent-text underline=
-on-hover" style=3D"font-family: Roboto, sans-serif;font-size: 12px; line-h=
eight: 16px; mso-line-height-rule: exactly;;color: #1a73e8; text-decoration=
: none;" target=3D"_blank">Google Calendar</a></p><p>You are receiving this=
 email because you are an attendee on the event. To stop receiving future u=
pdates for this event, decline this event.</p><p>Forwarding this invitation=
 could allow any recipient to send a response to the organizer, be added to=
 the guest list, invite others regardless of their own invitation status, o=
r modify your RSVP. <a class=3D"accent-text underline-on-hover" style=3D"fo=
nt-family: Roboto, sans-serif;font-size: 12px; line-height: 16px; mso-line-=
height-rule: exactly;;color: #1a73e8; text-decoration: none;" href=3D"https=
://support.google.com/calendar/answer/37135#forwarding">Learn more</a></p><=
/div></td></tr></tbody></table></td></tr></tbody></table></span></span></bo=
dy></html>
--000000000000f863ef05fd26cc07
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: quoted-printable

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20230607T050000Z
DTEND:20230607T054500Z
RRULE:FREQ=3DWEEKLY;WKST=3DSU;INTERVAL=3D2
DTSTAMP:20230602T145932Z
ORGANIZER;CN=3Dparav@nvidia.com:mailto:parav@nvidia.com
UID:7r51gb60ljv512p7gnt1tfbnif@google.com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dpandit.parav@gmail.com;X-NUM-GUESTS=3D0:mailto:pandit.parav@gmai=
l.com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DACCEPTED;RSV=
P=3DTRUE
 ;CN=3Dparav@nvidia.com;X-NUM-GUESTS=3D0:mailto:parav@nvidia.com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dhengqi@linux.alibaba.com;X-NUM-GUESTS=3D0:mailto:hengqi@linux.al=
ibaba
 .com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dsburla@marvell.com;X-NUM-GUESTS=3D0:mailto:sburla@marvell.com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dsi-wei.liu@oracle.com;X-NUM-GUESTS=3D0:mailto:si-wei.liu@oracle.=
com
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dvirtio-comment@lists.oasis-open.org;X-NUM-GUESTS=3D0:mailto:virt=
io-co
 mment@lists.oasis-open.org
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dvirtio@lists.oasis-open.org;X-NUM-GUESTS=3D0:mailto:virtio@lists=
.oasi
 s-open.org
ATTENDEE;CUTYPE=3DINDIVIDUAL;ROLE=3DREQ-PARTICIPANT;PARTSTAT=3DNEEDS-ACTION=
;RSVP=3D
 TRUE;CN=3Dxuanzhuo@linux.alibaba.com;X-NUM-GUESTS=3D0:mailto:xuanzhuo@linu=
x.ali
 baba.com
X-GOOGLE-CONFERENCE:https://meet.google.com/gkj-rawi-ufp
X-MICROSOFT-CDO-OWNERAPPTID:335919207
CREATED:20230601T222658Z
DESCRIPTION:Hi All\,<br><br>This is a bi-weekly collaboration meeting for v
 irtio net specification developers.<br><br>This week agenda:<br>1. Discuss=
=20
 virtio net 1.4 feature requirements posted at [1] and any others.<br><a hr=
e
 f=3D"https://lists.oasis-open.org/archives/virtio-comment/202306/msg00015.=
htm
 l">https://lists.oasis-open.org/archives/virtio-comment/202306/msg00015.ht=
m
 l</a><br>=C2=A0<br>2. inner hash open<br>=C2=A0<br>-------<br>a. All decis=
ions are st
 ill made by TC electronic ballot asusual. Proposed collaboration <span>mee=
t
 ingsare unrelated to TC ballot.</span><br><span>b. All discussions follow =
O
 ASIS feedback license. </span><a href=3D"https://www.oasis-open.org/polici=
es-
 guidelines/ipr/#appendixa">https://www.oasis-open.org/policies-guidelines/=
i
 pr/#appendixa</a>\n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~=
:
 ~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nJoin with Google Meet: https://meet.goo=
g
 le.com/gkj-rawi-ufp\nOr dial: (US) +1 978-403-0584 PIN: 756969764#\nMore p=
h
 one numbers: https://tel.meet/gkj-rawi-ufp?pin=3D7573680783326&hs=3D7\n\nL=
earn=20
 more about Meet at: https://support.google.com/a/users/answer/9282720\n\nP=
l
 ease do not edit this section.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:=
~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20230602T145930Z
LOCATION:
SEQUENCE:3
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

--000000000000f863ef05fd26cc07--
--000000000000f863f105fd26cc09
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjMwNjA3VDA1MDAwMFoNCkRURU5EOjIwMjMwNjA3
VDA1NDUwMFoNClJSVUxFOkZSRVE9V0VFS0xZO1dLU1Q9U1U7SU5URVJWQUw9Mg0KRFRTVEFNUDoy
MDIzMDYwMlQxNDU5MzJaDQpPUkdBTklaRVI7Q049cGFyYXZAbnZpZGlhLmNvbTptYWlsdG86cGFy
YXZAbnZpZGlhLmNvbQ0KVUlEOjdyNTFnYjYwbGp2NTEycDdnbnQxdGZibmlmQGdvb2dsZS5jb20N
CkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049cGFuZGl0LnBhcmF2QGdtYWlsLmNvbTtYLU5V
TS1HVUVTVFM9MDptYWlsdG86cGFuZGl0LnBhcmF2QGdtYWlsLmNvbQ0KQVRURU5ERUU7Q1VUWVBF
PUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9QUNDRVBURUQ7UlNWUD1U
UlVFDQogO0NOPXBhcmF2QG52aWRpYS5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOnBhcmF2QG52
aWRpYS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5U
O1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049aGVuZ3FpQGxpbnV4LmFsaWJh
YmEuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpoZW5ncWlAbGludXguYWxpYmFiYQ0KIC5jb20N
CkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049c2J1cmxhQG1hcnZlbGwuY29tO1gtTlVNLUdV
RVNUUz0wOm1haWx0bzpzYnVybGFAbWFydmVsbC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklE
VUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRS
VUU7Q049c2ktd2VpLmxpdUBvcmFjbGUuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzpzaS13ZWku
bGl1QG9yYWNsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJ
Q0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049dmlydGlvLWNvbW1l
bnRAbGlzdHMub2FzaXMtb3Blbi5vcmc7WC1OVU0tR1VFU1RTPTA6bWFpbHRvOnZpcnRpby1jbw0K
IG1tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtS
T0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NO
PXZpcnRpb0BsaXN0cy5vYXNpcy1vcGVuLm9yZztYLU5VTS1HVUVTVFM9MDptYWlsdG86dmlydGlv
QGxpc3RzLm9hc2kNCiBzLW9wZW4ub3JnDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xF
PVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPXh1
YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzp4dWFuemh1b0Bs
aW51eC5hbGkNCiBiYWJhLmNvbQ0KWC1HT09HTEUtQ09ORkVSRU5DRTpodHRwczovL21lZXQuZ29v
Z2xlLmNvbS9na2otcmF3aS11ZnANClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDozMzU5MTky
MDcNCkNSRUFURUQ6MjAyMzA2MDFUMjIyNjU4Wg0KREVTQ1JJUFRJT046SGkgQWxsXCw8YnI+PGJy
PlRoaXMgaXMgYSBiaS13ZWVrbHkgY29sbGFib3JhdGlvbiBtZWV0aW5nIGZvciB2DQogaXJ0aW8g
bmV0IHNwZWNpZmljYXRpb24gZGV2ZWxvcGVycy48YnI+PGJyPlRoaXMgd2VlayBhZ2VuZGE6PGJy
PjEuIERpc2N1c3MgDQogdmlydGlvIG5ldCAxLjQgZmVhdHVyZSByZXF1aXJlbWVudHMgcG9zdGVk
IGF0IFsxXSBhbmQgYW55IG90aGVycy48YnI+PGEgaHJlDQogZj0iaHR0cHM6Ly9saXN0cy5vYXNp
cy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8yMDIzMDYvbXNnMDAwMTUuaHRtDQog
bCI+aHR0cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8y
MDIzMDYvbXNnMDAwMTUuaHRtDQogbDwvYT48YnI+wqA8YnI+Mi4gaW5uZXIgaGFzaCBvcGVuPGJy
PsKgPGJyPi0tLS0tLS08YnI+YS4gQWxsIGRlY2lzaW9ucyBhcmUgc3QNCiBpbGwgbWFkZSBieSBU
QyBlbGVjdHJvbmljIGJhbGxvdCBhc3VzdWFsLiBQcm9wb3NlZCBjb2xsYWJvcmF0aW9uIDxzcGFu
Pm1lZXQNCiBpbmdzYXJlIHVucmVsYXRlZCB0byBUQyBiYWxsb3QuPC9zcGFuPjxicj48c3Bhbj5i
LiBBbGwgZGlzY3Vzc2lvbnMgZm9sbG93IE8NCiBBU0lTIGZlZWRiYWNrIGxpY2Vuc2UuIDwvc3Bh
bj48YSBocmVmPSJodHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9wb2xpY2llcy0NCiBndWlkZWxp
bmVzL2lwci8jYXBwZW5kaXhhIj5odHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9wb2xpY2llcy1n
dWlkZWxpbmVzL2kNCiBwci8jYXBwZW5kaXhhPC9hPlxuXG4tOjp+On46On46fjp+On46fjp+On46
fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjoNCiB+On46fjp+On46fjp+On46fjp+On46
fjp+Ojp+On46Oi1cbkpvaW4gd2l0aCBHb29nbGUgTWVldDogaHR0cHM6Ly9tZWV0Lmdvb2cNCiBs
ZS5jb20vZ2tqLXJhd2ktdWZwXG5PciBkaWFsOiAoVVMpICsxIDk3OC00MDMtMDU4NCBQSU46IDc1
Njk2OTc2NCNcbk1vcmUgcGgNCiBvbmUgbnVtYmVyczogaHR0cHM6Ly90ZWwubWVldC9na2otcmF3
aS11ZnA/cGluPTc1NzM2ODA3ODMzMjYmaHM9N1xuXG5MZWFybiANCiBtb3JlIGFib3V0IE1lZXQg
YXQ6IGh0dHBzOi8vc3VwcG9ydC5nb29nbGUuY29tL2EvdXNlcnMvYW5zd2VyLzkyODI3MjBcblxu
UGwNCiBlYXNlIGRvIG5vdCBlZGl0IHRoaXMgc2VjdGlvbi5cbi06On46fjo6fjp+On46fjp+On46
fjp+On46fjp+On46fjp+On46fjp+On4NCiA6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46
fjp+On46On46fjo6LQ0KTEFTVC1NT0RJRklFRDoyMDIzMDYwMlQxNDU5MzBaDQpMT0NBVElPTjoN
ClNFUVVFTkNFOjMNClNUQVRVUzpDT05GSVJNRUQNClNVTU1BUlk6dmlydGlvLW5ldCBjb2xsYWJv
cmF0aW9uIGJpLXdlZWtseQ0KVFJBTlNQOk9QQVFVRQ0KQkVHSU46VkFMQVJNDQpBQ1RJT046RElT
UExBWQ0KREVTQ1JJUFRJT046VGhpcyBpcyBhbiBldmVudCByZW1pbmRlcg0KVFJJR0dFUjotUDBE
VDBIMTBNMFMNCkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--000000000000f863f105fd26cc09
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
--000000000000f863f105fd26cc09--

