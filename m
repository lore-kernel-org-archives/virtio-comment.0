Return-Path: <bobby.eshleman@bytedance.com>
From: Bobby Eshleman <bobby.eshleman@bytedance.com>
In-Reply-To: <20220718142653.42310-1-sgarzare@redhat.com>
Mime-Version: 1.0
References: <20220718142653.42310-1-sgarzare@redhat.com>
Date: Mon, 18 Jul 2022 11:17:26 -0700
Message-ID: <CALa-AnDWjE67j0RMg3kaErLLEL+qgos4XxJDYHY_uB3T7+heCg@mail.gmail.com>
Subject: Re: [External] [PATCH v2] virtio-vsock: add VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
 feature bit
Content-Type: multipart/alternative; boundary="0000000000005403b205e4186166"
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jiang.wang@bytedance.com, Stefan Hajnoczi <stefanha@redhat.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--0000000000005403b205e4186166
Content-Type: text/plain; charset="UTF-8"

Hey Stefano,

Please excuse the late reply to this thread.

I am trying to think through the imagined usage of this bit. Following the
referenced threads,
I am not sure I can clearly see under what version combinations of
driver/device that the bit will be used.

Given that feature bits being zero imply stream support, and
VIRTIO_VSOCK_F_{STREAM,SEQPACKET,DGRAM}
all existing (dgram in the future), how does NO_IMPLIED_STREAM=1 differ
from STREAM=0, SEQPACKET=0,
and DGRAM=1 (for example)?

Thanks,
Bobby

PS. Sorry for the odd [External] prefix... That comes from our company
email system.

From: "Stefano Garzarella"<sgarzare@redhat.com>
Date: Mon, Jul 18, 2022, 7:27 AM
Subject: [External] [PATCH v2] virtio-vsock: add
VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit
To: <virtio-comment@lists.oasis-open.org>
Cc: <jiang.wang@bytedance.com>, "Stefan
Hajnoczi"<stefanha@redhat.com>, "Arseniy
Krasnov"<AVKrasnov@sberdevices.ru>, "Michael S . Tsirkin"<mst@redhat.com>, <
bobby.eshleman@bytedance.com>, "Cornelia Huck"<cohuck@redhat.com>, "Stefano
Garzarella"<sgarzare@redhat.com>
Initially virtio-vsock only supported the stream type, which is why there
was no feature. Later we added the seqpacket type and in the future we may
have other types (e.g. datagram). seqpacket is an extension of stream, so
it might be implied that if seqpacket is supported, stream is too, but this
might not be true for other types. As we discussed here [1] should be
better to add a new VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit to avoid
this implication. Let's also add normative sections to better define the
behavior when VIRTIO_VSOCK_F_NO_IMPLIED_STREAM is negotiated or not. [1]
http://markmail.org/message/2s3qd74drgjxkvte Suggested-by: Michael S.
Tsirkin <mst@redhat.com> Signed-off-by: Stefano Garzarella <
sgarzare@redhat.com> --- v2: - rewrote better normative statements
[Cornelia] - updated conformance.tex with the new sections [Cornelia] v1:
https://markmail.org/message/ybtl4trifrhjnkfe --- conformance.tex | 2 ++
virtio-vsock.tex | 28 ++++++++++++++++++++++++---- 2 files changed, 26
insertions(+), 4 deletions(-) diff --git a/conformance.tex
b/conformance.tex index 663e7c3..98626ba 100644 --- a/conformance.tex +++
b/conformance.tex @@ -229,6 +229,7 @@ \section{Conformance
Targets}\label{sec:Conformance / Conformance Targets} A socket driver MUST
conform to the following normative statements: \begin{itemize} +\item
\ref{drivernormative:Device Types / Socket Device / Feature bits} \item
\ref{drivernormative:Device Types / Socket Device / Device Operation /
Buffer Space Management} \item \ref{drivernormative:Device Types / Socket
Device / Device Operation / Receive and Transmit} \item
\ref{drivernormative:Device Types / Socket Device / Device Operation /
Device Events} @@ -500,6 +501,7 @@ \section{Conformance
Targets}\label{sec:Conformance / Conformance Targets} A socket device MUST
conform to the following normative statements: \begin{itemize} +\item
\ref{devicenormative:Device Types / Socket Device / Feature bits} \item
\ref{devicenormative:Device Types / Socket Device / Device Operation /
Buffer Space Management} \item \ref{devicenormative:Device Types / Socket
Device / Device Operation / Receive and Transmit} \end{itemize} diff --git
a/virtio-vsock.tex b/virtio-vsock.tex index d79984d..b3ff45a 100644 ---
a/virtio-vsock.tex +++ b/virtio-vsock.tex @@ -16,15 +16,35 @@
\subsection{Virtqueues}\label{sec:Device Types / Socket Device /
Virtqueues} \subsection{Feature bits}\label{sec:Device Types / Socket
Device / Feature bits} -If no feature bit is set, only stream socket type
is supported. -If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the device
MAY act -as if VIRTIO_VSOCK_F_STREAM has also been negotiated. -
\begin{description} \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is
supported. \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is
supported. +\item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type
is not implied. \end{description} +\drivernormative{\subsubsection}{Feature
bits}{Device Types / Socket Device / Feature bits} + +The driver SHOULD
accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature if +offered by the
device. + +If no feature bit has been negotiated, the driver SHOULD act as
if +VIRTIO_VSOCK_F_STREAM has been negotiated. + +If
VIRTIO_VSOCK_F_SEQPACKET has been negotiated, but not
+VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
+VIRTIO_VSOCK_F_STREAM has also been negotiated. +
+\devicenormative{\subsubsection}{Feature bits}{Device Types / Socket
Device / Feature bits} + +The device SHOULD offer the
VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature. + +If no feature bit has been
negotiated, the device SHOULD act as if +VIRTIO_VSOCK_F_STREAM has been
negotiated. + +If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, but not
+VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the device MAY act as if
+VIRTIO_VSOCK_F_STREAM has also been negotiated. + \subsection{Device
configuration layout}\label{sec:Device Types / Socket Device / Device
configuration layout} Socket device configuration uses the following layout
structure: -- 2.36.1

--0000000000005403b205e4186166
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div id=3D"editor_version_1.8.2_iR2lCcfj"><div sty=
le=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;margin-bottom:4px=
;line-height:1.6">Hey Stefano,
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">Please =
excuse the late reply to this thread.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">I am tr=
ying to think through the imagined usage of this bit. Following the referen=
ced threads,
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">I am not sure I can clearly see under what =
version combinations of driver/device that the bit will be used.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">Given t=
hat feature bits being zero imply stream support, and VIRTIO_VSOCK_F_{STREA=
M,SEQPACKET,DGRAM}
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">all existing (dgram in the future), how doe=
s NO_IMPLIED_STREAM=3D1 differ from STREAM=3D0, SEQPACKET=3D0,
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">and DGRAM=3D1 (for example)?
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">Thanks,
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">Bobby
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">PS. Sor=
ry for the odd [External] prefix... That comes from our company email syste=
m.
</div></div><div style=3D"list-style-position:inside" id=3D"lark-mail-quote=
-165816823"><div style=3D"border-left:0px;padding-left:0px" class=3D"adit-h=
tml-block adit-html-block--collapsed"><div class=3D"quote-divider-tag-class=
" id=3D"quote-divider-line" style=3D"width:100%;height:1px;margin-top:16px;=
margin-bottom:16px;border-top:1px solid rgb(222,224,227);font-size:0px"><br=
></div><div><div class=3D"adit-html-block__attr quote-head-meta-line" style=
=3D"color:rgb(143,149,158)"><div id=3D"lark-mail-quote-dade265ca02ab0d2ed6e=
eeb858b34c58"><div style=3D"padding-bottom:8px;word-break:break-word;color:=
#8f959e!important"><div style=3D"color:#8f959e!important"><span style=3D"co=
lor:#646a73">From: </span><span style=3D"white-space:nowrap">&quot;Stefano =
Garzarella&quot;&lt;<a class=3D"quote-head-meta-mailto" href=3D"mailto:sgar=
zare@redhat.com" style=3D"white-space:pre-wrap;word-break:break-word;text-d=
ecoration:none;color:unset">sgarzare@redhat.com</a>&gt;</span></div><div st=
yle=3D"color:#8f959e!important"><span style=3D"color:#646a73">Date: </span>=
 Mon, Jul 18, 2022, 7:27 AM</div><div style=3D"color:#8f959e!important"><sp=
an style=3D"color:#646a73">Subject: </span> [External] [PATCH v2] virtio-vs=
ock: add VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit</div><div style=3D"co=
lor:#8f959e!important"><span style=3D"color:#646a73">To: </span><span style=
=3D"white-space:nowrap">&lt;<a class=3D"quote-head-meta-mailto" href=3D"mai=
lto:virtio-comment@lists.oasis-open.org" style=3D"white-space:pre-wrap;word=
-break:break-word;text-decoration:none;color:unset">virtio-comment@lists.oa=
sis-open.org</a>&gt;</span></div><div class=3D"quote-head-meta-last-line" s=
tyle=3D"color:#8f959e!important"><span style=3D"color:#646a73">Cc: </span><=
span style=3D"white-space:nowrap">&lt;<a class=3D"quote-head-meta-mailto" h=
ref=3D"mailto:jiang.wang@bytedance.com" style=3D"white-space:pre-wrap;word-=
break:break-word;text-decoration:none;color:unset">jiang.wang@bytedance.com=
</a>&gt;</span>, <span style=3D"white-space:nowrap">&quot;Stefan Hajnoczi&q=
uot;&lt;<a class=3D"quote-head-meta-mailto" href=3D"mailto:stefanha@redhat.=
com" style=3D"white-space:pre-wrap;word-break:break-word;text-decoration:no=
ne;color:unset">stefanha@redhat.com</a>&gt;</span>, <span style=3D"white-sp=
ace:nowrap">&quot;Arseniy Krasnov&quot;&lt;<a class=3D"quote-head-meta-mail=
to" href=3D"mailto:AVKrasnov@sberdevices.ru" style=3D"white-space:pre-wrap;=
word-break:break-word;text-decoration:none;color:unset">AVKrasnov@sberdevic=
es.ru</a>&gt;</span>, <span style=3D"white-space:nowrap">&quot;Michael S . =
Tsirkin&quot;&lt;<a class=3D"quote-head-meta-mailto" href=3D"mailto:mst@red=
hat.com" style=3D"white-space:pre-wrap;word-break:break-word;text-decoratio=
n:none;color:unset">mst@redhat.com</a>&gt;</span>, <span style=3D"white-spa=
ce:nowrap">&lt;<a class=3D"quote-head-meta-mailto" href=3D"mailto:bobby.esh=
leman@bytedance.com" style=3D"white-space:pre-wrap;word-break:break-word;te=
xt-decoration:none;color:unset">bobby.eshleman@bytedance.com</a>&gt;</span>=
, <span style=3D"white-space:nowrap">&quot;Cornelia Huck&quot;&lt;<a class=
=3D"quote-head-meta-mailto" href=3D"mailto:cohuck@redhat.com" style=3D"whit=
e-space:pre-wrap;word-break:break-word;text-decoration:none;color:unset">co=
huck@redhat.com</a>&gt;</span>, <span style=3D"white-space:nowrap">&quot;St=
efano Garzarella&quot;&lt;<a class=3D"quote-head-meta-mailto" href=3D"mailt=
o:sgarzare@redhat.com" style=3D"white-space:pre-wrap;word-break:break-word;=
text-decoration:none;color:unset">sgarzare@redhat.com</a>&gt;</span></div><=
/div></div></div><div><div style=3D"white-space:pre-wrap"><span>Initially v=
irtio-vsock only supported the stream type, which is why
there was no feature. Later we added the seqpacket type and in the future
we may have other types (e.g. datagram).

seqpacket is an extension of stream, so it might be implied that if
seqpacket is supported, stream is too, but this might not be true for
other types.

As we discussed here [1] should be better to add a new
VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit to avoid this implication.

Let&#39;s also add normative sections to better define the behavior when
VIRTIO_VSOCK_F_NO_IMPLIED_STREAM is negotiated or not.

[1] <a href=3D"http://markmail.org/message/2s3qd74drgjxkvte" target=3D"_bla=
nk">http://markmail.org/message/2s3qd74drgjxkvte</a>

Suggested-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targ=
et=3D"_blank">mst@redhat.com</a>&gt;
Signed-off-by: Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com=
" target=3D"_blank">sgarzare@redhat.com</a>&gt;
---
v2:
- rewrote better normative statements [Cornelia]
- updated conformance.tex with the new sections [Cornelia]

v1: <a href=3D"https://markmail.org/message/ybtl4trifrhjnkfe" target=3D"_bl=
ank">https://markmail.org/message/ybtl4trifrhjnkfe</a>
---
 conformance.tex  |  2 ++
 virtio-vsock.tex | 28 ++++++++++++++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 663e7c3..98626ba 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -229,6 +229,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 A socket driver MUST conform to the following normative statements:
=20
 \begin{itemize}
+\item \ref{drivernormative:Device Types / Socket Device / Feature bits}
 \item \ref{drivernormative:Device Types / Socket Device / Device Operation=
 / Buffer Space Management}
 \item \ref{drivernormative:Device Types / Socket Device / Device Operation=
 / Receive and Transmit}
 \item \ref{drivernormative:Device Types / Socket Device / Device Operation=
 / Device Events}
@@ -500,6 +501,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 A socket device MUST conform to the following normative statements:
=20
 \begin{itemize}
+\item \ref{devicenormative:Device Types / Socket Device / Feature bits}
 \item \ref{devicenormative:Device Types / Socket Device / Device Operation=
 / Buffer Space Management}
 \item \ref{devicenormative:Device Types / Socket Device / Device Operation=
 / Receive and Transmit}
 \end{itemize}
diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index d79984d..b3ff45a 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -16,15 +16,35 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket=
 Device / Virtqueues}
=20
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature=
 bits}
=20
-If no feature bit is set, only stream socket type is supported.
-If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the device MAY act
-as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
-
 \begin{description}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
+\item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not impl=
ied.
 \end{description}
=20
+\drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Devic=
e / Feature bits}
+
+The driver SHOULD accept the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature if
+offered by the device.
+
+If no feature bit has been negotiated, the driver SHOULD act as if
+VIRTIO_VSOCK_F_STREAM has been negotiated.
+
+If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, but not
+VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
+VIRTIO_VSOCK_F_STREAM has also been negotiated.
+
+\devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Devic=
e / Feature bits}
+
+The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
+
+If no feature bit has been negotiated, the device SHOULD act as if
+VIRTIO_VSOCK_F_STREAM has been negotiated.
+
+If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, but not
+VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the device MAY act as if
+VIRTIO_VSOCK_F_STREAM has also been negotiated.
+
 \subsection{Device configuration layout}\label{sec:Device Types / Socket D=
evice / Device configuration layout}
=20
 Socket device configuration uses the following layout structure:
--=20
2.36.1</span></div></div></div></div></div></body></html>

--0000000000005403b205e4186166--

