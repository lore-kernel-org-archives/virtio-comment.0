Return-Path: <virtio-comment-return-3456-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06990986321
	for <virtio-comment@lists.oasis-open.org>; Mon, 17 Oct 2022 09:19:30 +0000 (UTC)
From: "zouqian (D)" <zouqian4@huawei.com>
Date: Mon, 17 Oct 2022 09:19:24 +0000
Message-ID: <2ce711eafa994d7281bb8ae9cc7dfcc0@huawei.com>
MIME-Version: 1.0
Subject: [virtio-comment] [Resend] about reserving virtio device ID for QingTian Box
 (virtio-qtbox) devices
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_2ce711eafa994d7281bb8ae9cc7dfcc0huaweicom_"
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, "Longpeng (Mike, Cloud Infrastructure Service
 Product Dept.)" <longpeng2@huawei.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--_000_2ce711eafa994d7281bb8ae9cc7dfcc0huaweicom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Huawei Cloud is one of the famous public cloud providers, and its hyperviso=
r is named QingTian. We plan to support the QingTian Box (virtio-qtbox) tha=
t provides some guest-aware features ( for high performance, security, etc.=
 ) in the future, and at least one of them is already in development. The d=
ata transmission is based on the Virtio, so we want to reserve a device id =
( 43 ) for the virtio-qtbox.



virtio-qtbox can help user carve out some resources (e.g. vcpu, mem, pci_de=
v) from the VM and then use these resources to start a sandbox for the user=
. The usage quite likes the software enclave which Nitro already supported,=
 but we have much wider usage, for example, running unikernel + app (e.g. O=
SV + Redis) in the sandbox, it would provide much better performance than t=
he traditional os.



Since virtio-qtbox is developed for virtualization scenarios to isolate res=
ources, it supports live migration and crashes recovery. virtio-qtbox lower=
s the technical threshold for implementing resource isolation in VMs and he=
lps users have a more efficient and secure development platform based on cl=
oud services.



Any comments will be appreciated.


issue: https://github.com/oasis-tcs/virtio-spec/issues/127

mail-list: https://lists.oasis-open.org/archives/virtio-comment/202112/msg0=
0030.html

https://lists.oasis-open.org/archives/virtio-comment/202112/msg00047.html


--_000_2ce711eafa994d7281bb8ae9cc7dfcc0huaweicom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:SimSun;
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:DengXian;
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:SimSun;
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
=09{font-family:DengXian;
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09text-align:justify;
=09text-justify:inter-ideograph;
=09font-size:10.5pt;
=09font-family:DengXian;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:#954F72;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:DengXian;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:DengXian;}
/* Page Definitions */
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">Huawei Cloud =
is one of the famous public cloud providers, and its hypervisor is named Qi=
ngTian. We plan to support the QingTian Box (virtio-qtbox)
 that provides some guest-aware features ( for high performance, security, =
etc. ) in the future, and at least one of them is already in development. T=
he data transmission is based on the Virtio, so we want to reserve a device=
 id ( 43 ) for the virtio-qtbox.<o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&nbsp;<o:p></=
o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">virtio-qtbox =
can help user carve out some resources (e.g. vcpu, mem, pci_dev) from the V=
M and then use these resources to start a sandbox
 for the user. The usage quite likes the software enclave which Nitro alrea=
dy supported, but we have much wider usage, for example, running unikernel =
&#43; app (e.g. OSV &#43; Redis) in the sandbox, it would provide much bett=
er performance than the traditional os.<o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&nbsp;<o:p></=
o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">Since virtio-=
qtbox is developed for virtualization scenarios to isolate resources, it su=
pports live migration and crashes recovery. virtio-qtbox
 lowers the technical threshold for implementing resource isolation in VMs =
and helps users have a more efficient and secure development platform based=
 on cloud services.<o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">&nbsp;<o:p></=
o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">Any comments =
will be appreciated.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">issue:
<a href=3D"https://github.com/oasis-tcs/virtio-spec/issues/127">https://git=
hub.com/oasis-tcs/virtio-spec/issues/127</a><o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">mail-list:
<a href=3D"https://lists.oasis-open.org/archives/virtio-comment/202112/msg0=
0030.html">
https://lists.oasis-open.org/archives/virtio-comment/202112/msg00030.html</=
a><o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"><a href=3D"ht=
tps://lists.oasis-open.org/archives/virtio-comment/202112/msg00047.html">ht=
tps://lists.oasis-open.org/archives/virtio-comment/202112/msg00047.html</a>=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_2ce711eafa994d7281bb8ae9cc7dfcc0huaweicom_--

