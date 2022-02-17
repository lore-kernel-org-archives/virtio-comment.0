Return-Path: <virtio-comment-return-2753-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9798098647D
	for <virtio-comment@lists.oasis-open.org>; Thu, 17 Feb 2022 12:31:34 +0000 (UTC)
From: "Loghin, Laura" <lauralg@amazon.com>
Date: Thu, 17 Feb 2022 12:31:20 +0000
Message-ID: <1645101080313.3853@amazon.com>
MIME-Version: 1.0
Subject: [virtio-comment] vsock: define a maximum size for the packet data
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_16451010803133853amazoncom_"
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--_000_16451010803133853amazoncom_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,



Would it be possible to define a maximum size for the packet data in the sp=
ec (for example the one from the Linux driver [1])? We are working on a vso=
ck packet implementation in rust-vmm [2], and we would like to check for so=
me sort of limit for the data packet,

without using the limit from a specific driver implementation. We want to d=
o this so that the driver is not allowed to reserve huge chunks of memory. =
VMMs might want to reject packets that have bigger data arrays. This limit =
could probably be defined in the VMM as well, and then propagated/checked w=
here it is needed, but it would be nicer to have one at the spec level.



Thanks,

Laura



[1] https://elixir.bootlin.com/linux/v4.9.12/source/include/linux/virtio_vs=
ock.h#L14

[2] https://github.com/rust-vmm/vm-virtio/pull/131



Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.

--_000_16451010803133853amazoncom_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} --></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hello,</p>
<p><br>
</p>
<p><br>
</p>
<p>Would it be possible to define a maximum size for the packet data in the=
 spec (for example the one from the Linux driver [1])? We are working on a =
vsock packet implementation in rust-vmm [2], and we would like to check for=
 some sort of limit for the data
 packet,</p>
<p>without using the limit from a specific driver implementation. We want t=
o do this so that the driver is not allowed to reserve huge chunks of memor=
y. VMMs might want to reject packets that have bigger data arrays. This lim=
it could probably be defined in
 the VMM as well, and then propagated/checked where it is needed, but it wo=
uld be nicer to have one at the spec level.</p>
<p><br>
</p>
<p><br>
</p>
<p>Thanks,</p>
<p>Laura<br>
</p>
<p><br>
</p>
<p><br>
</p>
<p>[1] <a href=3D"https://elixir.bootlin.com/linux/v4.9.12/source/include/l=
inux/virtio_vsock.h#L14">
https://elixir.bootlin.com/linux/v4.9.12/source/include/linux/virtio_vsock.=
h#L14</a></p>
<p>[2] <a href=3D"https://github.com/rust-vmm/vm-virtio/pull/131">https://g=
ithub.com/rust-vmm/vm-virtio/pull/131</a><br>
</p>
<p></p>

<p><br>
Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.</p>
</body>
</html>

--_000_16451010803133853amazoncom_--

