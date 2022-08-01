Return-Path: <bobby.eshleman@bytedance.com>
From: Bobby Eshleman <bobby.eshleman@bytedance.com>
Mime-Version: 1.0
In-Reply-To: <20220719080415.36faik2cic7tzvhm@sgarzare-redhat>
References: <20220718142653.42310-1-sgarzare@redhat.com> <CALa-AnDWjE67j0RMg3kaErLLEL+qgos4XxJDYHY_uB3T7+heCg@mail.gmail.com>
 <20220719080415.36faik2cic7tzvhm@sgarzare-redhat>
Date: Mon, 1 Aug 2022 14:53:28 -0700
Message-ID: <CALa-AnDYZ1eL4L8PL2MiA6nuOs2iZ7u7=AQ8s9RpdHz95cFKVg@mail.gmail.com>
Subject: Re: [External] [PATCH v2] virtio-vsock: add VIRTIO_VSOCK_F_NO_IMPLIED_STREAM
 feature bit
Content-Type: multipart/alternative; boundary="000000000000bc412505e53507ef"
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jiang.wang@bytedance.com, Stefan Hajnoczi <stefanha@redhat.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000bc412505e53507ef
Content-Type: text/plain; charset="UTF-8"

I see, thank you for the clarification. Sorry for the late response, I just
noticed this ACK was left in my draft box.

Thanks again,
Bobby

From: "Stefano Garzarella"<sgarzare@redhat.com>
Date: Tue, Jul 19, 2022, 1:04 AM
Subject: Re: [External] [PATCH v2] virtio-vsock: add
VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit
To: "Bobby Eshleman"<bobby.eshleman@bytedance.com>
Cc: <virtio-comment@lists.oasis-open.org>, <jiang.wang@bytedance.com>, "Stefan
Hajnoczi"<stefanha@redhat.com>, "Arseniy Krasnov"<AVKrasnov@sberdevices.ru>,
"Michael S . Tsirkin"<mst@redhat.com>, "Cornelia Huck"<cohuck@redhat.com>
Hi Bobby, On Mon, Jul 18, 2022 at 11:17:26AM -0700, Bobby Eshleman wrote:
>Hey Stefano, > >Please excuse the late reply to this thread. No problems
at all! > >I am trying to think through the imagined usage of this bit.
Following the >referenced threads, >I am not sure I can clearly see under
what version combinations of >driver/device that the bit will be used. >
The main reason is to continue to support the current implementation. If we
had F_STREAM from the beginning when we introduced virtio-vsock, then there
would have been no need for F_NO_IMPLIED_STREAM, but unfortunately, that
was not the case. If we look at the current implementation in Linux
(virtio-vsock and vhost-vsock), F_STREAM is not negotiated. We added it in
the specification, but not yet implemented. That's because the driver and
device were designed to support only stream sockets, so it was implied as a
feature. Then we added seqpacket, which is somehow an extension of stream
sockets, so we only negotiated F_SEQPACKET (unfortunately we merged the
patch too early before we better defined F_STREAM). Leaving support for
stream sockets implied. At this point we realized that if we would add
another type, completely unrelated to stream (e.g. datagram), it would be
complicated to negotiate only datagram support without stream. >Given that
feature bits being zero imply stream support, and
>VIRTIO_VSOCK_F_{STREAM,SEQPACKET,DGRAM} >all existing (dgram in the
future), how does NO_IMPLIED_STREAM=1 differ >from STREAM=0, SEQPACKET=0,
>and DGRAM=1 (for example)? Unfortunately, even when the feature bits are
non-zero (F_SEQPACKET negotiated), we still support stream sockets
implicitly. So adding F_NO_IMPLIED_STREAM, just to make sure that if
F_STREAM is not negotiated, then really the device/driver doesn't support
it. As we wrote in the specification, all drivers and devices in the future
should negotiate F_NO_IMPLIED_STREAM to avoid ambiguity. It's basically a
way to be compatible with the current implementation and have backward
compatibility in the future. Thanks, Stefano

--000000000000bc412505e53507ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div id=3D"editor_version_1.8.2_8oORIJgH"><div sty=
le=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;margin-bottom:4px=
;line-height:1.6">I see, thank you for the clarification. Sorry for the lat=
e response, I just noticed this ACK was left in my draft box.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">Thanks =
again,
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">Bobby
</div></div><div style=3D"list-style-position:inside" id=3D"lark-mail-quote=
-165939079"><div class=3D"adit-html-block adit-html-block--collapsed"><div =
class=3D"quote-divider-tag-class" id=3D"quote-divider-line" style=3D"width:=
100%;height:1px;margin-top:16px;margin-bottom:16px;border-top:1px solid rgb=
(222,224,227);font-size:0px"><br></div><div><div class=3D"adit-html-block__=
attr quote-head-meta-line" style=3D"color:rgb(143,149,158)"><div id=3D"lark=
-mail-quote-55ad95892a0617742cdc75ca7e27546f"><div style=3D"padding-bottom:=
8px;word-break:break-word;color:#8f959e!important"><div style=3D"color:#8f9=
59e!important"><span style=3D"color:#646a73">From: </span><span style=3D"wh=
ite-space:nowrap">&quot;Stefano Garzarella&quot;&lt;<a rel=3D"nofollow noop=
ener noreferrer" href=3D"mailto:sgarzare@redhat.com" style=3D"white-space:p=
re-wrap;word-break:break-word;text-decoration:none;color:unset" class=3D"qu=
ote-head-meta-mailto">sgarzare@redhat.com</a>&gt;</span></div><div style=3D=
"color:#8f959e!important"><span style=3D"color:#646a73">Date: </span> Tue, =
Jul 19, 2022, 1:04 AM</div><div style=3D"color:#8f959e!important"><span sty=
le=3D"color:#646a73">Subject: </span> Re: [External] [PATCH v2] virtio-vsoc=
k: add VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature bit</div><div style=3D"colo=
r:#8f959e!important"><span style=3D"color:#646a73">To: </span><span style=
=3D"white-space:nowrap">&quot;Bobby Eshleman&quot;&lt;<a rel=3D"nofollow no=
opener noreferrer" href=3D"mailto:bobby.eshleman@bytedance.com" style=3D"wh=
ite-space:pre-wrap;word-break:break-word;text-decoration:none;color:unset" =
class=3D"quote-head-meta-mailto">bobby.eshleman@bytedance.com</a>&gt;</span=
></div><div style=3D"color:#8f959e!important" class=3D"quote-head-meta-last=
-line"><span style=3D"color:#646a73">Cc: </span><span style=3D"white-space:=
nowrap">&lt;<a rel=3D"nofollow noopener noreferrer" href=3D"mailto:virtio-c=
omment@lists.oasis-open.org" style=3D"white-space:pre-wrap;word-break:break=
-word;text-decoration:none;color:unset" class=3D"quote-head-meta-mailto">vi=
rtio-comment@lists.oasis-open.org</a>&gt;</span>, <span style=3D"white-spac=
e:nowrap">&lt;<a rel=3D"nofollow noopener noreferrer" href=3D"mailto:jiang.=
wang@bytedance.com" style=3D"white-space:pre-wrap;word-break:break-word;tex=
t-decoration:none;color:unset" class=3D"quote-head-meta-mailto">jiang.wang@=
bytedance.com</a>&gt;</span>, <span style=3D"white-space:nowrap">&quot;Stef=
an Hajnoczi&quot;&lt;<a rel=3D"nofollow noopener noreferrer" href=3D"mailto=
:stefanha@redhat.com" style=3D"white-space:pre-wrap;word-break:break-word;t=
ext-decoration:none;color:unset" class=3D"quote-head-meta-mailto">stefanha@=
redhat.com</a>&gt;</span>, <span style=3D"white-space:nowrap">&quot;Arseniy=
 Krasnov&quot;&lt;<a rel=3D"nofollow noopener noreferrer" href=3D"mailto:AV=
Krasnov@sberdevices.ru" style=3D"white-space:pre-wrap;word-break:break-word=
;text-decoration:none;color:unset" class=3D"quote-head-meta-mailto">AVKrasn=
ov@sberdevices.ru</a>&gt;</span>, <span style=3D"white-space:nowrap">&quot;=
Michael S . Tsirkin&quot;&lt;<a rel=3D"nofollow noopener noreferrer" href=
=3D"mailto:mst@redhat.com" style=3D"white-space:pre-wrap;word-break:break-w=
ord;text-decoration:none;color:unset" class=3D"quote-head-meta-mailto">mst@=
redhat.com</a>&gt;</span>, <span style=3D"white-space:nowrap">&quot;Corneli=
a Huck&quot;&lt;<a rel=3D"nofollow noopener noreferrer" href=3D"mailto:cohu=
ck@redhat.com" style=3D"white-space:pre-wrap;word-break:break-word;text-dec=
oration:none;color:unset" class=3D"quote-head-meta-mailto">cohuck@redhat.co=
m</a>&gt;</span></div></div></div></div><div><div style=3D"white-space:pre-=
wrap">Hi Bobby,

On Mon, Jul 18, 2022 at 11:17:26AM -0700, Bobby Eshleman wrote:
&gt;Hey Stefano,
&gt;
&gt;Please excuse the late reply to this thread.

No problems at all!

&gt;
&gt;I am trying to think through the imagined usage of this bit. Following =
the
&gt;referenced threads,
&gt;I am not sure I can clearly see under what version combinations of
&gt;driver/device that the bit will be used.
&gt;

The main reason is to continue to support the current implementation.

If we had F_STREAM from the beginning when we introduced virtio-vsock,=20
then there would have been no need for F_NO_IMPLIED_STREAM, but=20
unfortunately, that was not the case.

If we look at the current implementation in Linux (virtio-vsock and=20
vhost-vsock), F_STREAM is not negotiated. We added it in the=20
specification, but not yet implemented.

That&#39;s because the driver and device were designed to support only=20
stream sockets, so it was implied as a feature.
Then we added seqpacket, which is somehow an extension of stream=20
sockets, so we only negotiated F_SEQPACKET (unfortunately we merged the=20
patch too early before we better defined F_STREAM). Leaving support for=20
stream sockets implied.

At this point we realized that if we would add another type, completely=20
unrelated to stream (e.g. datagram), it would be complicated to=20
negotiate only datagram support without stream.

&gt;Given that feature bits being zero imply stream support, and
&gt;VIRTIO_VSOCK_F_{STREAM,SEQPACKET,DGRAM}
&gt;all existing (dgram in the future), how does NO_IMPLIED_STREAM=3D1 diff=
er
&gt;from STREAM=3D0, SEQPACKET=3D0,
&gt;and DGRAM=3D1 (for example)?

Unfortunately, even when the feature bits are non-zero (F_SEQPACKET=20
negotiated), we still support stream sockets implicitly.

So adding F_NO_IMPLIED_STREAM, just to make sure that if F_STREAM is not=20
negotiated, then really the device/driver doesn&#39;t support it.
As we wrote in the specification, all drivers and devices in the future=20
should negotiate F_NO_IMPLIED_STREAM to avoid ambiguity.

It&#39;s basically a way to be compatible with the current implementation=
=20
and have backward compatibility in the future.

Thanks,
Stefano</div></div></div></div></div></body></html>

--000000000000bc412505e53507ef--

