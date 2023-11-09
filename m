Return-Path: <virtio-comment-return-8304-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E67C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 15:33:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B08C1330B5
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 15:33:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 919F5986CE2
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 15:33:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7584C986CD9; Thu,  9 Nov 2023 15:33:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 642F8986CDA
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 15:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
From: "Pape, Andreas (ADITG/ESS3)" <apape@de.adit-jv.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: virtio sound: add missing definitions for 12 and 24kHz sampling
 rates
Thread-Index: AdoTIVOBs7OOlfs8QAyhGScofwk1EA==
Date: Thu, 9 Nov 2023 15:33:33 +0000
Message-ID: <329f386ba6214fb4a58e93a771474d2d@de.adit-jv.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-originating-ip: [10.72.94.141]
Content-Type: multipart/mixed;
	boundary="_004_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_"
MIME-Version: 1.0
Subject: [virtio-comment] virtio sound: add missing definitions for 12 and 24kHz sampling rates

--_004_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_
Content-Type: multipart/alternative;
	boundary="_000_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_"

--_000_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'd like to add two more sampling rates to the virtio sound specification.


Regards,
Andreas Pape


--_000_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@Yu Gothic";
	panose-1:2 11 4 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"DE">Hi,<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal">I&#8217;d like to add two more sampling rates to the=
 virtio sound specification.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Andreas Pape<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_--

--_004_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_
Content-Type: application/octet-stream;
	name="0001-sound-add-sampling-rates-12000Hz-and-24000Hz.patch"
Content-Description: 0001-sound-add-sampling-rates-12000Hz-and-24000Hz.patch
Content-Disposition: attachment;
	filename="0001-sound-add-sampling-rates-12000Hz-and-24000Hz.patch";
	size=1023; creation-date="Thu, 09 Nov 2023 15:28:09 GMT";
	modification-date="Thu, 09 Nov 2023 15:25:40 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwNjdkZTdhNjY3NmRhZDNlY2FhZjIzMTY2NjFiMGYwMDU3YTE5Y2QyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZWFzIFBhcGUgPGFwYXBlQGRlLmFkaXQtanYuY29tPgpE
YXRlOiBUaHUsIDkgTm92IDIwMjMgMTY6MTQ6NTcgKzAxMDAKU3ViamVjdDogW1BBVENIXSBzb3Vu
ZDogYWRkIHNhbXBsaW5nIHJhdGVzIDEyMDAwSHogYW5kIDI0MDAwSHoKCjI0a0h6IGlzIHVzZWQg
Zm9yICdzdXBlciB3aWRlYmFuZCcgdm9pY2UgdHJhbnNtaXNzaW9uCjEya0h6IGlzIGFkZGVkICdm
b3IgY29tcGxldGVuZXNzJwoKU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBQYXBlIDxhcGFwZUBkZS5h
ZGl0LWp2LmNvbT4KLS0tCiBkZXZpY2UtdHlwZXMvc291bmQvZGVzY3JpcHRpb24udGV4IHwgNCAr
KystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZGV2aWNlLXR5cGVzL3NvdW5kL2Rlc2NyaXB0aW9uLnRleCBiL2RldmljZS10eXBl
cy9zb3VuZC9kZXNjcmlwdGlvbi50ZXgKaW5kZXggNTRjOWM4ZS4uYmFkNDQxNSAxMDA2NDQKLS0t
IGEvZGV2aWNlLXR5cGVzL3NvdW5kL2Rlc2NyaXB0aW9uLnRleAorKysgYi9kZXZpY2UtdHlwZXMv
c291bmQvZGVzY3JpcHRpb24udGV4CkBAIC01MDQsNyArNTA0LDkgQEAgXHN1YnN1YnNlY3Rpb257
UENNIENvbnRyb2wgTWVzc2FnZXN9XGxhYmVse3NlYzpEZXZpY2UgVHlwZXMgLyBTb3VuZCBEZXZp
Y2UgLyBEZXYKICAgICBWSVJUSU9fU05EX1BDTV9SQVRFXzk2MDAwLAogICAgIFZJUlRJT19TTkRf
UENNX1JBVEVfMTc2NDAwLAogICAgIFZJUlRJT19TTkRfUENNX1JBVEVfMTkyMDAwLAotICAgIFZJ
UlRJT19TTkRfUENNX1JBVEVfMzg0MDAwCisgICAgVklSVElPX1NORF9QQ01fUkFURV8zODQwMDAs
CisgICAgVklSVElPX1NORF9QQ01fUkFURV8xMjAwMCwKKyAgICBWSVJUSU9fU05EX1BDTV9SQVRF
XzI0MDAwCiB9OwogCiBzdHJ1Y3QgdmlydGlvX3NuZF9wY21faW5mbyB7Ci0tIAoyLjcuNAoK


--_004_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_
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
--_004_329f386ba6214fb4a58e93a771474d2ddeaditjvcom_--
