Return-Path: virtio-comment-return-909-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 321F2985DEA
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Nov 2019 19:07:20 +0000 (UTC)
MIME-Version: 1.0
References: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
 <20191111113410.GF442334@stefanha-x1.localdomain>
In-Reply-To: <20191111113410.GF442334@stefanha-x1.localdomain>
From: Matias Vara <matiasevara@gmail.com>
Date: Mon, 11 Nov 2019 20:07:06 +0100
Message-ID: <CA+dKekDZsJXd_xhmWFtSypncBRe_CZBxSmK8J5Orn3vMPkHVUg@mail.gmail.com>
Subject: Re: [virtio-comment] Formal specification of virtIO
Content-Type: multipart/alternative; boundary="0000000000002ad393059716d7d2"
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--0000000000002ad393059716d7d2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Nov 2019 at 12:34, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Sun, Nov 10, 2019 at 03:33:20PM +0100, Matias Vara wrote:
> > I have started to think of the formalization of the virtIO specificatio=
n.
> > Roughly speaking, I could use a formal language to "code" the virtIO
> spec.
> > As far as I can think, this has three benefits:
> > 1. You can validate any implementation.
> > 2. You can generate the implementation for a given target. For example,
> you
> > could be able to generate the implementation of a virtIO device in VHDL=
.
> > 3. You can provide simulation and verification before any implementatio=
n.
> > In automotive, this is interesting because you ease the certification s=
o
> > formalization pays off.
> >
> > Do you think this may be interesting work to do to become the virtIO
> > specification more robust?
>
> As a starting point you could propose a formal model of an aspect of the
> specification, like the device lifecycle VIRTIO_CONFIG_S_* status
> register state machine (start easy!).
>
> It would already offer the advantages you mentioned for a subset of the
> specification and give the community a chance to get familiar with the
> tools and workflow.
>
> Even if it turns out to be impractical to formalize the entire VIRTIO
> specification, it will certainly reveal things that can be improved in
> the current spec.
>
> Stefan
>

Thanks for the comments. First, I would capture data structures by using a
metamodel. This would allow generating the structures depending on the
target language, e.g., C, Rust, Latex. To do this, it is needed a
model-to-text transformation. Then, I would base on a subset of the
specification to describe the behavior by using a formal language. The
VIRTIO_CONFIG_S_* status register state machine may be a good candidate for
starting. I will keep you updated on the progress.

--0000000000002ad393059716d7d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Nov 2019 at 12:34, Stefan Hajn=
oczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, =
Nov 10, 2019 at 03:33:20PM +0100, Matias Vara wrote:<br>
&gt; I have started to think of the formalization of the virtIO specificati=
on.<br>
&gt; Roughly speaking, I could use a formal language to &quot;code&quot; th=
e virtIO spec.<br>
&gt; As far as I can think, this has three benefits:<br>
&gt; 1. You can validate any implementation.<br>
&gt; 2. You can generate the implementation for a given target. For example=
, you<br>
&gt; could be able to generate the implementation of a virtIO device in VHD=
L.<br>
&gt; 3. You can provide simulation and verification before any implementati=
on.<br>
&gt; In automotive, this is interesting because you ease the certification =
so<br>
&gt; formalization pays off.<br>
&gt; <br>
&gt; Do you think this may be interesting work to do to become the virtIO<b=
r>
&gt; specification more robust?<br>
<br>
As a starting point you could propose a formal model of an aspect of the<br=
>
specification, like the device lifecycle VIRTIO_CONFIG_S_* status<br>
register state machine (start easy!).<br>
<br>
It would already offer the advantages you mentioned for a subset of the<br>
specification and give the community a chance to get familiar with the<br>
tools and workflow.<br>
<br>
Even if it turns out to be impractical to formalize the entire VIRTIO<br>
specification, it will certainly reveal things that can be improved in<br>
the current spec.<br>
<br>
Stefan<br></blockquote><div><br></div><div>Thanks for the comments. First, =
I would capture data structures by using a metamodel. This would allow gene=
rating the structures depending on the target language, e.g., C, Rust, Late=
x. To do this, it is needed a model-to-text transformation. Then, I would b=
ase on a subset of the specification to describe the behavior by using a fo=
rmal language. The VIRTIO_CONFIG_S_* status register state machine may be a=
 good candidate for starting. I will keep you updated on the progress.=C2=
=A0</div></div></div>

--0000000000002ad393059716d7d2--

