Return-Path: <virtio-comment-return-3028-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7F65398639D
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 May 2022 09:08:00 +0000 (UTC)
MIME-Version: 1.0
References: <20220512080739.1952344-1-alvaro.karsz@solid-run.com>
 <YoISJYWGYvmLgpmm@stefanha-x1.localdomain> <CACGkMEuhhxR_J1rg_gSDzCtE_qjWfhArJ+civJGgGBGXw0Ctsw@mail.gmail.com>
In-Reply-To: <CACGkMEuhhxR_J1rg_gSDzCtE_qjWfhArJ+civJGgGBGXw0Ctsw@mail.gmail.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Mon, 16 May 2022 12:07:23 +0300
Message-ID: <CAJs=3_BN7UFROkOU7-Zw74Ap=NRuO0PDje5n+zjurotcRz_F3w@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH] Introduction of Virtio Network device
 interrupt coalescing feature
Content-Type: multipart/alternative; boundary="0000000000004d1f4f05df1d5cc8"
To: Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--0000000000004d1f4f05df1d5cc8
Content-Type: text/plain; charset="UTF-8"

>
> so it's possible that the
> notification will be suppressed even after the timer expires or frame
> count is exceeded?


I think that the notifications should be suppressed (if drivers asked) no
matter what coalescing parameters are set.


Also, since the VIRTIO specification usually talks about Notifications
> instead of "interrupts" (see 2.3 Notifications) I think it makes sense
> to use that terminology instead of "interrupts". Interrupts are more of
> transport-level (e.g. PCI, MMIO) concept than a VIRTIO device model
> concept.


Ok.

I will create a new version of this patch.



On Mon, May 16, 2022 at 12:02 PM Jason Wang <jasowang@redhat.com> wrote:

> On Mon, May 16, 2022 at 4:58 PM Stefan Hajnoczi <stefanha@redhat.com>
> wrote:
> >
> > On Thu, May 12, 2022 at 11:07:39AM +0300, Alvaro Karsz wrote:
> > > Control a network device interrupt coalescing parameters using the
> control virtqueue.
> > > A new control class was added: VIRTIO_NET_CTRL_INTR_COAL.
> > >
> > > This class provides 2 commands:
> > > - VIRTIO_NET_CTRL_INTR_COAL_USECS_SET:
> > >   Ask the network device to change the rx-usecs and tx-usecs
> parameters.
> > >   rx-usecs - Time to delay an RX interrupt after packet arrival in
> microseconds.
> > >   tx-usecs - Time to delay a TX interrupt after a sending a packet in
> microseconds.
> > >
> > > - VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET:
> > >   Ask the network device to change the rx-max-frames and tx-max-frames
> parameters.
> > >   rx-max-frames - Number of packets to delay an RX interrupt after
> packet arrival.
> > >   tx-max-frames - Number of packets to delay a TX interrupt after
> sending a packet.
> > >
> > >
> > > Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> > > ---
> > >  content.tex | 41 +++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> >
> > Please add a sentence about how this interacts with Used Buffer
> > Notification Suppression. My guess is that suppression takes effect in
> > addition to virtio-net-specific coalescing, so it's possible that the
> > notification will be suppressed even after the timer expires or frame
> > count is exceeded?
>
> My understanding is that, as you suggest, it's actually a coalsing of
> notification. So this should work after
>
> 1) Notification Suppression: if driver doesn't want notification, the
> device does not care about coalescing
> 2) Event idx: the notification sent for event must still be coalesced
>
> Anyhow, I agree we need to clarify these.
>
> Thanks
>
> >
> > Also, since the VIRTIO specification usually talks about Notifications
> > instead of "interrupts" (see 2.3 Notifications) I think it makes sense
> > to use that terminology instead of "interrupts". Interrupts are more of
> > transport-level (e.g. PCI, MMIO) concept than a VIRTIO device model
> > concept.
>
>

--

--0000000000004d1f4f05df1d5cc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">so it&#39;s possible that the<br>notification will be suppressed=
 even after the timer expires or frame<br>count is exceeded?</blockquote><d=
iv><br></div><div>I think that the notifications should be suppressed (if d=
rivers asked) no matter what coalescing parameters are set.</div><div><br><=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Also,=
 since the VIRTIO specification usually talks about Notifications<br>instea=
d of &quot;interrupts&quot; (see 2.3 Notifications) I think it makes sense<=
br>to use that terminology instead of &quot;interrupts&quot;. Interrupts ar=
e more of<br>transport-level (e.g. PCI, MMIO) concept than a VIRTIO device =
model<br>concept.</blockquote><div><br></div><div>Ok.</div><div><br></div><=
div>I will create a new version of this patch.</div><br class=3D"gmail-Appl=
e-interchange-newline"></div><br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, May 16, 2022 at 12:02 PM Jason Wang &lt;=
<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, May 16, 2=
022 at 4:58 PM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" t=
arget=3D"_blank">stefanha@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, May 12, 2022 at 11:07:39AM +0300, Alvaro Karsz wrote:<br>
&gt; &gt; Control a network device interrupt coalescing parameters using th=
e control virtqueue.<br>
&gt; &gt; A new control class was added: VIRTIO_NET_CTRL_INTR_COAL.<br>
&gt; &gt;<br>
&gt; &gt; This class provides 2 commands:<br>
&gt; &gt; - VIRTIO_NET_CTRL_INTR_COAL_USECS_SET:<br>
&gt; &gt;=C2=A0 =C2=A0Ask the network device to change the rx-usecs and tx-=
usecs parameters.<br>
&gt; &gt;=C2=A0 =C2=A0rx-usecs - Time to delay an RX interrupt after packet=
 arrival in microseconds.<br>
&gt; &gt;=C2=A0 =C2=A0tx-usecs - Time to delay a TX interrupt after a sendi=
ng a packet in microseconds.<br>
&gt; &gt;<br>
&gt; &gt; - VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET:<br>
&gt; &gt;=C2=A0 =C2=A0Ask the network device to change the rx-max-frames an=
d tx-max-frames parameters.<br>
&gt; &gt;=C2=A0 =C2=A0rx-max-frames - Number of packets to delay an RX inte=
rrupt after packet arrival.<br>
&gt; &gt;=C2=A0 =C2=A0tx-max-frames - Number of packets to delay a TX inter=
rupt after sending a packet.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alvaro Karsz &lt;<a href=3D"mailto:alvaro.karsz@so=
lid-run.com" target=3D"_blank">alvaro.karsz@solid-run.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 content.tex | 41 +++++++++++++++++++++++++++++++++++++++++<=
br>
&gt; &gt;=C2=A0 1 file changed, 41 insertions(+)<br>
&gt;<br>
&gt; Please add a sentence about how this interacts with Used Buffer<br>
&gt; Notification Suppression. My guess is that suppression takes effect in=
<br>
&gt; addition to virtio-net-specific coalescing, so it&#39;s possible that =
the<br>
&gt; notification will be suppressed even after the timer expires or frame<=
br>
&gt; count is exceeded?<br>
<br>
My understanding is that, as you suggest, it&#39;s actually a coalsing of<b=
r>
notification. So this should work after<br>
<br>
1) Notification Suppression: if driver doesn&#39;t want notification, the<b=
r>
device does not care about coalescing<br>
2) Event idx: the notification sent for event must still be coalesced<br>
<br>
Anyhow, I agree we need to clarify these.<br>
<br>
Thanks<br>
<br>
&gt;<br>
&gt; Also, since the VIRTIO specification usually talks about Notifications=
<br>
&gt; instead of &quot;interrupts&quot; (see 2.3 Notifications) I think it m=
akes sense<br>
&gt; to use that terminology instead of &quot;interrupts&quot;. Interrupts =
are more of<br>
&gt; transport-level (e.g. PCI, MMIO) concept than a VIRTIO device model<br=
>
&gt; concept.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr" style=3D"color=
:rgb(136,136,136)"><br></div></div></div></div>

--0000000000004d1f4f05df1d5cc8--

