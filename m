Return-Path: <mtsirkin@redhat.com>
MIME-Version: 1.0
References: <4735344.EBYxvr1mta@silver> <2620465.pcdoKKQM6k@silver>
In-Reply-To: <2620465.pcdoKKQM6k@silver>
From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Sat, 19 Mar 2022 11:33:49 +0200
Message-ID: <CAJWYKVxGygN42ukOE9eoT9ksK9zxwJD5d0jy--_T6=5d=eBoEA@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Type: multipart/alternative; boundary="000000000000b8098e05da8ef6ee"
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000b8098e05da8ef6ee
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022, 15:47 Christian Schoenebeck <qemu_oss@crudebyte.com>
wrote:

> This new feature flag allows to decouple the maximum amount of
> descriptors in indirect descriptor tables from the Queue Size.
>



if we are extending these limits, I suggest reusing the feature flag to
also add a limit on total s/g list size. making it separate from queue size
was requested a while ago.





> The new term "Queue Indirect Size" is introduced for this purpose,
> which is a transport specific configuration whose negotiation is
> further specified for each transport with subsequent patches.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  content.tex     | 32 ++++++++++++++++++++++++++++++--
>  packed-ring.tex |  2 +-
>  split-ring.tex  |  8 ++++++--
>  3 files changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index c6f116c..685525d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a
> Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>
> -\item[24 to 40] Feature bits reserved for extensions to the queue and
> +\item[24 to 41] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms
>
> -\item[41 to 49, and 128 and above] Feature bits reserved for future
> extensions.
> +\item[42 to 49, and 128 and above] Feature bits reserved for future
> extensions.
>  \end{description}
>
>  \begin{note}
> @@ -1051,6 +1051,10 @@ \subsubsection{Common configuration structure
> layout}\label{sec:Virtio Transport
>  present either a value of 0 or a power of 2 in
>  \field{queue_size}.
>
> +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the device MUST
> provide the
> +Queue Indirect Size supported by device, which is a transport specific
> +configuration. It MUST allow the driver to set a lower value.
> +
>  \drivernormative{\paragraph}{Common configuration structure
> layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout
> / Common configuration structure layout}
>
>  The driver MUST NOT write to \field{device_feature}, \field{num_queues},
> \field{config_generation}, \field{queue_notify_off} or
> \field{queue_notify_data}.
> @@ -6847,6 +6851,30 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> Feature Bits}
>    that the driver can reset a queue individually.
>    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues /
> Virtqueue Reset}.
>
> +  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates that the
> +  Queue Indirect Size, i.e. the maximum amount of descriptors in indirect
> +  descriptor tables, is independent from the Queue Size.
> +
> +  Without this feature, the Queue Size limits the length of the descriptor
> +  chain, including indirect descriptor tables as in \ref{sec:Basic
> Facilities of
> +  a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect
> +  Descriptors}, i.e. both the maximum amount of slots in the vring and the
> +  actual bulk data size transmitted per vring slot.
>


spect does not call these  slots elsewhere.


+
> +  With this feature enabled, the Queue Size only limits the maximum amount
> +  of slots in the vring, but does not limit the actual bulk data size
> +  being transmitted when indirect descriptors are used. Decoupling these
> +  two configuration parameters this way not only allows much larger bulk
> data
> +  being transferred per vring slot, but also avoids complicated
> synchronization
> +  mechanisms if the device only supports a very small amount of vring
> slots. Due
> +  to the 16-bit size of a descriptor's "next" field there is still an
> absolute
> +  limit of $2^{16}$ descriptors per indirect descriptor table. However the
> +  actual maximum amount supported by either device or driver might be
> less,
> +  and therefore the bus specific Queue Indirect Size value MUST
> additionally
> +  be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to
> subsequently
> +  negotiate the actual amount of maximum indirect descriptors supported
> +  by both sides.
>


still not sure what exactly is the value. e.g. in a buffer including
indirect and direct descriptors.

+
>  \end{description}
>
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/packed-ring.tex b/packed-ring.tex
> index a9e6c16..e26d112 100644
> --- a/packed-ring.tex
> +++ b/packed-ring.tex
> @@ -195,7 +195,7 @@ \subsection{Scatter-Gather Support}
>  The device limits the number of descriptors in a list through a
>  transport-specific and/or device-specific value. If not limited,
>  the maximum number of descriptors in a list is the virt queue
> -size.
> +size unless the VIRTIO_RING_F_INDIRECT_SIZE feature has been negotiated.
>
>  \subsection{Next Flag: Descriptor Chaining}
>  \label{sec:Packed Virtqueues / Next Flag: Descriptor Chaining}
> diff --git a/split-ring.tex b/split-ring.tex
> index de94038..eaa90c3 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -268,8 +268,12 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic
> Facilities of a Virtio Devi
>  set the VIRTQ_DESC_F_INDIRECT flag within an indirect descriptor (ie. only
>  one table per descriptor).
>
> -A driver MUST NOT create a descriptor chain longer than the Queue Size of
> -the device.
>

+If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the driver MUST
> +NOT create a descriptor chain longer than the Queue Size of the device.
> +
> +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the number of
> +descriptors per indirect descriptor table MUST NOT exceed the negotiated
> +Queue Indirect Size.
>

it is not negotiated is it?


>
>  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
>  in \field{flags}.
> --
> 2.30.2
>
>
>
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

--000000000000b8098e05da8ef6ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 16, 2022, 15:47 Christian Schoenebeck &lt;=
<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">This new feature flag allows t=
o decouple the maximum amount of<br>
descriptors in indirect descriptor tables from the Queue Size.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">if we are extending these limits=
, I suggest reusing the feature flag to also add a limit on total s/g list =
size. making it separate from queue size was requested a while ago.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
The new term &quot;Queue Indirect Size&quot; is introduced for this purpose=
,<br>
which is a transport specific configuration whose negotiation is<br>
further specified for each transport with subsequent patches.<br>
<br>
Fixes: <a href=3D"https://github.com/oasis-tcs/virtio-spec/issues/122" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/oasis-tcs/v=
irtio-spec/issues/122</a><br>
Signed-off-by: Christian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudeby=
te.com" target=3D"_blank" rel=3D"noreferrer">qemu_oss@crudebyte.com</a>&gt;=
<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0content.tex=C2=A0 =C2=A0 =C2=A0| 32 ++++++++++++++++++++++++++++++--<=
br>
=C2=A0packed-ring.tex |=C2=A0 2 +-<br>
=C2=A0split-ring.tex=C2=A0 |=C2=A0 8 ++++++--<br>
=C2=A03 files changed, 37 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/content.tex b/content.tex<br>
index c6f116c..685525d 100644<br>
--- a/content.tex<br>
+++ b/content.tex<br>
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a =
Virtio Device / Feature B<br>
=C2=A0\begin{description}<br>
=C2=A0\item[0 to 23, and 50 to 127] Feature bits for the specific device ty=
pe<br>
<br>
-\item[24 to 40] Feature bits reserved for extensions to the queue and<br>
+\item[24 to 41] Feature bits reserved for extensions to the queue and<br>
=C2=A0 =C2=A0feature negotiation mechanisms<br>
<br>
-\item[41 to 49, and 128 and above] Feature bits reserved for future extens=
ions.<br>
+\item[42 to 49, and 128 and above] Feature bits reserved for future extens=
ions.<br>
=C2=A0\end{description}<br>
<br>
=C2=A0\begin{note}<br>
@@ -1051,6 +1051,10 @@ \subsubsection{Common configuration structure layout=
}\label{sec:Virtio Transport<br>
=C2=A0present either a value of 0 or a power of 2 in<br>
=C2=A0\field{queue_size}.<br>
<br>
+If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the device MUST provid=
e the<br>
+Queue Indirect Size supported by device, which is a transport specific<br>
+configuration. It MUST allow the driver to set a lower value.<br>
+<br>
=C2=A0\drivernormative{\paragraph}{Common configuration structure layout}{V=
irtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common =
configuration structure layout}<br>
<br>
=C2=A0The driver MUST NOT write to \field{device_feature}, \field{num_queue=
s}, \field{config_generation}, \field{queue_notify_off} or \field{queue_not=
ify_data}.<br>
@@ -6847,6 +6851,30 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved F=
eature Bits}<br>
=C2=A0 =C2=A0that the driver can reset a queue individually.<br>
=C2=A0 =C2=A0See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues =
/ Virtqueue Reset}.<br>
<br>
+=C2=A0 \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates that =
the<br>
+=C2=A0 Queue Indirect Size, i.e. the maximum amount of descriptors in indi=
rect<br>
+=C2=A0 descriptor tables, is independent from the Queue Size.<br>
+<br>
+=C2=A0 Without this feature, the Queue Size limits the length of the descr=
iptor<br>
+=C2=A0 chain, including indirect descriptor tables as in \ref{sec:Basic Fa=
cilities of<br>
+=C2=A0 a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Ind=
irect<br>
+=C2=A0 Descriptors}, i.e. both the maximum amount of slots in the vring an=
d the<br>
+=C2=A0 actual bulk data size transmitted per vring slot.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">spect does not call these=C2=A0 slots elsewhere.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 With this feature enabled, the Queue Size only limits the maximum a=
mount<br>
+=C2=A0 of slots in the vring, but does not limit the actual bulk data size=
<br>
+=C2=A0 being transmitted when indirect descriptors are used. Decoupling th=
ese<br>
+=C2=A0 two configuration parameters this way not only allows much larger b=
ulk data<br>
+=C2=A0 being transferred per vring slot, but also avoids complicated synch=
ronization<br>
+=C2=A0 mechanisms if the device only supports a very small amount of vring=
 slots. Due<br>
+=C2=A0 to the 16-bit size of a descriptor&#39;s &quot;next&quot; field the=
re is still an absolute<br>
+=C2=A0 limit of $2^{16}$ descriptors per indirect descriptor table. Howeve=
r the<br>
+=C2=A0 actual maximum amount supported by either device or driver might be=
 less,<br>
+=C2=A0 and therefore the bus specific Queue Indirect Size value MUST addit=
ionally<br>
+=C2=A0 be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to subs=
equently<br>
+=C2=A0 negotiate the actual amount of maximum indirect descriptors support=
ed<br>
+=C2=A0 by both sides.<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">still not sure what exact=
ly is the value. e.g. in a buffer including indirect and direct descriptors=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
+<br>
=C2=A0\end{description}<br>
<br>
=C2=A0\drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bi=
ts}<br>
diff --git a/packed-ring.tex b/packed-ring.tex<br>
index a9e6c16..e26d112 100644<br>
--- a/packed-ring.tex<br>
+++ b/packed-ring.tex<br>
@@ -195,7 +195,7 @@ \subsection{Scatter-Gather Support}<br>
=C2=A0The device limits the number of descriptors in a list through a<br>
=C2=A0transport-specific and/or device-specific value. If not limited,<br>
=C2=A0the maximum number of descriptors in a list is the virt queue<br>
-size.<br>
+size unless the VIRTIO_RING_F_INDIRECT_SIZE feature has been negotiated.<b=
r>
<br>
=C2=A0\subsection{Next Flag: Descriptor Chaining}<br>
=C2=A0\label{sec:Packed Virtqueues / Next Flag: Descriptor Chaining}<br>
diff --git a/split-ring.tex b/split-ring.tex<br>
index de94038..eaa90c3 100644<br>
--- a/split-ring.tex<br>
+++ b/split-ring.tex<br>
@@ -268,8 +268,12 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic F=
acilities of a Virtio Devi<br>
=C2=A0set the VIRTQ_DESC_F_INDIRECT flag within an indirect descriptor (ie.=
 only<br>
=C2=A0one table per descriptor).<br>
<br>
-A driver MUST NOT create a descriptor chain longer than the Queue Size of<=
br>
-the device.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the driver MUST<br=
>
+NOT create a descriptor chain longer than the Queue Size of the device.<br=
>
+<br>
+If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the number of<br>
+descriptors per indirect descriptor table MUST NOT exceed the negotiated<b=
r>
+Queue Indirect Size.<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">it is not negotiated is it?</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEX=
T<br>
=C2=A0in \field{flags}.<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
<br>
This publicly archived list offers a means to provide input to the<br>
OASIS Virtual I/O Device (VIRTIO) TC.<br>
<br>
In order to verify user consent to the Feedback License terms and<br>
to minimize spam in the list archive, subscription is required<br>
before posting.<br>
<br>
Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org"=
 target=3D"_blank" rel=3D"noreferrer">virtio-comment-subscribe@lists.oasis-=
open.org</a><br>
Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.=
org" target=3D"_blank" rel=3D"noreferrer">virtio-comment-unsubscribe@lists.=
oasis-open.org</a><br>
List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org" targ=
et=3D"_blank" rel=3D"noreferrer">virtio-comment-help@lists.oasis-open.org</=
a><br>
List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-comme=
nt/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.oasis-op=
en.org/archives/virtio-comment/</a><br>
Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.oasi=
s-open.org/who/ipr/feedback_license.pdf</a><br>
List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidelines/=
mailing-lists" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.=
oasis-open.org/policies-guidelines/mailing-lists</a><br>
Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://www.oasis-open.org/commit=
tees/virtio/</a><br>
Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://www.oasis-open.org/join/</a><br>
<br>
</blockquote></div></div></div>

--000000000000b8098e05da8ef6ee--

