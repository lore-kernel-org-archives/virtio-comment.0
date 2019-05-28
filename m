Return-Path: virtio-comment-return-738-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39CE8985C98
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 May 2019 12:32:03 +0000 (UTC)
MIME-Version: 1.0
References: <CANerMUUGMJ+x42s2ZzeUA7JZy4c1NMcwJrPBp6Jwwz6huRu9pQ@mail.gmail.com>
 <20190516144915.GA29808@stefanha-x1.localdomain> <CANerMUV_ng40kTk2A+fLbOyFKWvaUDA4S2KsVR-K4e0fDpWnRQ@mail.gmail.com>
 <20190520190526-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190520190526-mutt-send-email-mst@kernel.org>
From: Ariel Adam <aadam@redhat.com>
Date: Tue, 28 May 2019 15:31:47 +0300
Message-ID: <CANerMUXQEwkvjwAhPc5qd1pgPNyEoW5SaBoO-o13SAX_Utj-gw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000488cf0589f1da64"
Subject: Re: [virtio-comment] Clarifying section "2.6.12 virtqueue Operation"
 in virtio-v1.1
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--0000000000000488cf0589f1da64
Content-Type: text/plain; charset="UTF-8"

Sending the actual patch to the list (let me know if anything is missing):


---
 0001-REVISION-update-to-wd02.patch | 20 ++++++++++++++++++++
 split-ring.tex                     | 10 +++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)
 create mode 100644 0001-REVISION-update-to-wd02.patch

diff --git a/0001-REVISION-update-to-wd02.patch
b/0001-REVISION-update-to-wd02.patch
new file mode 100644
index 0000000..ab090ec
--- /dev/null
+++ b/0001-REVISION-update-to-wd02.patch
@@ -0,0 +1,20 @@
+From 37057052e716c6c02c9391342cbc7263f44759f6 Mon Sep 17 00:00:00 2001
+From: "Michael S. Tsirkin" <mst@redhat.com>
+Date: Wed, 27 Mar 2019 18:19:19 -0400
+Subject: [PATCH] REVISION: update to wd02
+
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+---
+ REVISION | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/REVISION b/REVISION
+index beec734..b1157d4 100644
+--- a/REVISION
++++ b/REVISION
+@@ -1 +1 @@
+-virtio-v1.1-wd01
++virtio-v1.1-wd02
+--
+1.8.3.1
+
diff --git a/split-ring.tex b/split-ring.tex
index 123ac9f..5148ac8 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -567,11 +567,11 @@ \subsection{Virtqueue Operation}\label{sec:Basic
Facilities of a Virtio Device /
 the device.

 \begin{note} As an
-example, the simplest virtio network device has two virtqueues: the
-transmit virtqueue and the receive virtqueue. The driver adds
-outgoing (device-readable) packets to the transmit virtqueue, and then
-frees them after they are used. Similarly, incoming (device-writable)
-buffers are added to the receive virtqueue, and processed after
+the simplest virtio network device has two virtqueues: the
+transmit virtqueue and the receive virtqueue. The driver adds
+outgoing packets as device-readable buffers to the transmit virtqueue, and
then
+frees them after they are used. Similarly, device-writable buffers for
incoming
+packets are added to the receive virtqueue, and processed after
 they are used.
 \end{note}

-- 
1.8.3.1


On Tue, May 21, 2019 at 2:06 AM Michael S. Tsirkin <mst@redhat.com> wrote:

>
> Can you please send the patch to the list?
> We don't process pull requests at this point.
>
> On Mon, May 20, 2019 at 06:18:58PM +0300, Ariel Adam wrote:
> > Sent a patch to split-ring.tex:
> >
> > https://github.com/oasis-tcs/virtio-spec/pull/44
> >
> > Thanks.
> >
> > On Thu, May 16, 2019 at 5:49 PM Stefan Hajnoczi <stefanha@redhat.com>
> wrote:
> >
> >     On Wed, May 15, 2019 at 02:42:32PM +0300, Ariel Adam wrote:
> >     > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/43
> >     >
> >     > We'd like to propose clarifying the usage of packets and buffers in
> >     section
> >     > "2.6.12 virtqueue operation" as described in the github issue
> above.
> >
> >     Looks good to me, do you want to send a patch to content.tex?
> >
> >     Stefan
> >
>

--0000000000000488cf0589f1da64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sending the actual patch to the list (let me know if anyth=
ing is missing):<div><br></div><div><br>---<br>=C2=A00001-REVISION-update-t=
o-wd02.patch | 20 ++++++++++++++++++++<br>=C2=A0split-ring.tex =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----=
<br>=C2=A02 files changed, 25 insertions(+), 5 deletions(-)<br>=C2=A0create=
 mode 100644 0001-REVISION-update-to-wd02.patch<br><br>diff --git a/0001-RE=
VISION-update-to-wd02.patch b/0001-REVISION-update-to-wd02.patch<br>new fil=
e mode 100644<br>index 0000000..ab090ec<br>--- /dev/null<br>+++ b/0001-REVI=
SION-update-to-wd02.patch<br>@@ -0,0 +1,20 @@<br>+From 37057052e716c6c02c93=
91342cbc7263f44759f6 Mon Sep 17 00:00:00 2001<br>+From: &quot;Michael S. Ts=
irkin&quot; &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt;<br=
>+Date: Wed, 27 Mar 2019 18:19:19 -0400<br>+Subject: [PATCH] REVISION: upda=
te to wd02<br>+<br>+Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto=
:mst@redhat.com">mst@redhat.com</a>&gt;<br>+---<br>+ REVISION | 2 +-<br>+ 1=
 file changed, 1 insertion(+), 1 deletion(-)<br>+<br>+diff --git a/REVISION=
 b/REVISION<br>+index beec734..b1157d4 100644<br>+--- a/REVISION<br>++++ b/=
REVISION<br>+@@ -1 +1 @@<br>+-virtio-v1.1-wd01<br>++virtio-v1.1-wd02<br>+--=
 <br>+1.8.3.1<br>+<br>diff --git a/split-ring.tex b/split-ring.tex<br>index=
 123ac9f..5148ac8 100644<br>--- a/split-ring.tex<br>+++ b/split-ring.tex<br=
>@@ -567,11 +567,11 @@ \subsection{Virtqueue Operation}\label{sec:Basic Fac=
ilities of a Virtio Device /<br>=C2=A0the device.<br>=C2=A0<br>=C2=A0\begin=
{note} As an<br>-example, the simplest virtio network device has two virtqu=
eues: the<br>-transmit virtqueue and the receive virtqueue. The driver adds=
<br>-outgoing (device-readable) packets to the transmit virtqueue, and then=
<br>-frees them after they are used. Similarly, incoming (device-writable)<=
br>-buffers are added to the receive virtqueue, and processed after<br>+the=
 simplest virtio network device has two virtqueues: the <br>+transmit virtq=
ueue and the receive virtqueue. The driver adds <br>+outgoing packets as de=
vice-readable buffers to the transmit virtqueue, and then <br>+frees them a=
fter they are used. Similarly, device-writable buffers for incoming <br>+pa=
ckets are added to the receive virtqueue, and processed after <br>=C2=A0the=
y are used.<br>=C2=A0\end{note}<br>=C2=A0<br>-- <br>1.8.3.1<br><br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, May 21, 2019 at 2:06 AM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@=
redhat.com">mst@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
Can you please send the patch to the list?<br>
We don&#39;t process pull requests at this point.<br>
<br>
On Mon, May 20, 2019 at 06:18:58PM +0300, Ariel Adam wrote:<br>
&gt; Sent a patch to split-ring.tex:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/oasis-tcs/virtio-spec/pull/44" rel=3D"no=
referrer" target=3D"_blank">https://github.com/oasis-tcs/virtio-spec/pull/4=
4</a><br>
&gt; <br>
&gt; Thanks.=C2=A0<br>
&gt; <br>
&gt; On Thu, May 16, 2019 at 5:49 PM Stefan Hajnoczi &lt;<a href=3D"mailto:=
stefanha@redhat.com" target=3D"_blank">stefanha@redhat.com</a>&gt; wrote:<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, May 15, 2019 at 02:42:32PM +0300, Ariel Ada=
m wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Fixes: <a href=3D"https://github.com/oasis-tcs=
/virtio-spec/issues/43" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/oasis-tcs/virtio-spec/issues/43</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; We&#39;d like to propose clarifying the usage =
of packets and buffers in<br>
&gt;=C2=A0 =C2=A0 =C2=A0section<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;2.6.12 virtqueue operation&quot; as desc=
ribed in the github issue above.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Looks good to me, do you want to send a patch to co=
ntent.tex?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Stefan<br>
&gt; <br>
</blockquote></div>

--0000000000000488cf0589f1da64--
