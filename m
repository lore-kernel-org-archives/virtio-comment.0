Return-Path: virtio-comment-return-1219-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3442F985E96
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 May 2020 23:36:11 +0000 (UTC)
MIME-Version: 1.0
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
 <20200422005531.15085-2-gurchetansingh@chromium.org> <20200428102922.ptoppskbs7xhube7@sirius.home.kraxel.org>
 <CAAfnVBneVgQQkGu6H_B6NGkUrEC7QD0o91vzUDTQ1=kyS_tKbw@mail.gmail.com>
 <20200429092830.3p6qc4nsscbz44xu@sirius.home.kraxel.org> <CAAfnVBn4WsyLvhMS8mGOJE0gOgYwPCW_r3JBHrtQOQTggrsuiQ@mail.gmail.com>
 <20200506071442.4s24rvkjt2j56wfz@sirius.home.kraxel.org>
In-Reply-To: <20200506071442.4s24rvkjt2j56wfz@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 7 May 2020 16:35:54 -0700
Message-ID: <CAAfnVBnYLpHBUiPQpkQdPC3riSric9Ey7fG0nMkE=QckuHd_Gw@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: multipart/alternative; boundary="00000000000039fa1f05a5175836"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--00000000000039fa1f05a5175836
Content-Type: text/plain; charset="UTF-8"

On Wed, May 6, 2020 at 12:14 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > > The reasoning is since there's no RESOURCE_CREATE_BLOB2D
> > > > or RESOURCE_CREATE_BLOB3D, the separation captures that difference
> in an
> > > > explicit API level.  That way, the blob id is only allowed with
> HOST3D.
> > >
> > > I think we can also simply define "blob id is only allowed virgl=on",
> no
> > > need for a separate command.
> > >
> >
> > Ack.  Chia's suggestion to possibly only allow GUEST for dumb blobs is
> also
> > reasonable (i.e, no host allocations -- RESOURCE_{MAP, UNMAP}_BLOB are 3D
> > only).
>
> Yes, that works too.
>
> > What do you prefer?
>
> I don't mind much.
>
> > > > Ack.  I definitely see the logic behind
> VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
> > > > but current display integration (dpy_gl_scanout_texture(..) in QEMU)
> > > > assumes the presence of a GL texture (which can be created from a
> blob
> > > > resource).
> > >
> > > I have a qemu VIRTIO_GPU_CMD_SET_SCANOUT_BLOB implementation for
> > > virgl=off only, covering dumb bo / fbdev as outlined above.
> >
> > Will add VIRTIO_GPU_CMD_SET_SCANOUT_BLOB in v2.  Do you also want
> > SCANOUT_FLUSH too?
>
> I think we need that, RESOURCE_FLUSH isn't going to work for resources
> without an format attached.
>

Okay, added.  SCANOUT_BLOB is based on QemuDmaBuf, but left out the
modifier since that can be queried from virglrenderer.  LMK if anything
else is needed...


> take care,
>   Gerd
>
>

--00000000000039fa1f05a5175836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 6, 2020 at 12:14 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0 Hi,<br>
<br>
&gt; &gt; &gt; The reasoning is since there&#39;s no RESOURCE_CREATE_BLOB2D=
<br>
&gt; &gt; &gt; or RESOURCE_CREATE_BLOB3D, the separation captures that diff=
erence in an<br>
&gt; &gt; &gt; explicit API level.=C2=A0 That way, the blob id is only allo=
wed with HOST3D.<br>
&gt; &gt;<br>
&gt; &gt; I think we can also simply define &quot;blob id is only allowed v=
irgl=3Don&quot;, no<br>
&gt; &gt; need for a separate command.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Ack.=C2=A0 Chia&#39;s suggestion to possibly only allow GUEST for dumb=
 blobs is also<br>
&gt; reasonable (i.e, no host allocations -- RESOURCE_{MAP, UNMAP}_BLOB are=
 3D<br>
&gt; only).<br>
<br>
Yes, that works too.<br>
<br>
&gt; What do you prefer?<br>
<br>
I don&#39;t mind much.<br>
<br>
&gt; &gt; &gt; Ack.=C2=A0 I definitely see the logic behind VIRTIO_GPU_CMD_=
SET_SCANOUT_BLOB,<br>
&gt; &gt; &gt; but current display integration (dpy_gl_scanout_texture(..) =
in QEMU)<br>
&gt; &gt; &gt; assumes the presence of a GL texture (which can be created f=
rom a blob<br>
&gt; &gt; &gt; resource).<br>
&gt; &gt;<br>
&gt; &gt; I have a qemu VIRTIO_GPU_CMD_SET_SCANOUT_BLOB implementation for<=
br>
&gt; &gt; virgl=3Doff only, covering dumb bo / fbdev as outlined above.<br>
&gt; <br>
&gt; Will add VIRTIO_GPU_CMD_SET_SCANOUT_BLOB in v2.=C2=A0 Do you also want=
<br>
&gt; SCANOUT_FLUSH too?<br>
<br>
I think we need that, RESOURCE_FLUSH isn&#39;t going to work for resources<=
br>
without an format attached.<br></blockquote><div><br></div><div>Okay, added=
.=C2=A0 SCANOUT_BLOB is based on QemuDmaBuf, but left out the modifier sinc=
e that can be queried from virglrenderer.=C2=A0 LMK if anything else is nee=
ded...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--00000000000039fa1f05a5175836--

