Return-Path: virtio-comment-return-644-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4518E9849FF
	for <virtio-comment@lists.oasis-open.org>; Sun, 24 Feb 2019 12:30:54 +0000 (UTC)
From: "Savir, Gil" <gil.savir@intel.com>
Date: Sun, 24 Feb 2019 12:30:48 +0000
Message-ID: <54DB94AE64EDA14BAB6A1E9641A26B011AC60D30@hasmsx109.ger.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_54DB94AE64EDA14BAB6A1E9641A26B011AC60D30hasmsx109gercor_"
MIME-Version: 1.0
Subject: [virtio-comment] Block Device: Legacy SCSI 'cmd' Framing Requirements 
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AC60D30hasmsx109gercor_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Regarding  Version 1.1 draft 01

When using Block-device, legacy scsi commands, while VIRTIO_F_ANY_LAYOUT is=
 negotiated, it is not clear if 'cmd' field must reside in a single, separa=
te device-readable buffer.
In Section 5.2.6.3 it is written, in general (without reference to VIRTIO_F=
_ANY_LAYOUT) that 'cmd' field must reside in a single buffer.
Section 5.2.6.4, 2nd bullet describes framing requirements for SCSI command=
s, but does not refer to 'cmd' field.

I suggest adding description of 'cmd' field  framing requirement in this bu=
llet, as well.



Excerpts:

Section 5.2.6.3 (Legacy Interface: Device Operation):
"The cmd field is only present for scsi packet command requests, and indica=
tes the command to perform.
This field MUST reside in a single, separate device-readable buffer;"

Section 5.2.6.4 (Legacy Interface: Framing Requirements):
"For SCSI commands there are additional constraints. errors, data_len, sens=
e_len and residual MUST
reside in a single, separate device-writable descriptor, sense MUST reside =
in a single separate devicewritable
descriptor of size 96 bytes, and errors, data_len, sense_len and residual M=
UST reside a single
separate device-writable descriptor."


Thanks
Gil Savir

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AC60D30hasmsx109gercor_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:ArialMT;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1168132048;
	mso-list-type:hybrid;
	mso-list-template-ids:-1128225780 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:54.0pt;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:90.0pt;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:162.0pt;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:198.0pt;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:234.0pt;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:270.0pt;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:306.0pt;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Regarding &nbsp;Version 1.1 draft 01<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When using Block-device, legacy scsi commands, while=
 <span style=3D"font-size:10.0pt;font-family:ArialMT">
VIRTIO_F_ANY_LAYOUT is negotiated, </span>it is not clear if &#8216;cmd&#82=
17; field must reside in a single, separate device-readable buffer.<o:p></o=
:p></p>
<p class=3D"MsoNormal">In Section 5.2.6.3 it is written, in general (withou=
t reference to
<span style=3D"font-size:10.0pt;font-family:ArialMT">VIRTIO_F_ANY_LAYOUT) t=
hat </span>
&#8216;cmd&#8217; field must reside in a single buffer.<o:p></o:p></p>
<p class=3D"MsoNormal">Section 5.2.6.4, 2<sup>nd</sup> bullet describes fra=
ming requirements for SCSI commands, but does not refer to &#8216;cmd&#8217=
; field.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I suggest adding description of &#8216;cmd&#8217; fi=
eld &nbsp;framing requirement in this bullet, as well.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Excerpts:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Section 5.2.6.3 (Legacy Interface: Device Operation)=
:<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;The cmd field is only present for scsi packet=
 command requests, and indicates the command to perform.<o:p></o:p></p>
<p class=3D"MsoNormal">This field MUST reside in a single, separate device-=
readable buffer;&#8221;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Section 5.2.6.4 (Legacy Interface: Framing Requireme=
nts):<o:p></o:p></p>
<p class=3D"MsoNormal">&#8220;For SCSI commands there are additional constr=
aints. errors, data_len, sense_len and residual MUST<o:p></o:p></p>
<p class=3D"MsoNormal">reside in a single, separate device-writable descrip=
tor, sense MUST reside in a single separate devicewritable<o:p></o:p></p>
<p class=3D"MsoNormal">descriptor of size 96 bytes, and errors, data_len, s=
ense_len and residual MUST reside a single<o:p></o:p></p>
<p class=3D"MsoNormal">separate device-writable descriptor.&#8221;<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Gil Savir<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p>---------------------------------------------------------------------<br>
Intel Israel (74) Limited</p>

<p>This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></body>
</html>

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AC60D30hasmsx109gercor_--

