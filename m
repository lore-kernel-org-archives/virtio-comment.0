Return-Path: virtio-comment-return-1209-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65EB6985D51
	for <virtio-comment@lists.oasis-open.org>; Tue,  5 May 2020 23:27:02 +0000 (UTC)
MIME-Version: 1.0
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
 <20200422005531.15085-2-gurchetansingh@chromium.org> <20200428102922.ptoppskbs7xhube7@sirius.home.kraxel.org>
 <CAAfnVBneVgQQkGu6H_B6NGkUrEC7QD0o91vzUDTQ1=kyS_tKbw@mail.gmail.com> <20200429092830.3p6qc4nsscbz44xu@sirius.home.kraxel.org>
In-Reply-To: <20200429092830.3p6qc4nsscbz44xu@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 5 May 2020 16:26:47 -0700
Message-ID: <CAAfnVBn4WsyLvhMS8mGOJE0gOgYwPCW_r3JBHrtQOQTggrsuiQ@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: multipart/alternative; boundary="000000000000de007705a4eefb39"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000de007705a4eefb39
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 2:28 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > > Do we need separate items (HOSTSYS/HOST3D) for these?  Shouldn't this
> be
> > > a host implementation detail the guest doesn't need to worry about?
> >
> > Yes, separate items are not needed and could indeed be an host
> > implementation detail.  Right now, the drm uapi has
> VIRTGPU_BLOB_MEM_HOST /
> > VIRTIO_GPU_BLOB_MEM_HOST_GUEST and the kernel separates to HOST{SYS,3D}
> and
> > does various checks.
> >
> >
> https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commit/0ccb47d5150a2=
978d179d0c44ef3285541c8964c
> >
> >
> > The reasoning is since there's no RESOURCE_CREATE_BLOB2D
> > or RESOURCE_CREATE_BLOB3D, the separation captures that difference in a=
n
> > explicit API level.  That way, the blob id is only allowed with HOST3D.
>
> I think we can also simply define "blob id is only allowed virgl=3Don", n=
o
> need for a separate command.
>

Ack.  Chia's suggestion to possibly only allow GUEST for dumb blobs is also
reasonable (i.e, no host allocations -- RESOURCE_{MAP, UNMAP}_BLOB are 3D
only).  What do you prefer?


> > A HOST3D blob has no guest memory associated with it, and can only be
> > mapped through the shm region.  Even then, a linear (mappable) view of =
a
> > host3d blob may not be possible/desirable -- like shareable device loca=
l
> > memory, or maybe even a protected content blob.
> >
> > HOST3D_GUEST is always mappable, while HOST3D isn't.
>
> Ok.  So _GUEST postfix means there is a guest shadow and we TRANSFER
> data instead of mapping the host resource directly.  Ok, makes sense,
> needs a better description in the spec though.
>

Will do.


> > > > +If VIRTIO_GPU_F_VIRGL is set, both
> VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D
> > > > +and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
> > > > +resource. There is no restriction on the image/buffer view the
> driver
> > > > +has on the blob resource.
> > >
> > > I don't think VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is going to work if
> > > the resource has no format attached.  I had a TRANSFER_BLOB command
> > > because of that.
> > >
> >
> > I was thinking about GL/VK interop here.
> >
> > Say VK allocates the blob resource, but a GL texture is subsequently
> > created from the blob resource using GL/VK interop extensions and a
> format
> > is attached.  For this reason, VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is
> > allowed on blob resources.
>
> Makes sense to allow the old transfer commands for the cases where the
> resource has a format attached.
>
> > Similarly, virtgpu_kms always attaches XR24 and AB24 to resources[1], s=
o
> > VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D can be reused if size =3D 4 * width =
for
> > dumb/sys blob resources (which I think will always be the case?).
>
> If the kernel uses BLOB resources for dumb BOs (so we can have a shared
> mapping for them and avoid copying fbdev data) they will not have a
> format attached.
>
> Imported dma-bufs (inside the guest) don't have a format attached
> either.  With BLOB resources we can support this, but we'll likewise get
> a resource without format attached.
>
> So we need ways to work with those resources ...
>

Will add TRANSFER_BLOB in v2.


> > Ack.  I definitely see the logic behind VIRTIO_GPU_CMD_SET_SCANOUT_BLOB=
,
> > but current display integration (dpy_gl_scanout_texture(..) in QEMU)
> > assumes the presence of a GL texture (which can be created from a blob
> > resource).
>
> I have a qemu VIRTIO_GPU_CMD_SET_SCANOUT_BLOB implementation for
> virgl=3Doff only, covering dumb bo / fbdev as outlined above.
>

Will add VIRTIO_GPU_CMD_SET_SCANOUT_BLOB in v2.  Do you also want
SCANOUT_FLUSH too?


> With virgl=3Don this should be doable too, you only have to create the
> texture from the blob resource at SET_SCANOUT_BLOB time (when you know
> the format the guest wants scanout), not at resource creation time.
>
> take care,
>   Gerd
>
>

--000000000000de007705a4eefb39
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29, 2020 at 2:28 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0 Hi,<br>
<br>
&gt; &gt; Do we need separate items (HOSTSYS/HOST3D) for these?=C2=A0 Shoul=
dn&#39;t this be<br>
&gt; &gt; a host implementation detail the guest doesn&#39;t need to worry =
about?<br>
&gt; <br>
&gt; Yes, separate items are not needed and could indeed be an host<br>
&gt; implementation detail.=C2=A0 Right now, the drm uapi has VIRTGPU_BLOB_=
MEM_HOST /<br>
&gt; VIRTIO_GPU_BLOB_MEM_HOST_GUEST and the kernel separates to HOST{SYS,3D=
} and<br>
&gt; does various checks.<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commit=
/0ccb47d5150a2978d179d0c44ef3285541c8964c" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commit/0ccb47d515=
0a2978d179d0c44ef3285541c8964c</a><br>
&gt; <br>
&gt; <br>
&gt; The reasoning is since there&#39;s no RESOURCE_CREATE_BLOB2D<br>
&gt; or RESOURCE_CREATE_BLOB3D, the separation captures that difference in =
an<br>
&gt; explicit API level.=C2=A0 That way, the blob id is only allowed with H=
OST3D.<br>
<br>
I think we can also simply define &quot;blob id is only allowed virgl=3Don&=
quot;, no<br>
need for a separate command.<br></blockquote><div><br></div><div>Ack.=C2=A0=
 Chia&#39;s suggestion to possibly only allow GUEST for dumb blobs is also =
reasonable (i.e, no host allocations -- RESOURCE_{MAP, UNMAP}_BLOB are 3D o=
nly).=C2=A0 What do you prefer?</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
&gt; A HOST3D blob has no guest memory associated with it, and can only be<=
br>
&gt; mapped through the shm region.=C2=A0 Even then, a linear (mappable) vi=
ew of a<br>
&gt; host3d blob may not be possible/desirable -- like shareable device loc=
al<br>
&gt; memory, or maybe even a protected content blob.<br>
&gt; <br>
&gt; HOST3D_GUEST is always mappable, while HOST3D isn&#39;t.<br>
<br>
Ok.=C2=A0 So _GUEST postfix means there is a guest shadow and we TRANSFER<b=
r>
data instead of mapping the host resource directly.=C2=A0 Ok, makes sense,<=
br>
needs a better description in the spec though.<br></blockquote><div><br></d=
iv><div>Will do.</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; &gt; &gt; +If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_=
TO_HOST_3D<br>
&gt; &gt; &gt; +and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to upd=
ate the<br>
&gt; &gt; &gt; +resource. There is no restriction on the image/buffer view =
the driver<br>
&gt; &gt; &gt; +has on the blob resource.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is going to =
work if<br>
&gt; &gt; the resource has no format attached.=C2=A0 I had a TRANSFER_BLOB =
command<br>
&gt; &gt; because of that.<br>
&gt; &gt;<br>
&gt; <br>
&gt; I was thinking about GL/VK interop here.<br>
&gt; <br>
&gt; Say VK allocates the blob resource, but a GL texture is subsequently<b=
r>
&gt; created from the blob resource using GL/VK interop extensions and a fo=
rmat<br>
&gt; is attached.=C2=A0 For this reason, VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D=
 is<br>
&gt; allowed on blob resources.<br>
<br>
Makes sense to allow the old transfer commands for the cases where the<br>
resource has a format attached.<br>
<br>
&gt; Similarly, virtgpu_kms always attaches XR24 and AB24 to resources[1], =
so<br>
&gt; VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D can be reused if size =3D 4 * width=
 for<br>
&gt; dumb/sys blob resources (which I think will always be the case?).<br>
<br>
If the kernel uses BLOB resources for dumb BOs (so we can have a shared<br>
mapping for them and avoid copying fbdev data) they will not have a<br>
format attached.<br>
<br>
Imported dma-bufs (inside the guest) don&#39;t have a format attached<br>
either.=C2=A0 With BLOB resources we can support this, but we&#39;ll likewi=
se get<br>
a resource without format attached.<br>
<br>
So we need ways to work with those resources ...<br></blockquote><div><br><=
/div><div>Will add TRANSFER_BLOB in v2.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; Ack.=C2=A0 I definitely see the logic behind VIRTIO_GPU_CMD_SET_SCANOU=
T_BLOB,<br>
&gt; but current display integration (dpy_gl_scanout_texture(..) in QEMU)<b=
r>
&gt; assumes the presence of a GL texture (which can be created from a blob=
<br>
&gt; resource).<br>
<br>
I have a qemu VIRTIO_GPU_CMD_SET_SCANOUT_BLOB implementation for<br>
virgl=3Doff only, covering dumb bo / fbdev as outlined above.<br></blockquo=
te><div>=C2=A0</div><div>Will add=C2=A0VIRTIO_GPU_CMD_SET_SCANOUT_BLOB in v=
2.=C2=A0 Do you also want SCANOUT_FLUSH too?</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
With virgl=3Don this should be doable too, you only have to create the<br>
texture from the blob resource at SET_SCANOUT_BLOB time (when you know<br>
the format the guest wants scanout), not at resource creation time.<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--000000000000de007705a4eefb39--

