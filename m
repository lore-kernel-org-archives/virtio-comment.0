Return-Path: <virtio-comment-return-9061-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EAFC48286
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 17:00:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DCAB02AC5C
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 17:00:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9CFA49868AD
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 17:00:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5BFB59868AB; Thu,  1 Feb 2024 17:00:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3915D9868AC
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Feb 2024 17:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806804; x=1707411604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fa608wayxPdYnqBpvz9JYNzv/otWrWg0aCbCbemY8s4=;
        b=dzHpijsQm92ml4u38DG5jYv4aCOy336MzaznghHjoa1YV59ZrFLDYDBJRxUEOo9xGc
         Lt3K6CE+Dk1qslaxGk9gBY/e7/ob00/BJUw5QVo/QnGKsumCHoB0DEo/hL1AqR2PouZr
         lbpnz9etaSbB6ZvzsQUQxXs9JsBGvYQgQTI4JZRxTRHACfDyVhkjBnsZxv1AvAE9gX0Z
         F6cpIuIb1gxbtTj/gCZmZHNbuvSLpEEJR+SXbVl/r5gm8bD46hympKRTBQ0Da/0RpvXU
         PnIQQL50eakvT5FdmuT0LZj6G7TAfjaSvAOpduNCja6nrv27kiO4PUVZdcZb5VCRshpz
         eDhw==
X-Gm-Message-State: AOJu0Yx/Wq7AYAQ9y8zqoweVs52KUOM+Y/stbD+6rEFJ02ZCSKkgXLac
	pwb6VAKAxBYMuDbwla+nu7FNpE9sIp6AElBWhfGlvetUZusc8m1I9HuZW+4wX0FNZzc/5jvgj68
	ONg==
X-Google-Smtp-Source: AGHT+IGE/LOfAgBVJj7k7/8Ig8e+R+040JGmLxUqGmSNCIrC1ByUGjekjqt7Cwi/z2oXMj1BvQRIPw==
X-Received: by 2002:a17:906:7049:b0:a36:5c45:1e09 with SMTP id r9-20020a170906704900b00a365c451e09mr5201890ejj.31.1706806803788;
        Thu, 01 Feb 2024 09:00:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXOc4YymByXDqJlt/T1Fr4YOSi9HVWNw86zjdOw1SErlzWyymNpeQcU16Enb95RhK7QCIQ4kcpPQr9wZszeNWIyJgNFMpzzIIiC2Pce/ZFy1lB7jQ==
X-Received: by 2002:a50:9998:0:b0:55f:9918:dadd with SMTP id
 m24-20020a509998000000b0055f9918daddmr275397edb.2.1706806803215; Thu, 01 Feb
 2024 09:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
 <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com> <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com>
In-Reply-To: <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 1 Feb 2024 08:59:49 -0800
X-Gmail-Original-Message-ID: <CAAfnVBnGCP2m2WoXY=NKAQ4vQncB19c4YVMrC51r5KdsSq7uxQ@mail.gmail.com>
Message-ID: <CAAfnVBnGCP2m2WoXY=NKAQ4vQncB19c4YVMrC51r5KdsSq7uxQ@mail.gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Yiwei Zhang <zzyiwei@chromium.org>, Ryan Neph <ryanneph@chromium.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>, Huang Rui <ray.huang@amd.com>, 
	Sergio Lopez <slp@redhat.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000350ed8061054ed02"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--000000000000350ed8061054ed02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> On 1/30/24 04:34, Gurchetan Singh wrote:
> > On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko <
> > dmitry.osipenko@collabora.com> wrote:
> >
> >> Document new virtio-gpu protocol fence-passing feature that extends 3d
> >> submit command with support of in-fences which are passed from guest t=
o
> >> host for waiting. This feature allows to offload waiting for in-fences
> >> from guest to host, where it can be done more efficiently.
> >>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---
> >>  device-types/gpu/description.tex | 22 +++++++++++++++++++++-
> >>  1 file changed, 21 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/device-types/gpu/description.tex
> >> b/device-types/gpu/description.tex
> >> index 443524851a05..e5e23b5c9072 100644
> >> --- a/device-types/gpu/description.tex
> >> +++ b/device-types/gpu/description.tex
> >> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types / G=
PU
> >> Device / Feature bits}
> >>    resources is supported.
> >>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
> >>    synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL.
> >> +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from guest to
> host
> >> +  for waiting supported.  Requires VIRTIO_GPU_F_VIRGL.
> >>  \end{description}
> >>
> >>  \subsection{Device configuration layout}\label{sec:Device Types / GPU
> >> Device / Device configuration layout}
> >> @@ -746,7 +748,25 @@ \subsubsection{Device Operation: controlq
> >> (3d)}\label{sec:Device Types / GPU Dev
> >>
> >>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
> >>    Submit an opaque command stream.  The type of the command stream is
> >> -  determined when creating a context.
> >> +  determined when creating a context.  Request data is
> >> +  \field{struct virtio_gpu_cmd_submit}.  The \field{size} field
> describes
> >> +  the size of \field{cmd_data} array in bytes.  The
> \field{num_in_fences}
> >> +  field is active only if VIRTIO_GPU_F_FENCE_PASSING is enabled,
> otherwise
> >> +  \field{num_in_fences} is treated as zero.  The array of
> >> \field{in_fences}
> >> +  IDs is placed in between the \field{num_in_fences} field and the
> >> +  \field{cmd_data} array.  The \field{in_fences} array contains
> virtio-gpu
> >> +  \field{fence_id}'s corresponding to the out-fence IDs of a previous
> >> +  3d submits.
> >> +
> >> +\begin{lstlisting}
> >> +struct virtio_gpu_cmd_submit {
> >> +        struct virtio_gpu_ctrl_hdr hdr;
> >> +        le32 size;
> >> +        le32 num_in_fences;
> >> +        le64 in_fences[num_in_fences];
> >> +        u32 cmd_data[size/4];
> >> +};
> >> +\end{lstlisting}
> >>
> >
> > Don't you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?
>
> We haven't made use of this flag in the experimental/prototype version
> that was made for the native contexts. The flag is unused by both Qemu
> and CrosVM.
>
> We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FENCE and it's
> deemed to be enough. If the UAPI flag isn't set for a job's out-fence,
> then guest uses guest-side synchronization for this fence when it's
> passed as in-fence for the further jobs.
>
> The FENCE_SHAREABLE flag isn't needed by nctx/virgl/venus protocols. All
> fences are shareable by default. If VMM fails to export fence, it is
> treated like fence was already signaled. In case of Venus, it's up to
> Venus to decide internally which fences can be made shareable, i.e. both
> guest and virglrenderer Venus implementations are responsible for making
> decision whether fence should be made exportable. Venus won't make
> out-fence exportable for internal intermediate jobs and will encode this
> export-info within the Venus protocol.
>
> Whether FENCE_SHAREABLE virtio-gpu flag will be needed by gfxstream is
> questionable. Gfxstream should be similar to Venus, i.e. you should be
> able to add flag to the gfxstream. We'll need to be certain that the new
> common flag is definitely needed by making use of it before specifying
> it in the stable virtio-gpu protocol.
>

I don't think you've gotten fence passing working with display
integration.  Although passing external fences between two GPU instances
does happen, the much more common and important case is passing a fence
from the virtual GPU to virtual display.

Let me describe the use case for you:

   1. GPU creates a fence
   2. rutabaga exports fence on creation via stream_renderer_export_fence /
   or virglrenderer_export_fence --> creates [fence_id --> descriptor
   mapping] when FLAG_SHAREABLE is set
   3. SUBMIT_CMD + CROSS_DOMAIN_SEND --> takes the fence_ids and sends a
   fence to the compositor

You also refer to
https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#no=
te_1996999
.

Once you have a working prototype that shares an out_fence with the
display, then we can talk about whether FLAG_SHAREABLE is needed or not.
So I suggest you focus on that before upstreaming uapis + virtio protocols.

--=20
> Best regards,
> Dmitry
>
>

--000000000000350ed8061054ed02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko &lt;<a href=
=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmitry.osipenko=
@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 1/30/24 04:34, Gurchetan Singh wrote:<br>
&gt; On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko &lt;<br>
&gt; <a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmi=
try.osipenko@collabora.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Document new virtio-gpu protocol fence-passing feature that extend=
s 3d<br>
&gt;&gt; submit command with support of in-fences which are passed from gue=
st to<br>
&gt;&gt; host for waiting. This feature allows to offload waiting for in-fe=
nces<br>
&gt;&gt; from guest to host, where it can be done more efficiently.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipen=
ko@collabora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt;<b=
r>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 device-types/gpu/description.tex | 22 +++++++++++++++++++++-=
<br>
&gt;&gt;=C2=A0 1 file changed, 21 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/device-types/gpu/description.tex<br>
&gt;&gt; b/device-types/gpu/description.tex<br>
&gt;&gt; index 443524851a05..e5e23b5c9072 100644<br>
&gt;&gt; --- a/device-types/gpu/description.tex<br>
&gt;&gt; +++ b/device-types/gpu/description.tex<br>
&gt;&gt; @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types=
 / GPU<br>
&gt;&gt; Device / Feature bits}<br>
&gt;&gt;=C2=A0 =C2=A0 resources is supported.<br>
&gt;&gt;=C2=A0 \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types =
and<br>
&gt;&gt;=C2=A0 =C2=A0 synchronization timelines supported.=C2=A0 Requires V=
IRTIO_GPU_F_VIRGL.<br>
&gt;&gt; +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from gues=
t to host<br>
&gt;&gt; +=C2=A0 for waiting supported.=C2=A0 Requires VIRTIO_GPU_F_VIRGL.<=
br>
&gt;&gt;=C2=A0 \end{description}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 \subsection{Device configuration layout}\label{sec:Device Ty=
pes / GPU<br>
&gt;&gt; Device / Device configuration layout}<br>
&gt;&gt; @@ -746,7 +748,25 @@ \subsubsection{Device Operation: controlq<br>
&gt;&gt; (3d)}\label{sec:Device Types / GPU Dev<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 \item[VIRTIO_GPU_CMD_SUBMIT_3D]<br>
&gt;&gt;=C2=A0 =C2=A0 Submit an opaque command stream.=C2=A0 The type of th=
e command stream is<br>
&gt;&gt; -=C2=A0 determined when creating a context.<br>
&gt;&gt; +=C2=A0 determined when creating a context.=C2=A0 Request data is<=
br>
&gt;&gt; +=C2=A0 \field{struct virtio_gpu_cmd_submit}.=C2=A0 The \field{siz=
e} field describes<br>
&gt;&gt; +=C2=A0 the size of \field{cmd_data} array in bytes.=C2=A0 The \fi=
eld{num_in_fences}<br>
&gt;&gt; +=C2=A0 field is active only if VIRTIO_GPU_F_FENCE_PASSING is enab=
led, otherwise<br>
&gt;&gt; +=C2=A0 \field{num_in_fences} is treated as zero.=C2=A0 The array =
of<br>
&gt;&gt; \field{in_fences}<br>
&gt;&gt; +=C2=A0 IDs is placed in between the \field{num_in_fences} field a=
nd the<br>
&gt;&gt; +=C2=A0 \field{cmd_data} array.=C2=A0 The \field{in_fences} array =
contains virtio-gpu<br>
&gt;&gt; +=C2=A0 \field{fence_id}&#39;s corresponding to the out-fence IDs =
of a previous<br>
&gt;&gt; +=C2=A0 3d submits.<br>
&gt;&gt; +<br>
&gt;&gt; +\begin{lstlisting}<br>
&gt;&gt; +struct virtio_gpu_cmd_submit {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl_hdr hdr;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 size;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 num_in_fences;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64 in_fences[num_in_fences];<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cmd_data[size/4];<br>
&gt;&gt; +};<br>
&gt;&gt; +\end{lstlisting}<br>
&gt;&gt;<br>
&gt; <br>
&gt; Don&#39;t you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?<br>
<br>
We haven&#39;t made use of this flag in the experimental/prototype version<=
br>
that was made for the native contexts. The flag is unused by both Qemu<br>
and CrosVM.<br>
<br>
We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FENCE and it&#39;s<b=
r>
deemed to be enough. If the UAPI flag isn&#39;t set for a job&#39;s out-fen=
ce,<br>
then guest uses guest-side synchronization for this fence when it&#39;s<br>
passed as in-fence for the further jobs.<br>
<br>
The FENCE_SHAREABLE flag isn&#39;t needed by nctx/virgl/venus protocols. Al=
l<br>
fences are shareable by default. If VMM fails to export fence, it is<br>
treated like fence was already signaled. In case of Venus, it&#39;s up to<b=
r>
Venus to decide internally which fences can be made shareable, i.e. both<br=
>
guest and virglrenderer Venus implementations are responsible for making<br=
>
decision whether fence should be made exportable. Venus won&#39;t make<br>
out-fence exportable for internal intermediate jobs and will encode this<br=
>
export-info within the Venus protocol.<br>
<br>
Whether FENCE_SHAREABLE virtio-gpu flag will be needed by gfxstream is<br>
questionable. Gfxstream should be similar to Venus, i.e. you should be<br>
able to add flag to the gfxstream. We&#39;ll need to be certain that the ne=
w<br>
common flag is definitely needed by making use of it before specifying<br>
it in the stable virtio-gpu protocol.<br></blockquote><div><br></div><div>I=
 don&#39;t think you&#39;ve gotten fence passing working with display integ=
ration.=C2=A0 Although passing external fences between two GPU instances do=
es happen, the much more common and important case is passing a fence from =
the virtual GPU to virtual display.</div><div><br></div><div>Let me describ=
e the use case for you:</div><div><ol dir=3D"auto"><li>GPU creates a fence<=
/li>
<li>rutabaga exports fence on creation via <code>stream_renderer_export_fen=
ce</code> / or <code>virglrenderer_export_fence</code> --&gt; creates [fenc=
e_id --&gt; descriptor mapping] when <code>FLAG_SHAREABLE</code> is set</li=
>
<li>SUBMIT_CMD + <code>CROSS_DOMAIN_SEND</code> --&gt; takes the fence_ids =
and sends a fence to the compositor</li>
</ol>
<p dir=3D"auto"></p></div><div>You also refer to <a href=3D"https://gitlab.=
freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#note_1996999">htt=
ps://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#note_=
1996999</a>.<br></div><div><br></div><div>Once you have a working prototype=
 that shares an out_fence with the display, then we can talk about whether=
=C2=A0<span style=3D"font-family:monospace">FLAG_SHAREABLE=C2=A0</span>is n=
eeded or not.=C2=A0 So I suggest you focus on that before upstreaming uapis=
=C2=A0+ virtio protocols.</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div></div>
</div>

--000000000000350ed8061054ed02--
