Return-Path: virtio-comment-return-1439-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5872C985EC1
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Sep 2020 20:54:28 +0000 (UTC)
MIME-Version: 1.0
References: <20200814015447.1151-1-gurchetansingh@chromium.org>
 <20200814015447.1151-3-gurchetansingh@chromium.org> <20200819070632.s2wzxinadoymd2cs@sirius.home.kraxel.org>
In-Reply-To: <20200819070632.s2wzxinadoymd2cs@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 2 Sep 2020 13:54:12 -0700
Message-ID: <CAAfnVBkP_r+Zsi-+ifuxEAFLe7AvGuX0hnbsLSDXM1eLsMDgjw@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH 2/2] virtio-gpu: add support for mapping/unmapping blob resources
Content-Type: multipart/alternative; boundary="0000000000003bf77705ae5ad75c"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--0000000000003bf77705ae5ad75c
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 19, 2020 at 12:06 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > +struct virtio_gpu_resource_map_blob {
> > +        struct virtio_gpu_ctrl_hdr hdr;
> > +        le32 resource_id;
> > +        le32 padding;
> > +        le64 offset;
> > +};
>
> > +struct virtio_gpu_resource_unmap_blob {
> > +        struct virtio_gpu_ctrl_hdr hdr;
> > +        le32 resource_id;
> > +        le32 padding;
> > +};
>
> map has an offset but unmap has not.  So in case a resource has multiple
> mappings it is not clear which one is going to be unmapped.  So we
> should:
>
>   (a) add offset field to unmap, or
>   (b) explicitly specify that unmap will unmap all existing mappings, or
>   (c) explicitly specify that multiple mappings are not allowed.
>
> My guess is we want (c) ...
>

Exactly, updated v6 to reflect this.

(sorry for the late reply, -ENOTIME as well).


>
> take care,
>   Gerd
>
>

--0000000000003bf77705ae5ad75c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 19, 2020 at 12:06 AM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">=C2=A0 Hi,<br>
<br>
&gt; +struct virtio_gpu_resource_map_blob {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl_hdr hdr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 resource_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 padding;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64 offset;<br>
&gt; +};<br>
<br>
&gt; +struct virtio_gpu_resource_unmap_blob {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl_hdr hdr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 resource_id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 padding;<br>
&gt; +};<br>
<br>
map has an offset but unmap has not.=C2=A0 So in case a resource has multip=
le<br>
mappings it is not clear which one is going to be unmapped.=C2=A0 So we<br>
should:<br>
<br>
=C2=A0 (a) add offset field to unmap, or<br>
=C2=A0 (b) explicitly specify that unmap will unmap all existing mappings, =
or<br>
=C2=A0 (c) explicitly specify that multiple mappings are not allowed.<br>
<br>
My guess is we want (c) ...<br></blockquote><div><br></div><div>Exactly, up=
dated v6 to reflect this.</div><div><br></div><div>(sorry for the late repl=
y, -ENOTIME as well).</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--0000000000003bf77705ae5ad75c--

