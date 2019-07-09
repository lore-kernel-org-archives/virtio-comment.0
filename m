Return-Path: virtio-comment-return-784-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D78AF985D36
	for <virtio-comment@lists.oasis-open.org>; Tue,  9 Jul 2019 08:33:23 +0000 (UTC)
From: "Savir, Gil" <gil.savir@intel.com>
Date: Tue, 9 Jul 2019 08:33:16 +0000
Message-ID: <54DB94AE64EDA14BAB6A1E9641A26B011AE25713@hasmsx109.ger.corp.intel.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_54DB94AE64EDA14BAB6A1E9641A26B011AE25713hasmsx109gercor_"
MIME-Version: 1.0
Subject: [virtio-comment] RE: VIRTIO_NET_F_MRG_RXBUF number of descriptors
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AE25713hasmsx109gercor_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In addition I suggest, Section 5.1.6.4 (Processing of Incoming Packets) sho=
uld be changed from:
"
1. num_buffers indicates how many descriptors this packet is spread over (i=
ncluding this one): this will always be 1 if VIRTIO_NET_F_MRG_RXBUF was not=
 negotiated. This allows receipt of large packets without having to allocat=
e large buffers: a packet that does not fit in a single buffer can flow ove=
r to the next buffer, and so on. In this case, there will be at least num_b=
uffers used buffers in the virtqueue, and the device chains them together t=
o form a single packet in a way similar to how it would store it in a singl=
e buffer spread over multiple descriptors. The other buffers will not begin=
 with a struct virtio_net_hdr.
2. If num_buffers is one, then the entire packet will be contained within t=
his buffer, immediately following the struct virtio_net_hdr.
"

to

"
1. num_buffers indicates how many descriptor-chains this packet is spread o=
ver (including this one): this will always be 1 if VIRTIO_NET_F_MRG_RXBUF w=
as not negotiated. This allows receipt of large packets without having to a=
llocate large buffers: a packet that does not fit in a single buffer can fl=
ow over to the next buffer, and so on. In this case, there will be at least=
 num_buffers used buffers in the virtqueue, and the device merge them toget=
her to form a single packet. The other buffers will not begin with a struct=
 virtio_net_hdr.
2. If num_buffers is one, then the entire packet will be contained within t=
his descriptors-chain, immediately following the struct virtio_net_hdr.
"

This, in order to prevent more confusion, caused by the use of the word "de=
scriptor" interchanging as between descriptor and descriptor-chain.


Thanks,
Gil


-----Original Message-----
From: Savir, Gil
Sent: Tuesday, 9 July, 2019 09:35
To: virtio-comment@lists.oasis-open.org
Subject: VIRTIO_NET_F_MRG_RXBUF number of descriptors

Hi,

v1.1 states at Section 5.1.6.3.2 (Device Requirements: Setting Up Receive B=
uffers):
        "The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_R=
XBUF was not negotiated."
That's a mistake, since the device can, and should be able to use multiple =
descriptors, pertaining to the same descriptors chain.

Therefore I suggest to change it to:
        " The device MUST use only a single descriptor-chain if VIRTIO_NET_=
F_MRG_RXBUF was not negotiated."

BTW, as result of this wrongly formulated sentence, I came across many peop=
le (including my-past-self) that confuse MRG_RXBUF feature with descriptors=
-chain support.
Fixing it will help avoiding this confusion.

Thanks,
Gil


---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AE25713hasmsx109gercor_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>In addition I suggest, Section 5.1.6.4 (Processing of Incoming Packets=
) should be changed from:</div>
<div>&quot;</div>
<div><font face=3D"ArialMT" size=3D"2"><span style=3D"font-size:10pt;">1. <=
font face=3D"Arial-ItalicMT"><i>num_buffers </i></font>indicates how many d=
escriptors this packet is spread over (including this one): this will alway=
s be 1 if VIRTIO_NET_F_MRG_RXBUF was not
negotiated. This allows receipt of large packets without having to allocate=
 large buffers: a packet that does not fit in a single buffer can flow over=
 to the next buffer, and so on. In this case, there will be at least <font =
face=3D"Arial-ItalicMT"><i>num_buffers
</i></font>used buffers in the virtqueue, and the device chains them togeth=
er to form a single packet in a way similar to how it would store it in a s=
ingle buffer spread over multiple descriptors. The other buffers will not b=
egin with a struct virtio_net_hdr.</span></font></div>
<div><font face=3D"ArialMT" size=3D"2"><span style=3D"font-size:10pt;">2. I=
f <font face=3D"Arial-ItalicMT"><i>num_buffers </i></font>is one, then the =
entire packet will be contained within this buffer, immediately following t=
he struct virtio_net_hdr.</span></font></div>
<div>&quot;</div>
<div>&nbsp;</div>
<div>to</div>
<div>&nbsp;</div>
<div>&quot;</div>
<div><font face=3D"ArialMT" size=3D"2"><span style=3D"font-size:10pt;">1. <=
font face=3D"Arial-ItalicMT"><i>num_buffers </i></font>indicates how many d=
escriptor-chains this packet is spread over (including this one): this will=
 always be 1 if VIRTIO_NET_F_MRG_RXBUF was
not negotiated. This allows receipt of large packets without having to allo=
cate large buffers: a packet that does not fit in a single buffer can flow =
over to the next buffer, and so on. In this case, there will be at least <f=
ont face=3D"Arial-ItalicMT"><i>num_buffers
</i></font>used buffers in the virtqueue, and the device merge them togethe=
r to form a single packet. The other buffers will not begin with a struct v=
irtio_net_hdr.</span></font></div>
<div><font face=3D"ArialMT" size=3D"2"><span style=3D"font-size:10pt;">2. I=
f <font face=3D"Arial-ItalicMT"><i>num_buffers </i></font>is one, then the =
entire packet will be contained within this descriptors-chain, immediately =
following the struct virtio_net_hdr.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></div>
<div>&quot;</div>
<div>&nbsp;</div>
<div>This, in order to prevent more confusion, caused by the use of the wor=
d &#8220;descriptor&#8221; interchanging as between descriptor and descript=
or-chain.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Gil</div>
<div>&nbsp;</div>
<a name=3D"_MailEndCompose"></a>
<div>&nbsp;</div>
<a name=3D"_____replyseparator"></a>
<div>-----Original Message-----<br>

From: Savir, Gil <br>

Sent: Tuesday, 9 July, 2019 09:35<br>

To: virtio-comment@lists.oasis-open.org<br>

Subject: VIRTIO_NET_F_MRG_RXBUF number of descriptors</div>
<div>&nbsp;</div>
<div>Hi,</div>
<div>&nbsp;</div>
<div>v1.1 states at Section 5.1.6.3.2 (Device Requirements: Setting Up Rece=
ive Buffers): </div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#8221;The device MUST use =
only a single descriptor if VIRTIO_NET_F_MRG_RXBUF was not negotiated.&#822=
1; </div>
<div>That's a mistake, since the device can, and should be able to use mult=
iple descriptors, pertaining to the same descriptors chain.</div>
<div>&nbsp;</div>
<div>Therefore I suggest to change it to: </div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot; The device MUST use =
only a single descriptor-chain if VIRTIO_NET_F_MRG_RXBUF was not negotiated=
.&quot;</div>
<div>&nbsp;</div>
<div>BTW, as result of this wrongly formulated sentence, I came across many=
 people (including my-past-self) that confuse MRG_RXBUF feature with descri=
ptors-chain support.</div>
<div>Fixing it will help avoiding this confusion. </div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Gil</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
<p>---------------------------------------------------------------------<br>
Intel Israel (74) Limited</p>

<p>This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></body>
</html>

--_000_54DB94AE64EDA14BAB6A1E9641A26B011AE25713hasmsx109gercor_--

