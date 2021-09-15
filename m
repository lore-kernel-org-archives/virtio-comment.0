Return-Path: <virtio-comment-return-2283-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF9B09863CB
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Sep 2021 23:37:50 +0000 (UTC)
MIME-Version: 1.0
References: <20210909012953.431-1-gurchetansingh@chromium.org>
 <20210909012953.431-2-gurchetansingh@chromium.org> <20210915082047.khw5kkcq7uz5r2io@sirius.home.kraxel.org>
In-Reply-To: <20210915082047.khw5kkcq7uz5r2io@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 15 Sep 2021 16:37:33 -0700
Message-ID: <CAAfnVBnLefgmy1Ncyefj1OSKqMhiByG20CtF7iGRW6OSGBy1Ng@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH v1 2/2] virtio-gpu: add context init support
Content-Type: multipart/alternative; boundary="0000000000007a233605cc112f4e"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--0000000000007a233605cc112f4e
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 15, 2021 at 1:20 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Wed, Sep 08, 2021 at 06:29:53PM -0700, Gurchetan Singh wrote:
> > This brings explicit context initialization and different types
> > to virtio-gpu.
> >
> > In the past, VIRTIO_GPU_F_VIRGL meant the virglrenderer support.
> > With VIRTIO_GPU_F_VIRGL + VIRTIO_GPU_F_CONTEXT_INIT, this means
> > generic 3D virtualization defined by the context type.  It's
> > entirely possible the virglrenderer project isn't available on
> > the host in this scenario.  The VIRTIO_GPU_F_VIRGL naming
> > convention is kept since it's easier to redefine the meaning
> > rather than changing header files.
> >
> > The context type is associated an particular capset id.  Virgl
> > has two capsets due a prior bug, but for other cases the 1:1
> > mapping between context type and capset id is valid.
> >
> > In addition, fencing needs to be fixed to accomodate multiple
> > context types.  In the past, there was one global timeline
> > associated witht the OpenGL rendering.  Now, there are multiple
> > timelines which can be associated with GL, VK or even display
> > contexts.
> >
> > v2: Correct number of bits
> > v3: le32 info --> {u8 ring_idx + u8 padding[3])
> >     Don't require FLAG_FENCE and FLAG_RING_IDX
>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
>

Thanks, request a vote:

https://github.com/oasis-tcs/virtio-spec/issues/117

--0000000000007a233605cc112f4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 1:20 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, =
Sep 08, 2021 at 06:29:53PM -0700, Gurchetan Singh wrote:<br>
&gt; This brings explicit context initialization and different types<br>
&gt; to virtio-gpu.<br>
&gt; <br>
&gt; In the past, VIRTIO_GPU_F_VIRGL meant the virglrenderer support.<br>
&gt; With VIRTIO_GPU_F_VIRGL + VIRTIO_GPU_F_CONTEXT_INIT, this means<br>
&gt; generic 3D virtualization defined by the context type.=C2=A0 It&#39;s<=
br>
&gt; entirely possible the virglrenderer project isn&#39;t available on<br>
&gt; the host in this scenario.=C2=A0 The VIRTIO_GPU_F_VIRGL naming<br>
&gt; convention is kept since it&#39;s easier to redefine the meaning<br>
&gt; rather than changing header files.<br>
&gt; <br>
&gt; The context type is associated an particular capset id.=C2=A0 Virgl<br=
>
&gt; has two capsets due a prior bug, but for other cases the 1:1<br>
&gt; mapping between context type and capset id is valid.<br>
&gt; <br>
&gt; In addition, fencing needs to be fixed to accomodate multiple<br>
&gt; context types.=C2=A0 In the past, there was one global timeline<br>
&gt; associated witht the OpenGL rendering.=C2=A0 Now, there are multiple<b=
r>
&gt; timelines which can be associated with GL, VK or even display<br>
&gt; contexts.<br>
&gt; <br>
&gt; v2: Correct number of bits<br>
&gt; v3: le32 info --&gt; {u8 ring_idx + u8 padding[3])<br>
&gt;=C2=A0 =C2=A0 =C2=A0Don&#39;t require FLAG_FENCE and FLAG_RING_IDX<br>
<br>
Reviewed-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=
=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>T=
hanks, request a vote:</div><div><br></div><div><a href=3D"https://github.c=
om/oasis-tcs/virtio-spec/issues/117">https://github.com/oasis-tcs/virtio-sp=
ec/issues/117</a>=C2=A0</div><div><br></div><div>=C2=A0</div></div></div>

--0000000000007a233605cc112f4e--

