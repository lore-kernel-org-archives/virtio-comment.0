Return-Path: virtio-comment-return-1193-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F6D3985E75
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Apr 2020 00:44:19 +0000 (UTC)
MIME-Version: 1.0
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
 <20200422005531.15085-2-gurchetansingh@chromium.org> <20200428102922.ptoppskbs7xhube7@sirius.home.kraxel.org>
In-Reply-To: <20200428102922.ptoppskbs7xhube7@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 28 Apr 2020 17:44:01 -0700
Message-ID: <CAAfnVBneVgQQkGu6H_B6NGkUrEC7QD0o91vzUDTQ1=kyS_tKbw@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: multipart/alternative; boundary="0000000000005883bb05a4633fb5"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--0000000000005883bb05a4633fb5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 3:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Tue, Apr 21, 2020 at 05:55:30PM -0700, Gurchetan Singh wrote:
> > Blob resources are size-based containers for host, guest, or
> > host+guest allocations.  These resources are designed with
> > mulit-process 3D support in mind, but also usable in virtio-gpu 2d
> > with system memory allocation (also known as dumb allocation, but
> > since that's reserved in a DRM/KMS world, went with system).
>
> Thanks for picking this up.
>

No problem, thanks for getting the ball rolling!


> > +Host allocations depend on whether VIRTIO_GPU_F_VIRGL is supported.
> > +If VIRTIO_GPU_F_VIRGL is not supported, then:
> > +
> > +  \begin{itemize*}
> > +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOSTSYS for
> host-only
> > +  blob resources
> > +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOSTSYS_GUEST for
> > +  default blob resources
> > +  \end{itemize*}
> > +
> > +For the above above cases, host system memory is allocated by the
> device.
> > +
> > +If VIRTIO_GPU_F_VIRGL is supported, then:
> > +
> > +  \begin{itemize*}
> > +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOST3D for
> host-only
> > +  blob resources
> > +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST for
> > +  default resources
> > +  \end{itemize*}
>
> Do we need separate items (HOSTSYS/HOST3D) for these?  Shouldn't this be
> a host implementation detail the guest doesn't need to worry about?
>

Yes, separate items are not needed and could indeed be an host
implementation detail.  Right now, the drm uapi has VIRTGPU_BLOB_MEM_HOST /
VIRTIO_GPU_BLOB_MEM_HOST_GUEST and the kernel separates to HOST{SYS,3D} and
does various checks.

https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commit/0ccb47d5150a297=
8d179d0c44ef3285541c8964c


The reasoning is since there's no RESOURCE_CREATE_BLOB2D
or RESOURCE_CREATE_BLOB3D, the separation captures that difference in an
explicit API level.  That way, the blob id is only allowed with HOST3D.

But naming/enums is definitely mutable and open to suggestions if this
reasoning doesn't seem right.

Also: Why HOST3D + HOST3D_GUEST?  Isn't that covered by the use flags
> (MAPPABLE) already?
>

A HOST3D blob has no guest memory associated with it, and can only be
mapped through the shm region.  Even then, a linear (mappable) view of a
host3d blob may not be possible/desirable -- like shareable device local
memory, or maybe even a protected content blob.

HOST3D_GUEST is always mappable, while HOST3D isn't.


> > +If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D
> > +and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
> > +resource. There is no restriction on the image/buffer view the driver
> > +has on the blob resource.
>
> I don't think VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is going to work if
> the resource has no format attached.  I had a TRANSFER_BLOB command
> because of that.
>

I was thinking about GL/VK interop here.

Say VK allocates the blob resource, but a GL texture is subsequently
created from the blob resource using GL/VK interop extensions and a format
is attached.  For this reason, VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is
allowed on blob resources.

Similarly, virtgpu_kms always attaches XR24 and AB24 to resources[1], so
VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D can be reused if size =3D 4 * width for
dumb/sys blob resources (which I think will always be the case?).

TRANSFER_BLOB is definitely useful for things that can't fit neatly into
the previous hypercalls (YUV formats in virtgpu_kms?), and could be useful
for optimizing emulated coherent memory (if we ever add it).  The current
prototype doesn't really use TRANSFER_BLOB though, but if you have use
cases in mind, it is definitely easy to add.

[1]
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/virtio/virtgp=
u_plane.c#L33


> > +VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D, VIRTIO_GPU_CMD_SET_SCANOUT and
> > +VIRTIO_GPU_CMD_RESOURCE_FLUSH MAY be used with blob resources as well,
> > +subject to the following restrictions:
>
> Same problem with VIRTIO_GPU_CMD_SET_SCANOUT, it expects the resource
> has a format attached which isn't the case for blob resources ...


Ack.  I definitely see the logic behind VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
but current display integration (dpy_gl_scanout_texture(..) in QEMU)
assumes the presence of a GL texture (which can be created from a blob
resource).  So we'll need to change the display integration to be Wayland
based, and pass (offsets[4], strides[4], virtualized modifier?, a few other
things) via VIRTIO_GPU_CMD_SET_SCANOUT_BLOB.  But I think that'll only work
if only in a Zink + VK1.1-only world where GL never allocates.

That's a lot of changes, the current spec does what's needed for zero-copy
VK/GL, and attempts to be forward looking for future changes.  We may need
additional feature bits for more advanced display integration.


>
> cheers,
>   Gerd
>
>

--0000000000005883bb05a4633fb5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Apr 28, 2020 at 3:29 AM Gerd Hoff=
mann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@redh=
at.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Apr 21, 2020 at 05:55:30PM -0700, =
Gurchetan Singh wrote:<br>
&gt; Blob resources are size-based containers for host, guest, or<br>
&gt; host+guest allocations.=C2=A0 These resources are designed with<br>
&gt; mulit-process 3D support in mind, but also usable in virtio-gpu 2d<br>
&gt; with system memory allocation (also known as dumb allocation, but<br>
&gt; since that&#39;s reserved in a DRM/KMS world, went with system).<br>
<br>
Thanks for picking this up.<br></blockquote><div><br></div><div>No problem,=
 thanks for getting the ball rolling!</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt; +Host allocations depend on whether VIRTIO_GPU_F_VIRGL is supported.<b=
r>
&gt; +If VIRTIO_GPU_F_VIRGL is not supported, then:<br>
&gt; +<br>
&gt; +=C2=A0 \begin{itemize*}<br>
&gt; +=C2=A0 \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOSTSYS for=
 host-only<br>
&gt; +=C2=A0 blob resources<br>
&gt; +=C2=A0 \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOSTSYS_GUE=
ST for<br>
&gt; +=C2=A0 default blob resources<br>
&gt; +=C2=A0 \end{itemize*}<br>
&gt; +<br>
&gt; +For the above above cases, host system memory is allocated by the dev=
ice.<br>
&gt; +<br>
&gt; +If VIRTIO_GPU_F_VIRGL is supported, then:<br>
&gt; +<br>
&gt; +=C2=A0 \begin{itemize*}<br>
&gt; +=C2=A0 \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOST3D for =
host-only<br>
&gt; +=C2=A0 blob resources<br>
&gt; +=C2=A0 \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOST3D_GUES=
T for<br>
&gt; +=C2=A0 default resources<br>
&gt; +=C2=A0 \end{itemize*}<br>
<br>
Do we need separate items (HOSTSYS/HOST3D) for these?=C2=A0 Shouldn&#39;t t=
his be<br>
a host implementation detail the guest doesn&#39;t need to worry about?<br>=
</blockquote><div><br></div><div>Yes, separate items are not needed and cou=
ld indeed be an host implementation detail.=C2=A0 Right now, the drm uapi h=
as VIRTGPU_BLOB_MEM_HOST / VIRTIO_GPU_BLOB_MEM_HOST_GUEST and the kernel se=
parates to HOST{SYS,3D} and does various checks.</div><div><br></div><div><=
a href=3D"https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commit/0ccb4=
7d5150a2978d179d0c44ef3285541c8964c" target=3D"_blank">https://gitlab.freed=
esktop.org/virgl/drm-misc-next/-/commit/0ccb47d5150a2978d179d0c44ef3285541c=
8964c</a>=C2=A0</div><div><br></div><div>The reasoning is since there&#39;s=
 no RESOURCE_CREATE_BLOB2D or=C2=A0RESOURCE_CREATE_BLOB3D, the separation c=
aptures that difference in an explicit API level.=C2=A0 That way, the blob =
id is only allowed with HOST3D.</div><div><br></div><div>But naming/enums i=
s definitely mutable and open to suggestions if this reasoning doesn&#39;t =
seem right.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Also: Why HOST3D + HOST3D_GUEST?=C2=A0 Isn&#39;t that covered by the use fl=
ags<br>
(MAPPABLE) already?<br></blockquote><div><br></div><div>A HOST3D blob has n=
o guest memory associated with it, and can only be mapped through the shm r=
egion.=C2=A0 Even then, a linear (mappable) view of a host3d blob may not b=
e possible/desirable -- like shareable device local memory, or maybe even a=
 protected content blob.</div><div><br></div><div>HOST3D_GUEST is always ma=
ppable, while=C2=A0HOST3D isn&#39;t.=C2=A0=C2=A0</div><div>=C2=A0<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D=
<br>
&gt; +and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the<br=
>
&gt; +resource. There is no restriction on the image/buffer view the driver=
<br>
&gt; +has on the blob resource.<br>
<br>
I don&#39;t think VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is going to work if<br=
>
the resource has no format attached.=C2=A0 I had a TRANSFER_BLOB command<br=
>
because of that.<br></blockquote><div><br></div><div>I was thinking about G=
L/VK interop here.</div><div><br></div><div>Say VK allocates the blob resou=
rce, but a GL texture is subsequently created from the blob resource using =
GL/VK interop extensions and a format is attached.=C2=A0 For this reason, V=
IRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is allowed on blob resources.</div><div><=
br></div><div>Similarly, virtgpu_kms always attaches XR24 and AB24 to resou=
rces[1], so VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D can be reused if size =3D 4 =
* width for dumb/sys blob resources (which I think will always be the case?=
).</div><div><br></div><div>TRANSFER_BLOB is definitely useful for things t=
hat can&#39;t fit neatly into the previous hypercalls (YUV formats in virtg=
pu_kms?), and could be useful for optimizing emulated coherent memory (if w=
e ever=C2=A0add it).=C2=A0 The current prototype doesn&#39;t really use TRA=
NSFER_BLOB though, but if you have use cases in mind, it is definitely easy=
 to add.=C2=A0=C2=A0</div><div><br></div><div>[1]=C2=A0<a href=3D"https://g=
ithub.com/torvalds/linux/blob/master/drivers/gpu/drm/virtio/virtgpu_plane.c=
#L33" target=3D"_blank">https://github.com/torvalds/linux/blob/master/drive=
rs/gpu/drm/virtio/virtgpu_plane.c#L33</a></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; +VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D, VIRTIO_GPU_CMD_SET_SCANOUT and<br=
>
&gt; +VIRTIO_GPU_CMD_RESOURCE_FLUSH MAY be used with blob resources as well=
,<br>
&gt; +subject to the following restrictions:<br>
<br>
Same problem with VIRTIO_GPU_CMD_SET_SCANOUT, it expects the resource<br>
has a format attached which isn&#39;t the case for blob resources ...=C2=A0=
</blockquote><div><br></div><div>Ack.=C2=A0 I definitely see the logic behi=
nd=C2=A0VIRTIO_GPU_CMD_SET_SCANOUT_BLOB, but current display integration (d=
py_gl_scanout_texture(..) in QEMU) assumes the presence of a GL texture (wh=
ich can be created from a blob resource).=C2=A0 So we&#39;ll need to change=
 the display integration to be Wayland based, and pass (offsets[4], strides=
[4], virtualized modifier?, a few other things) via=C2=A0VIRTIO_GPU_CMD_SET=
_SCANOUT_BLOB.=C2=A0 But I think that&#39;ll only work if only in a Zink + =
VK1.1-only world where GL never allocates.</div><div><br></div><div>That&#3=
9;s a lot of changes, the current spec does what&#39;s needed for zero-copy=
 VK/GL, and attempts to be forward looking for future changes.=C2=A0 We may=
 need additional feature bits for more advanced display integration.</div><=
div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
cheers,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--0000000000005883bb05a4633fb5--

