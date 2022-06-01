Return-Path: <virtio-comment-return-3088-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A16D986113
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Jun 2022 05:58:18 +0000 (UTC)
MIME-Version: 1.0
References: <20220519084551.18119-1-alvaro.karsz@solid-run.com>
 <CACGkMEuzk_dyZPnNc7UeYFfyxDABXA5+Lj6iMGUUMesJQyf77A@mail.gmail.com>
 <CAJs=3_Bd8GZt1X4bjFnqT_c=cG6s0bg-prbtj0NZoMKAARDttw@mail.gmail.com>
 <CAJs=3_BX+AEdOxNYD=KGHWHn11G=a6+_40Rk6CJnFk1fJAnyMQ@mail.gmail.com>
 <CACGkMEu05SK+eVgXmfLPGb+fWJnpj-7zk13+P9x2rDW3sa8-Zg@mail.gmail.com>
 <CAJs=3_BfPANXQW0mfpQcA64dqVJ2SUy-J2Uw97PMYDH_3PK2Gg@mail.gmail.com>
 <CACGkMEsagbT8GakEFf1sMM0sr0CmwpV1Zrx9bFviqwk8cXVEkA@mail.gmail.com>
 <CAJs=3_BjUgGeCNLvRX-vKU7wHx=iqA_+XXPngaPHCvOQa8cRXg@mail.gmail.com> <CACGkMEs=TMG4mYY13tnTtWqFAFa6ho9PngffFXFwhO0L4b+TPw@mail.gmail.com>
In-Reply-To: <CACGkMEs=TMG4mYY13tnTtWqFAFa6ho9PngffFXFwhO0L4b+TPw@mail.gmail.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Wed, 1 Jun 2022 08:57:40 +0300
Message-ID: <CAJs=3_CUkbF-=Qczgjaauf-com4bk29E6i6Qeoy5CvEMXmmrWg@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v3] Introduction of Virtio Network device
 notifications coalescing feature.
Content-Type: multipart/alternative; boundary="00000000000041b55405e05c9337"
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--00000000000041b55405e05c9337
Content-Type: text/plain; charset="UTF-8"

I will post a new version including the discussed points.

On Wed, Jun 1, 2022 at 6:19 AM Jason Wang <jasowang@redhat.com> wrote:

> On Tue, May 31, 2022 at 3:02 PM Alvaro Karsz <alvaro.karsz@solid-run.com>
> wrote:
> >
> > > So according to the name of the feature, it tries to coalesce
> > > notification. But from what you said here, it counts by frames. This
> > > seems to be a conflict:
> > >
> > >
> > > We never had per frame notification in the past but per packet used
> > > buffer notification.
> > >
> > >
> > > What's more, looking at the spec of real hardware NIC like e810 or the
> > > ancient e1000, I don't see any per frame interrupt. They only have per
> > > TX/RX descriptor writeback interrupt which signals the completion of
> > > TX/RX pacekt.
> >
> >
> > You're right, coalescing packets was my initial intention, but I
> > understood from the comments on V2 that is should count ethernet
> > frames from Stefan's comment:
> >
> > >  I think the virtio-net-level coalescing makes sense
> > > since it counts Ethernet frames rather than virtqueue buffers.
> >
> >
> > Anyway, I think that counting packets makes more sense, and I will
> > change it accordingly if you all are Ok with that.
>
> I think it's better to coalesce packets (used buffers).
>
> >
> > >
> > > An example, if we tx-frames to 16, but we transmit 64K GSO on 1500
> > > MSS. The packets were segmented to ~43 frames. If we send a
> > > notification every 16 frames, the first 2 notifications are
> > > meaningless, there's nothing that a guest driver can do. So did the
> > > receiving. I don't get why not simply coalescing the used buffer
> > > notification.
> >
> >
> > You're right, that was my point in V2:
> > >
> > > x-max-frames = 5
> > > The driver wants to send a 64k packet, and VIRTIO_NET_F_HOST_TSO4 is
> negotiated.
> > > The driver will write a 64K description on the descriptor area.
> > > The device will segment the payload and will send more than 40 frames
> > > (with standard MTU) in a very short time (so the timer is not a
> > > factor).
> > > The device will send more than 8 notifications to the driver for just
> > > 1 used descriptor.
> >
> >
> >
> > > So I feel counting by used buffer is simpler and more useful than
> > > counting by frames. In order to make them work in parallel, we can
> > > simply say: when the coalescing condition is not met, the event
> > > notification will be delayed until we meet the coalescing condition
> > > otherwise the notification is armed and raised.
> >
> >
> > We have 2 approaches in implementing the device's side:
> >
> > Approach 1:
> > The device should always count packets, even if notifications are not
> enabled:
> > Something like:
> > - Device uses a buffer.
> > - Device increases the packet counter.
> > - Device checks if coalescing conditions are met.
> > If coalescing conditions indeed met:
> > - Device resets the coalescing counters.
> > - Device sends a notification, only if notifications are enabled.
> >
> > Code example:
> >
> > mark_desc_as_used()
> > update_coal_counters()
> > if (coal_cond_met) {
> >     reset_coal_counters()
> >     if (events_enabled)
>
> I guess "events_enabled" means driver allow us to send a notification
> either:
>
> 1) NO_NOTIFY is clear
> or
> 2) used idx matches used_event at least once since last notification?
>
> >         send_notification()
>
> I think we should reset the counters only after we send a notification?
>
> > }
>
> Need to specify what happens if the condition is not met, I think the
> behaviour is to delay the notification until the condition is met.
>
> >
> > Approach 2:
> > The device counts packets only if notifications are enabled.
> > Something like:
> > - Device uses a buffer.
> > - Device checks if notifications are enabled, if not, it just resets
> > coalescing counters.
> > If notifications are enabled:
> > - Device increases the packet counter.
> > - Device checks if coalescing conditions are met.
> > - Device reset the coalescing counters.
> > - Device sends a notification.
> >
> > Code example:
> >
> > mark_desc_as_used()
> > if (events_enabled) {
> >     update_coal_counters()
> >     if (coal_cond_met) {
> >         reset_coal_counters()
> >         send_notification()
> >     }
> > } else {
> >     reset_coal_counters()
> > }
> >
> > Approach 1 is simpler, specially for a Real HW device, which needs to
> > make a PCI transaction and wait for completion to check if
> > notifications are enabled.
>
> Yes.
>
> > But, we may have a minor issue with EVENT_IDX using the first approach:
> > Assume:
> > ring current location #0
> > EVENT_IDX #9
> > max-frames 10
> >
> > Using approach 1: A notification will be sent to the driver on buffer
> > #10, not #19.
> > Using approach 2: A notification will be sent to the driver on buffer
> #19.
>
> I don't see how this could be useful (since it may introduce much more
> delay in this case).
>
> >
> > I think that we should use approach 1, and it's not a big deal to send
> > on #10 in this example.
> >
> > What do you think?
>
> I think approach 2 may lead to confusion to the user and approach 1
> looks more clear:
>
> 1) coalescing working at packet level
> 2) event idx work at virtio ring level
>
> >
> >
> > Another point with EVENT_IDX is that the device should "remember" if
> > it already sent a notification for a given event_idx.
> > If the driver sets event_idx to #20, and never changes it, the device
> > should send a notification after #20, then should not send any
> > notification until the 16bit counter overflows, and it passes #20
> > again.
> >
> > Do you agree?
>
> Yes, this is how it works without coalescing.
>
> Thanks
>
>
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License:
> https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
>
>

-- 


*Alvaro Karsz, *Software
+972-50-7696862| https://www.solid-run.com

--00000000000041b55405e05c9337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I will post a new version including the discussed points.<=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Jun 1, 2022 at 6:19 AM Jason Wang &lt;<a href=3D"mailto:jasowang@red=
hat.com">jasowang@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue, May 31, 2022 at 3:02 PM Alvaro Karsz &l=
t;<a href=3D"mailto:alvaro.karsz@solid-run.com" target=3D"_blank">alvaro.ka=
rsz@solid-run.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; So according to the name of the feature, it tries to coalesce<br>
&gt; &gt; notification. But from what you said here, it counts by frames. T=
his<br>
&gt; &gt; seems to be a conflict:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; We never had per frame notification in the past but per packet us=
ed<br>
&gt; &gt; buffer notification.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; What&#39;s more, looking at the spec of real hardware NIC like e8=
10 or the<br>
&gt; &gt; ancient e1000, I don&#39;t see any per frame interrupt. They only=
 have per<br>
&gt; &gt; TX/RX descriptor writeback interrupt which signals the completion=
 of<br>
&gt; &gt; TX/RX pacekt.<br>
&gt;<br>
&gt;<br>
&gt; You&#39;re right, coalescing packets was my initial intention, but I<b=
r>
&gt; understood from the comments on V2 that is should count ethernet<br>
&gt; frames from Stefan&#39;s comment:<br>
&gt;<br>
&gt; &gt;=C2=A0 I think the virtio-net-level coalescing makes sense<br>
&gt; &gt; since it counts Ethernet frames rather than virtqueue buffers.<br=
>
&gt;<br>
&gt;<br>
&gt; Anyway, I think that counting packets makes more sense, and I will<br>
&gt; change it accordingly if you all are Ok with that.<br>
<br>
I think it&#39;s better to coalesce packets (used buffers).<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; An example, if we tx-frames to 16, but we transmit 64K GSO on 150=
0<br>
&gt; &gt; MSS. The packets were segmented to ~43 frames. If we send a<br>
&gt; &gt; notification every 16 frames, the first 2 notifications are<br>
&gt; &gt; meaningless, there&#39;s nothing that a guest driver can do. So d=
id the<br>
&gt; &gt; receiving. I don&#39;t get why not simply coalescing the used buf=
fer<br>
&gt; &gt; notification.<br>
&gt;<br>
&gt;<br>
&gt; You&#39;re right, that was my point in V2:<br>
&gt; &gt;<br>
&gt; &gt; x-max-frames =3D 5<br>
&gt; &gt; The driver wants to send a 64k packet, and VIRTIO_NET_F_HOST_TSO4=
 is negotiated.<br>
&gt; &gt; The driver will write a 64K description on the descriptor area.<b=
r>
&gt; &gt; The device will segment the payload and will send more than 40 fr=
ames<br>
&gt; &gt; (with standard MTU) in a very short time (so the timer is not a<b=
r>
&gt; &gt; factor).<br>
&gt; &gt; The device will send more than 8 notifications to the driver for =
just<br>
&gt; &gt; 1 used descriptor.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; So I feel counting by used buffer is simpler and more useful than=
<br>
&gt; &gt; counting by frames. In order to make them work in parallel, we ca=
n<br>
&gt; &gt; simply say: when the coalescing condition is not met, the event<b=
r>
&gt; &gt; notification will be delayed until we meet the coalescing conditi=
on<br>
&gt; &gt; otherwise the notification is armed and raised.<br>
&gt;<br>
&gt;<br>
&gt; We have 2 approaches in implementing the device&#39;s side:<br>
&gt;<br>
&gt; Approach 1:<br>
&gt; The device should always count packets, even if notifications are not =
enabled:<br>
&gt; Something like:<br>
&gt; - Device uses a buffer.<br>
&gt; - Device increases the packet counter.<br>
&gt; - Device checks if coalescing conditions are met.<br>
&gt; If coalescing conditions indeed met:<br>
&gt; - Device resets the coalescing counters.<br>
&gt; - Device sends a notification, only if notifications are enabled.<br>
&gt;<br>
&gt; Code example:<br>
&gt;<br>
&gt; mark_desc_as_used()<br>
&gt; update_coal_counters()<br>
&gt; if (coal_cond_met) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0reset_coal_counters()<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (events_enabled)<br>
<br>
I guess &quot;events_enabled&quot; means driver allow us to send a notifica=
tion either:<br>
<br>
1) NO_NOTIFY is clear<br>
or<br>
2) used idx matches used_event at least once since last notification?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send_notification()<br>
<br>
I think we should reset the counters only after we send a notification?<br>
<br>
&gt; }<br>
<br>
Need to specify what happens if the condition is not met, I think the<br>
behaviour is to delay the notification until the condition is met.<br>
<br>
&gt;<br>
&gt; Approach 2:<br>
&gt; The device counts packets only if notifications are enabled.<br>
&gt; Something like:<br>
&gt; - Device uses a buffer.<br>
&gt; - Device checks if notifications are enabled, if not, it just resets<b=
r>
&gt; coalescing counters.<br>
&gt; If notifications are enabled:<br>
&gt; - Device increases the packet counter.<br>
&gt; - Device checks if coalescing conditions are met.<br>
&gt; - Device reset the coalescing counters.<br>
&gt; - Device sends a notification.<br>
&gt;<br>
&gt; Code example:<br>
&gt;<br>
&gt; mark_desc_as_used()<br>
&gt; if (events_enabled) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0update_coal_counters()<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (coal_cond_met) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reset_coal_counters()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send_notification()<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0reset_coal_counters()<br>
&gt; }<br>
&gt;<br>
&gt; Approach 1 is simpler, specially for a Real HW device, which needs to<=
br>
&gt; make a PCI transaction and wait for completion to check if<br>
&gt; notifications are enabled.<br>
<br>
Yes.<br>
<br>
&gt; But, we may have a minor issue with EVENT_IDX using the first approach=
:<br>
&gt; Assume:<br>
&gt; ring current location #0<br>
&gt; EVENT_IDX #9<br>
&gt; max-frames 10<br>
&gt;<br>
&gt; Using approach 1: A notification will be sent to the driver on buffer<=
br>
&gt; #10, not #19.<br>
&gt; Using approach 2: A notification will be sent to the driver on buffer =
#19.<br>
<br>
I don&#39;t see how this could be useful (since it may introduce much more<=
br>
delay in this case).<br>
<br>
&gt;<br>
&gt; I think that we should use approach 1, and it&#39;s not a big deal to =
send<br>
&gt; on #10 in this example.<br>
&gt;<br>
&gt; What do you think?<br>
<br>
I think approach 2 may lead to confusion to the user and approach 1<br>
looks more clear:<br>
<br>
1) coalescing working at packet level<br>
2) event idx work at virtio ring level<br>
<br>
&gt;<br>
&gt;<br>
&gt; Another point with EVENT_IDX is that the device should &quot;remember&=
quot; if<br>
&gt; it already sent a notification for a given event_idx.<br>
&gt; If the driver sets event_idx to #20, and never changes it, the device<=
br>
&gt; should send a notification after #20, then should not send any<br>
&gt; notification until the 16bit counter overflows, and it passes #20<br>
&gt; again.<br>
&gt;<br>
&gt; Do you agree?<br>
<br>
Yes, this is how it works without coalescing.<br>
<br>
Thanks<br>
<br>
<br>
&gt;<br>
&gt; This publicly archived list offers a means to provide input to the<br>
&gt; OASIS Virtual I/O Device (VIRTIO) TC.<br>
&gt;<br>
&gt; In order to verify user consent to the Feedback License terms and<br>
&gt; to minimize spam in the list archive, subscription is required<br>
&gt; before posting.<br>
&gt;<br>
&gt; Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open=
.org" target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><b=
r>
&gt; Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-=
open.org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org=
</a><br>
&gt; List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
&gt; List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-=
comment/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org=
/archives/virtio-comment/</a><br>
&gt; Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedba=
ck_license.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open=
.org/who/ipr/feedback_license.pdf</a><br>
&gt; List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidel=
ines/mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-=
open.org/policies-guidelines/mailing-lists</a><br>
&gt; Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" r=
el=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/v=
irtio/</a><br>
&gt; Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"norefe=
rrer" target=3D"_blank">https://www.oasis-open.org/join/</a><br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr" style=3D"color=
:rgb(136,136,136)"><img src=3D"https://docs.google.com/uc?export=3Ddownload=
&amp;id=3D1KEpexWwt8xEzKfIcWs45f53v833z_qSu&amp;revid=3D0B683Hs8Rop-iakk2MU=
NPaCtsWlBQbEw4VVZDQzJ4OTFubEhFPQ"><br></div><div dir=3D"ltr" style=3D"color=
:rgb(136,136,136)"><br style=3D"color:rgb(117,117,117);font-family:Roboto,R=
obotoDraft,Helvetica,Arial,sans-serif;white-space:nowrap"><span style=3D"fo=
nt-size:12px"><b style=3D"color:rgb(221,75,57)">Alvaro Karsz,=C2=A0</b><fon=
t color=3D"#999999">Software</font></span><br><span style=3D"font-size:12px=
"><font color=3D"#808080">+972-50-7696862</font><span style=3D"color:rgb(22=
1,75,57)">|=C2=A0</span><a href=3D"https://www.solid-run.com/" rel=3D"nofol=
low" style=3D"color:rgb(128,128,128)" target=3D"_blank">https://www.solid-r=
un.com</a></span></div></div></div>

--00000000000041b55405e05c9337--

