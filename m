Return-Path: virtio-comment-return-601-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC46C985F81
	for <virtio-comment@lists.oasis-open.org>; Thu, 31 Jan 2019 13:16:37 +0000 (UTC)
From: "Savir, Gil" <gil.savir@intel.com>
Date: Thu, 31 Jan 2019 13:16:29 +0000
Message-ID: <54DB94AE64EDA14BAB6A1E9641A26B011AC3CFFB@hasmsx109.ger.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_54DB94AE64EDA14BAB6A1E9641A26B011AC3CFFBhasmsx109gercor_"
MIME-Version: 1.0
Subject: [virtio-comment] VirtIO spec issue - Available Buffer Notification Suppression
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Elmaleh, Liron" <liron.elmaleh@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AC3CFFBhasmsx109gercor_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

If VIRTIO_F_EVENT_IDX feature bit is negotiated, then Available Buffer Noti=
fication Suppression mechanism used is avail event (not flags).
The spec (both v1.0 / v1.1-draft) states that the device MAY use this mecha=
nism (Paragraph 2.4.9.2 / 2.6.10.2 respectively).
This statement implies that the device may choose not to use this suppressi=
on mechanism (even if VIRTIO_F_EVENT_IDX was negotiated).

However - there's no way for the device to inform the driver that he is not=
 using avail_event.
As consequence, since there will be a default value in avail_event (probabl=
y 0x0), then the driver will always assume that it has to send notify "once=
-per ring".
This will render performance futile, or force the device to actively update=
 avail_event.

Is there a way for the device to inform the driver that he is not using ava=
il_event (and I missed it)?

If yes, than my apologies for wasting your time.
If no, then I suggest one of the following:

*         Either, to change the "MAY" (referred above) to "MUST",

*        Or, to add way for the device to inform the driver that he is not =
using avail_event (flag /certain reserved value in avail_event /other mecha=
nism).

Thanks,
Gil Savir
Intel Corporation

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AC3CFFBhasmsx109gercor_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
	{mso-list-id:474491758;
	mso-list-type:hybrid;
	mso-list-template-ids:393785256 1938192730 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:Arial;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Hi,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">If VIRTIO_F_EVENT_I=
DX feature bit is negotiated, then Available Buffer Notification Suppressio=
n mechanism used is
<u>avail event</u> (not flags).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">The spec (both v1.0=
 / v1.1-draft) states that the device
<b>MAY</b> use this mechanism (Paragraph 2.4.9.2 / 2.6.10.2 respectively).<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">This statement impl=
ies that the device may choose
<u>not</u> to use this suppression mechanism (even if VIRTIO_F_EVENT_IDX wa=
s negotiated).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">However &#8211; the=
re&#8217;s no way for the device to inform the driver that he is not using
<u>avail_event</u>. <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">As consequence, sin=
ce there will be a default value in
<u>avail_event</u> (probably 0x0), then the driver will always assume that =
it has to send notify &#8220;once-per ring&#8221;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">This will render pe=
rformance futile, or force the device to actively update
<u>avail_event</u>.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Is there a way for =
the device to inform the driver that he is not using
<u>avail_event</u> (and I missed it)?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">If yes, than my apo=
logies for wasting your time.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">If no, then I sugge=
st one of the following:<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"font-size:14.0pt;font-family:S=
ymbol"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &q=
uot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span dir=3D"LTR"></span><span style=3D"font=
-size:14.0pt">&nbsp;Either, to change the &#8220;<b>MAY</b>&#8221; (referre=
d above) to &#8220;<b>MUST</b>&#8221;,
<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"font-size:14.0pt;font-family:S=
ymbol"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt &q=
uot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span dir=3D"LTR"></span><span style=3D"font=
-size:14.0pt">Or, to add way for the device to inform the driver that he is=
 not using
<u>avail_event</u> (flag /certain reserved value in <u>avail_event</u> /oth=
er mechanism).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Gil Savir<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt">Intel Corporation<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:14.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<p>---------------------------------------------------------------------<br>
Intel Israel (74) Limited</p>

<p>This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></body>
</html>

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AC3CFFBhasmsx109gercor_--

