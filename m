Return-Path: <virtio-comment-return-3318-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2D072986590
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Aug 2022 17:37:34 +0000 (UTC)
From: Cyril Germond <cgermond@kalray.eu>
Date: Thu, 4 Aug 2022 19:37:30 +0200 (CEST)
Message-ID: <001a01d8a828$df564200$9e02c600$@kalray.eu>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-net : Fix virtio_net_hdr struct size when 
 VIRTIO_NET_F_HASH_REPORT feature is negociated.
Content-Type: multipart/alternative;
 boundary=secu_2cdf897643e8f20c1a7f2f19dbe8fc1f_part1
Content-Language: en-us
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--secu_2cdf897643e8f20c1a7f2f19dbe8fc1f_part1
Content-Type: text/plain; charset=utf-8

content.tex    | 4 ++--

split-ring.tex | 6 +++---

2 files changed, 5 insertions(+), 5 deletions(-)

 

diff --git a/content.tex b/content.tex

index e863709..263cb05 100644

--- a/content.tex

+++ b/content.tex

@@ -3620,8 +3620,8 @@ \subsubsection{Setting Up Receive
Buffers}\label{sec:Device Types / Network Devi

features are used, the maximum incoming packet

will be to 65550 bytes long (the maximum size of a

TCP or UDP packet, plus the 14 byte ethernet header), otherwise

-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,

-making for 65562 or 1526 bytes.

+1514 bytes.  The 12-byte (or 16-byte if VIRTIO_NET_F_HASH_REPORT feature
has been negotiated) struct virtio_net_hdr is prepended to this,

+making for 65562 or 1526 bytes (respectively 65566 and 1530 bytes if
VIRTIO_NET_F_HASH_REPORT has been negotiated).

 

\drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types /
Network Device / Device Operation / Setting Up Receive Buffers}

 

diff --git a/split-ring.tex b/split-ring.tex

index de94038..e6953d7 100644

--- a/split-ring.tex

+++ b/split-ring.tex

@@ -128,10 +128,10 @@ \subsection{Legacy Interfaces: A Note on Virtqueue
Endianness}\label{sec:Basic F

\subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device
/ Virtqueues / Message Framing}

The framing of messages with descriptors is

independent of the contents of the buffers. For example, a network

-transmit buffer consists of a 12 byte header followed by the network

+transmit buffer consists of a 12 (or 16 if VIRTIO_NET_F_HASH_REPORT
feature has been negociated) byte header followed by the network

packet. This could be most simply placed in the descriptor table as a

-12 byte output descriptor followed by a 1514 byte output descriptor,

-but it could also consist of a single 1526 byte output descriptor in

+12 (or 16) byte output descriptor followed by a 1514 byte output
descriptor,

+but it could also consist of a single 1526 (or 1530) byte output
descriptor in

the case where the header and packet are adjacent, or even three or

more descriptors (possibly with loss of efficiency in that case).

 




--secu_2cdf897643e8f20c1a7f2f19dbe8fc1f_part1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type" CONTENT=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3D"#0563C1=
" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div class=3DWordSection=
1><p class=3DMsoNormal> content.tex&nbsp;&nbsp;&nbsp; | 4 ++--</p><p class=
=3DMsoNormal> split-ring.tex | 6 +++---</p><p class=3DMsoNormal> 2 files ch=
anged, 5 insertions(+), 5 deletions(-)</p><p class=3DMsoNormal><o:p>&nbsp;<=
/o:p></p><p class=3DMsoNormal>diff --git a/content.tex b/content.tex</p><p =
class=3DMsoNormal>index e863709..263cb05 100644</p><p class=3DMsoNormal><sp=
an lang=3DFR>--- a/content.tex</span></p><p class=3DMsoNormal><span lang=3D=
FR>+++ b/content.tex</span></p><p class=3DMsoNormal>@@ -3620,8 +3620,8 @@ \=
subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network =
Devi</p><p class=3DMsoNormal> features are used, the maximum incoming packe=
t</p><p class=3DMsoNormal> will be to 65550 bytes long (the maximum size of=
 a</p><p class=3DMsoNormal> TCP or UDP packet, plus the 14 byte ethernet he=
ader), otherwise</p><p class=3DMsoNormal>-1514 bytes.&nbsp; The 12-byte str=
uct virtio_net_hdr is prepended to this,</p><p class=3DMsoNormal>-making fo=
r 65562 or 1526 bytes.</p><p class=3DMsoNormal>+1514 bytes.&nbsp; The 12-by=
te (or 16-byte if VIRTIO_NET_F_HASH_REPORT feature has been negotiated) str=
uct virtio_net_hdr is prepended to this,</p><p class=3DMsoNormal>+making fo=
r 65562 or 1526 bytes (respectively 65566 and 1530 bytes if VIRTIO_NET_F_HA=
SH_REPORT has been negotiated).</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></=
p><p class=3DMsoNormal> \drivernormative{\paragraph}{Setting Up Receive Buf=
fers}{Device Types / Network Device / Device Operation / Setting Up Receive=
 Buffers}</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal=
>diff --git a/split-ring.tex b/split-ring.tex</p><p class=3DMsoNormal>index=
 de94038..e6953d7 100644</p><p class=3DMsoNormal>--- a/split-ring.tex</p><p=
 class=3DMsoNormal>+++ b/split-ring.tex</p><p class=3DMsoNormal>@@ -128,10 =
+128,10 @@ \subsection{Legacy Interfaces: A Note on Virtqueue Endianness}\l=
abel{sec:Basic F</p><p class=3DMsoNormal> \subsection{Message Framing}\labe=
l{sec:Basic Facilities of a Virtio Device / Virtqueues / Message Framing}</=
p><p class=3DMsoNormal> The framing of messages with descriptors is</p><p c=
lass=3DMsoNormal> independent of the contents of the buffers. For example, =
a network</p><p class=3DMsoNormal>-transmit buffer consists of a 12 byte he=
ader followed by the network</p><p class=3DMsoNormal>+transmit buffer consi=
sts of a 12 (or 16 if VIRTIO_NET_F_HASH_REPORT feature has been negociated)=
 byte header followed by the network</p><p class=3DMsoNormal> packet. This =
could be most simply placed in the descriptor table as a</p><p class=3DMsoN=
ormal>-12 byte output descriptor followed by a 1514 byte output descriptor,=
</p><p class=3DMsoNormal>-but it could also consist of a single 1526 byte o=
utput descriptor in</p><p class=3DMsoNormal>+12 (or 16) byte output descrip=
tor followed by a 1514 byte output descriptor,</p><p class=3DMsoNormal>+but=
 it could also consist of a single 1526 (or 1530) byte output descriptor in=
</p><p class=3DMsoNormal> the case where the header and packet are adjacent=
, or even three or</p><p class=3DMsoNormal> more descriptors (possibly with=
 loss of efficiency in that case).</p><p class=3DMsoNormal><o:p>&nbsp;</o:p=
></p></div><div id=3D"content_out_cgermond_kalray.eu"></div></body></html>
--secu_2cdf897643e8f20c1a7f2f19dbe8fc1f_part1--


