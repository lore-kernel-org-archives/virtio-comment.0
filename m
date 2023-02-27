Return-Path: <virtio-comment-return-4572-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B309B9865F8
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Feb 2023 20:27:43 +0000 (UTC)
MIME-Version: 1.0
References: <CAJ3Dt_XZJX=f-WkbD_wESFLztFyKNW_3TUAPnG-H_SpL6H0YaQ@mail.gmail.com>
 <Yii/ToLoR5t9KFjr@stefanha-x1.localdomain> <CAJ3Dt_VTcT64n7bPiRkBBM=SyQWYF1wYYuQr2UnPtZZ-33P9FA@mail.gmail.com>
In-Reply-To: <CAJ3Dt_VTcT64n7bPiRkBBM=SyQWYF1wYYuQr2UnPtZZ-33P9FA@mail.gmail.com>
From: Gordon Stewart <gordon@bedrocksystems.com>
Date: Mon, 27 Feb 2023 15:27:25 -0500
Message-ID: <CAC9-NftTiN=g1myoXfqfqUGgvxf+_c_-4+p3zG2sEiXGdStgdw@mail.gmail.com>
Subject: Fwd: [virtio-comment] virtio-net : 5.1.6.2 descriptor-chains on transmitq
Content-Type: multipart/mixed; boundary="00000000000098c9cb05f5b44f18"
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--00000000000098c9cb05f5b44f18
Content-Type: multipart/alternative; boundary="00000000000098c9c905f5b44f16"

--00000000000098c9c905f5b44f16
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

It took us a while to follow-up on this -- apologies.

Here's a patch:

From: Gordon Stewart <gordon@bedrocksystems.com>
Date: Mon, 27 Feb 2023 13:59:45 -0500
Subject: [PATCH] 5.1.6.2 Packet Transmission; clarify "output descriptor"

---
 device-types/net/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 0500bb6..98f0f20 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -487,8 +487,8 @@ \subsubsection{Packet
Transmission}\label{sec:Device Types / Network Device / De

 \item \field{num_buffers} is set to zero.  This field is unused on
transmitted packets.

-\item The header and packet are added as one output descriptor to the
-  transmitq, and the device is notified of the new entry
+\item The header and packet output descriptors are added as one buffer to
+  the transmitq, and the device is notified of the new entry
   (see \ref{sec:Device Types / Network Device / Device
Initialization}~\nameref{sec:Device Types / Network Device / Device
Initialization}).
 \end{enumerate}

- Gordon

---------- Forwarded message ---------
From: Stefan Hajnoczi <stefanha@redhat.com>
Date: Wed, Mar 9, 2022 at 7:53 PM
Subject: Re: [virtio-comment] virtio-net : 5.1.6.2 descriptor-chains
on transmitq
To: Awais Masood <awais@bedrocksystems.com>
Cc: <virtio-comment@lists.oasis-open.org>


On Wed, Mar 09, 2022 at 06:00:08PM +0500, Awais Masood wrote:
> Hi,
>
> Seeking some clarity on:
>
>  5.1.6.2
>  Packet Transmission
>
>  5. The header and packet are added as one output descriptor to the
> transmitq, and the device is notified of the new entry
>
> Does it imply no descriptor-chains for packets in transmitq? If
> descriptor-chains are allowed on transmitq then why does it not state
> 'output buffer' instead of 'output descriptor'?

Good point, the spec is misleading.

TX buffers can be chains and/or use indirect descriptors. I think it
should read:

  The header and packet output descriptors are added as one buffer to
  the transmitq, and the device is notified of the new entry

There are no restrictions on descriptor framing, it would violate the
spec:

  2.6.4 Message Framing

  The framing of messages with descriptors is independent of the
  contents of the buffers. For example, a network transmit buffer
  consists of a 12 byte header followed by the network packet. This
  could be most simply placed in the descriptor table as a 12 byte
  output descriptor followed by a 1514 byte output descriptor, but it
  could also consist of a single 1526 byte output descriptor in the case
  where the header and packet are adjacent, or even three or more
  descriptors (possibly with loss of efficiency in that case).

Would you like to send a patch to update the spec? The guidelines for
contributing spec changes are here:
https://github.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTING.md

Stefan


-- 
Gordon Stewart
gordon@bedrocksystems.com

BedRock

Systems Inc
*UNBREAKABLE FOUNDATION* *FOR *
*FORMALLY SECURED COMPUTING*

--00000000000098c9c905f5b44f16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefan,<div><br></div><div>It took us a while to follow=
-up on this -- apologies.</div><div><br></div><div>Here&#39;s a patch:</div=
><div><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap">From: Gordon Ste=
wart &lt;<a href=3D"mailto:gordon@bedrocksystems.com">gordon@bedrocksystems=
.com</a>&gt;
Date: Mon, 27 Feb 2023 13:59:45 -0500
Subject: [PATCH] 5.1.6.2 Packet Transmission; clarify &quot;output descript=
or&quot;

---
 device-types/net/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/descriptio=
n.tex
index 0500bb6..98f0f20 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -487,8 +487,8 @@ \subsubsection{Packet Transmission}\label{sec:Device Ty=
pes / Network Device / De
=20
 \item \field{num_buffers} is set to zero.  This field is unused on transmi=
tted packets.
=20
-\item The header and packet are added as one output descriptor to the
-  transmitq, and the device is notified of the new entry
+\item The header and packet output descriptors are added as one buffer to
+  the transmitq, and the device is notified of the new entry
   (see \ref{sec:Device Types / Network Device / Device Initialization}~\na=
meref{sec:Device Types / Network Device / Device Initialization}).
 \end{enumerate}</pre><div>- Gordon</div><div class=3D"gmail_quote"><br>---=
------- Forwarded message ---------<br>
From: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=3D"=
_blank">stefanha@redhat.com</a>&gt;<br>
Date: Wed, Mar 9, 2022 at 7:53 PM<br>
Subject: Re: [virtio-comment] virtio-net : 5.1.6.2 descriptor-chains<br>
on transmitq<br>
To: Awais Masood &lt;<a href=3D"mailto:awais@bedrocksystems.com" target=3D"=
_blank">awais@bedrocksystems.com</a>&gt;<br>
Cc: &lt;<a href=3D"mailto:virtio-comment@lists.oasis-open.org" target=3D"_b=
lank">virtio-comment@lists.oasis-open.org</a>&gt;<br>
<br>
<br>
On Wed, Mar 09, 2022 at 06:00:08PM +0500, Awais Masood wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Seeking some clarity on:<br>
&gt;<br>
&gt;=C2=A0 5.1.6.2<br>
&gt;=C2=A0 Packet Transmission<br>
&gt;<br>
&gt;=C2=A0 5. The header and packet are added as one output descriptor to t=
he<br>
&gt; transmitq, and the device is notified of the new entry<br>
&gt;<br>
&gt; Does it imply no descriptor-chains for packets in transmitq? If<br>
&gt; descriptor-chains are allowed on transmitq then why does it not state<=
br>
&gt; &#39;output buffer&#39; instead of &#39;output descriptor&#39;?<br>
<br>
Good point, the spec is misleading.<br>
<br>
TX buffers can be chains and/or use indirect descriptors. I think it<br>
should read:<br>
<br>
=C2=A0 The header and packet output descriptors are added as one buffer to<=
br>
=C2=A0 the transmitq, and the device is notified of the new entry<br>
<br>
There are no restrictions on descriptor framing, it would violate the<br>
spec:<br>
<br>
=C2=A0 2.6.4 Message Framing<br>
<br>
=C2=A0 The framing of messages with descriptors is independent of the<br>
=C2=A0 contents of the buffers. For example, a network transmit buffer<br>
=C2=A0 consists of a 12 byte header followed by the network packet. This<br=
>
=C2=A0 could be most simply placed in the descriptor table as a 12 byte<br>
=C2=A0 output descriptor followed by a 1514 byte output descriptor, but it<=
br>
=C2=A0 could also consist of a single 1526 byte output descriptor in the ca=
se<br>
=C2=A0 where the header and packet are adjacent, or even three or more<br>
=C2=A0 descriptors (possibly with loss of efficiency in that case).<br>
<br>
Would you like to send a patch to update the spec? The guidelines for<br>
contributing spec changes are here:<br>
<a href=3D"https://github.com/oasis-tcs/virtio-spec/blob/master/CONTRIBUTIN=
G.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/oasis-tcs/vir=
tio-spec/blob/master/CONTRIBUTING.md</a><br>
<br>
Stefan<br>
</div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><span>Gordon =
Stewart</span></div><div dir=3D"ltr"><span><a href=3D"mailto:gordon@bedrock=
systems.com" target=3D"_blank">gordon@bedrocksystems.com</a><br></span></di=
v><p class=3D"MsoNormal" style=3D"text-align:start;word-spacing:0px">
<span style=3D"font-size:16pt;font-family:PRIMETIME;color:rgb(12,107,255)" =
lang=3D"EN-GB">BedRock</span><span style=3D"color:black"></span></p>
<p class=3D"MsoNormal" style=3D"text-align:start;word-spacing:0px">
<span style=3D"font-size:8pt;font-family:&quot;Open Sans&quot;,sans-serif;c=
olor:black" lang=3D"EN-GB">Systems Inc</span><b><span style=3D"font-family:=
&quot;Open Sans&quot;,sans-serif;color:rgb(255,147,0)" lang=3D"EN-GB"><br>
</span></b><b><span style=3D"font-size:10pt;font-family:&quot;Open Sans&quo=
t;,sans-serif;color:rgb(12,107,255)" lang=3D"EN-GB">UNBREAKABLE FOUNDATION<=
/span></b><span style=3D"color:black" lang=3D"EN-GB">
</span><b><span style=3D"font-size:10pt;font-family:&quot;Open Sans&quot;,s=
ans-serif;color:rgb(12,107,255)" lang=3D"EN-GB">FOR
</span></b></p>
<b><span style=3D"font-size:10pt;font-family:&quot;Open Sans&quot;,sans-ser=
if;color:rgb(0,107,255);text-transform:uppercase">FORMALLY SECURED COMPUTIN=
G</span></b></div></div></div></div></div></div></div></div></div></div>

--00000000000098c9c905f5b44f16--

--00000000000098c9cb05f5b44f18
Content-Type: text/plain; charset="US-ASCII"; name="signature.asc"
Content-Disposition: attachment; filename="signature.asc"
Content-Transfer-Encoding: base64
Content-ID: <17f6f318eac61a8e03b1>
X-Attachment-Id: 17f6f318eac61a8e03b1

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NCg0KaVFFekJBRUJDQUFkRmlFRWhwV292OVA1
Zk5xc05YZGFuS1NyczRHcmM4Z0ZBbUlvdjAwQUNna1FuS1NyczRHcg0KYzhnNnpBZ0FrVlhIbTVu
UlkzTE02OG1ZM2R1TEYrY1VSdUdIdDJLUndqS2lOdzNkRVZFb21TMERhTjROTDBVMQ0KNlo3bzgw
dmZrZm1IVTBpNDkydmNUeGh0ajNRMDVkQzRlT1g4S3UyUWFHUEtZczNYVWZFLzJGbldySWZxYTFp
Yw0KUTliOTN3bDNWWktLN3lJdmJ1NHNCc3haM2pjMVhnSjVGdFBPZ3YyN29UZGNPWmJtTzNteUQ4
Q1RLM2V1Q0N0Rg0KZVhjTmlzSHNWckkwb2tQdFIvUXFyK0RraThNM3RTTWtWQkRvRHhaeHJqOE0z
UHE1QXBTR3orTzdqaEVZaTk2Vw0KVVJscnlzc2VXYUhLLzVTanU1enRPNHdVRjRFRmtRWTNvNmE1
WnFRRVNqUlVRM0VtQnpiSlZaU0FvcjhSMXBzWg0Kalcrd1gzNFc3OERycHBqZDNEeDEzSkF1NWJU
ZzFRPT0NCj1wRGppDQotLS0tLUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg==
--00000000000098c9cb05f5b44f18
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
--00000000000098c9cb05f5b44f18--

