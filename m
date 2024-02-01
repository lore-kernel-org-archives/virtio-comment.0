Return-Path: <virtio-comment-return-9062-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D37C4828D
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 18:09:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9E44771C92
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 18:09:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 710159868B7
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 18:09:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4C3C39868AC; Thu,  1 Feb 2024 18:09:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3D0A09868AD
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Feb 2024 18:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706810938; x=1707415738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuc10B1ruKcfTEhX3TwU0BawmwMT1Vgh3ncL9TJAYIk=;
        b=AL9GSlAvSqaaIfNe6xiHHljm+X3Kw0wtuxcq/L4Kg0vmAChmNGuauAgeg4pt13wxQL
         XzCA5DygaeKbHcoF3emqUCOX4tkkrMTSC3JmOdOxDJW8wq6TU9UNt4Y6+nt46J/YZwuC
         7rA2VC/qHtrSRKU4h1YfQcbwxroLlbYpYijwQNrhFOnrIEf2bs2VtQCSlDMNnMJlkVPN
         +7QT+IICFLmcvjCtNjkOIPJz0Zvxc2toeyB0ne4I9PLnB0AaUVNjugP/OFnuZT/lSOjV
         DBUPed+EVK4IJNg1fRnjbWFsnOUqtx2evCjIpA3bS1jC6a5e6s+yt2F0hlLR8WGPrXP0
         3m2Q==
X-Gm-Message-State: AOJu0YzLvjkr0rft3BbTF9PNUj78PJHF7ALdkGoHKusZ47VKZlZvL/78
	Z42/OO4T94gnDnpgc4N11TX3a66mEjGYls4olarnszZfZBk5Dy8TeDGF8QsQGRHLmBn6qhvhbNR
	wkA==
X-Google-Smtp-Source: AGHT+IHOOledkuRzrtXc2L6GM+aLM/L6wXl3osy5EVbitQWyektaLbxsHdGKmxBUox5QJdF428j0qw==
X-Received: by 2002:a17:906:254a:b0:a23:5939:759e with SMTP id j10-20020a170906254a00b00a235939759emr4911605ejb.26.1706810937739;
        Thu, 01 Feb 2024 10:08:57 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUUCbJpP4Bhc5itL9gWA9OvkT76uEQ/h4mS8gTvoOG/mbD8AqP/9qftmzexWzNFG1q+d/8nZ+CgkDoEVDEcu1DGnsyvCT9wA7wCI4Xa7IyT0+bmqg==
X-Received: by 2002:a50:9fcb:0:b0:55f:98d7:877c with SMTP id
 c69-20020a509fcb000000b0055f98d7877cmr220415edf.5.1706810937167; Thu, 01 Feb
 2024 10:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
 <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
 <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com> <CAAfnVBnGCP2m2WoXY=NKAQ4vQncB19c4YVMrC51r5KdsSq7uxQ@mail.gmail.com>
 <CAF6AEGtSGULUVVZ-45sdhUpffsqi7yM15aHSyPSt9=TMr8iEHw@mail.gmail.com>
In-Reply-To: <CAF6AEGtSGULUVVZ-45sdhUpffsqi7yM15aHSyPSt9=TMr8iEHw@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 1 Feb 2024 10:08:43 -0800
X-Gmail-Original-Message-ID: <CAAfnVBn-8a1kKe9M3RN75D9q9rdzep-=-7ixspmDDJu-Wz4C_Q@mail.gmail.com>
Message-ID: <CAAfnVBn-8a1kKe9M3RN75D9q9rdzep-=-7ixspmDDJu-Wz4C_Q@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Yiwei Zhang <zzyiwei@chromium.org>, 
	Ryan Neph <ryanneph@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>, Huang Rui <ray.huang@amd.com>, 
	Sergio Lopez <slp@redhat.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="0000000000009c55cb061055e3ce"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--0000000000009c55cb061055e3ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 9:14=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:

> On Thu, Feb 1, 2024 at 9:00=E2=80=AFAM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> >
> > On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 1/30/24 04:34, Gurchetan Singh wrote:
> >> > On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko <
> >> > dmitry.osipenko@collabora.com> wrote:
> >> >
> >> >> Document new virtio-gpu protocol fence-passing feature that extends
> 3d
> >> >> submit command with support of in-fences which are passed from gues=
t
> to
> >> >> host for waiting. This feature allows to offload waiting for
> in-fences
> >> >> from guest to host, where it can be done more efficiently.
> >> >>
> >> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> >> ---
> >> >>  device-types/gpu/description.tex | 22 +++++++++++++++++++++-
> >> >>  1 file changed, 21 insertions(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/device-types/gpu/description.tex
> >> >> b/device-types/gpu/description.tex
> >> >> index 443524851a05..e5e23b5c9072 100644
> >> >> --- a/device-types/gpu/description.tex
> >> >> +++ b/device-types/gpu/description.tex
> >> >> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types =
/
> GPU
> >> >> Device / Feature bits}
> >> >>    resources is supported.
> >> >>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
> >> >>    synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRG=
L.
> >> >> +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from guest
> to host
> >> >> +  for waiting supported.  Requires VIRTIO_GPU_F_VIRGL.
> >> >>  \end{description}
> >> >>
> >> >>  \subsection{Device configuration layout}\label{sec:Device Types /
> GPU
> >> >> Device / Device configuration layout}
> >> >> @@ -746,7 +748,25 @@ \subsubsection{Device Operation: controlq
> >> >> (3d)}\label{sec:Device Types / GPU Dev
> >> >>
> >> >>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
> >> >>    Submit an opaque command stream.  The type of the command stream
> is
> >> >> -  determined when creating a context.
> >> >> +  determined when creating a context.  Request data is
> >> >> +  \field{struct virtio_gpu_cmd_submit}.  The \field{size} field
> describes
> >> >> +  the size of \field{cmd_data} array in bytes.  The
> \field{num_in_fences}
> >> >> +  field is active only if VIRTIO_GPU_F_FENCE_PASSING is enabled,
> otherwise
> >> >> +  \field{num_in_fences} is treated as zero.  The array of
> >> >> \field{in_fences}
> >> >> +  IDs is placed in between the \field{num_in_fences} field and the
> >> >> +  \field{cmd_data} array.  The \field{in_fences} array contains
> virtio-gpu
> >> >> +  \field{fence_id}'s corresponding to the out-fence IDs of a
> previous
> >> >> +  3d submits.
> >> >> +
> >> >> +\begin{lstlisting}
> >> >> +struct virtio_gpu_cmd_submit {
> >> >> +        struct virtio_gpu_ctrl_hdr hdr;
> >> >> +        le32 size;
> >> >> +        le32 num_in_fences;
> >> >> +        le64 in_fences[num_in_fences];
> >> >> +        u32 cmd_data[size/4];
> >> >> +};
> >> >> +\end{lstlisting}
> >> >>
> >> >
> >> > Don't you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?
> >>
> >> We haven't made use of this flag in the experimental/prototype version
> >> that was made for the native contexts. The flag is unused by both Qemu
> >> and CrosVM.
> >>
> >> We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FENCE and it's
> >> deemed to be enough. If the UAPI flag isn't set for a job's out-fence,
> >> then guest uses guest-side synchronization for this fence when it's
> >> passed as in-fence for the further jobs.
> >>
> >> The FENCE_SHAREABLE flag isn't needed by nctx/virgl/venus protocols. A=
ll
> >> fences are shareable by default. If VMM fails to export fence, it is
> >> treated like fence was already signaled. In case of Venus, it's up to
> >> Venus to decide internally which fences can be made shareable, i.e. bo=
th
> >> guest and virglrenderer Venus implementations are responsible for maki=
ng
> >> decision whether fence should be made exportable. Venus won't make
> >> out-fence exportable for internal intermediate jobs and will encode th=
is
> >> export-info within the Venus protocol.
> >>
> >> Whether FENCE_SHAREABLE virtio-gpu flag will be needed by gfxstream is
> >> questionable. Gfxstream should be similar to Venus, i.e. you should be
> >> able to add flag to the gfxstream. We'll need to be certain that the n=
ew
> >> common flag is definitely needed by making use of it before specifying
> >> it in the stable virtio-gpu protocol.
> >
> >
> > I don't think you've gotten fence passing working with display
> integration.  Although passing external fences between two GPU instances
> does happen, the much more common and important case is passing a fence
> from the virtual GPU to virtual display.
> >
> > Let me describe the use case for you:
> >
> > GPU creates a fence
> > rutabaga exports fence on creation via stream_renderer_export_fence / o=
r
> virglrenderer_export_fence --> creates [fence_id --> descriptor mapping]
> when FLAG_SHAREABLE is set
> > SUBMIT_CMD + CROSS_DOMAIN_SEND --> takes the fence_ids and sends a fenc=
e
> to the compositor
> >
> > You also refer to
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#=
note_1996999
> .
> >
> > Once you have a working prototype that shares an out_fence with the
> display, then we can talk about whether FLAG_SHAREABLE is needed or not.
> So I suggest you focus on that before upstreaming uapis + virtio protocol=
s.
> >
>
> Why would sharing with display (via a different virtgpu ctx type) be
> any different than sharing with a different GPU context?  I don't
> really see a problem here, either the fence fd still exists on the
> host side, or you know that it is already signaled and you don't have
> to wait on anything.
>

I'm not a huge fan of the fact that the current implementation uses EGL to
create the pre-signalled fence.  Vulkan ... it could work, but I think
you'll have to generate some sort of dummy command at startup?  Shouldn't
that be implemented too?

Something should use the new "virgl_renderer_export_signalled_fence" API to
verify everything works.

Essentially, let's do our due diligence and verify the most important use
case (gpu --> display) actually works.


>
> BR,
> -R
>
> >> --
> >> Best regards,
> >> Dmitry
> >>
>

--0000000000009c55cb061055e3ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 1, 2024 at 9:14=E2=80=AFA=
M Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">ro=
bdclark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Thu, Feb 1, 2024 at 9:00=E2=80=AFAM Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko &lt;<a href=3D=
"mailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmitry.osipenko@co=
llabora.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 1/30/24 04:34, Gurchetan Singh wrote:<br>
&gt;&gt; &gt; On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko &lt;=
<br>
&gt;&gt; &gt; <a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_b=
lank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Document new virtio-gpu protocol fence-passing feature th=
at extends 3d<br>
&gt;&gt; &gt;&gt; submit command with support of in-fences which are passed=
 from guest to<br>
&gt;&gt; &gt;&gt; host for waiting. This feature allows to offload waiting =
for in-fences<br>
&gt;&gt; &gt;&gt; from guest to host, where it can be done more efficiently=
.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Dmitry Osipenko &lt;<a href=3D"mailto:dmit=
ry.osipenko@collabora.com" target=3D"_blank">dmitry.osipenko@collabora.com<=
/a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 device-types/gpu/description.tex | 22 +++++++++++++=
++++++++-<br>
&gt;&gt; &gt;&gt;=C2=A0 1 file changed, 21 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/device-types/gpu/description.tex<br>
&gt;&gt; &gt;&gt; b/device-types/gpu/description.tex<br>
&gt;&gt; &gt;&gt; index 443524851a05..e5e23b5c9072 100644<br>
&gt;&gt; &gt;&gt; --- a/device-types/gpu/description.tex<br>
&gt;&gt; &gt;&gt; +++ b/device-types/gpu/description.tex<br>
&gt;&gt; &gt;&gt; @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Dev=
ice Types / GPU<br>
&gt;&gt; &gt;&gt; Device / Feature bits}<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 resources is supported.<br>
&gt;&gt; &gt;&gt;=C2=A0 \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple conte=
xt types and<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 synchronization timelines supported.=C2=A0 R=
equires VIRTIO_GPU_F_VIRGL.<br>
&gt;&gt; &gt;&gt; +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs =
from guest to host<br>
&gt;&gt; &gt;&gt; +=C2=A0 for waiting supported.=C2=A0 Requires VIRTIO_GPU_=
F_VIRGL.<br>
&gt;&gt; &gt;&gt;=C2=A0 \end{description}<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 \subsection{Device configuration layout}\label{sec:=
Device Types / GPU<br>
&gt;&gt; &gt;&gt; Device / Device configuration layout}<br>
&gt;&gt; &gt;&gt; @@ -746,7 +748,25 @@ \subsubsection{Device Operation: con=
trolq<br>
&gt;&gt; &gt;&gt; (3d)}\label{sec:Device Types / GPU Dev<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 \item[VIRTIO_GPU_CMD_SUBMIT_3D]<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 Submit an opaque command stream.=C2=A0 The t=
ype of the command stream is<br>
&gt;&gt; &gt;&gt; -=C2=A0 determined when creating a context.<br>
&gt;&gt; &gt;&gt; +=C2=A0 determined when creating a context.=C2=A0 Request=
 data is<br>
&gt;&gt; &gt;&gt; +=C2=A0 \field{struct virtio_gpu_cmd_submit}.=C2=A0 The \=
field{size} field describes<br>
&gt;&gt; &gt;&gt; +=C2=A0 the size of \field{cmd_data} array in bytes.=C2=
=A0 The \field{num_in_fences}<br>
&gt;&gt; &gt;&gt; +=C2=A0 field is active only if VIRTIO_GPU_F_FENCE_PASSIN=
G is enabled, otherwise<br>
&gt;&gt; &gt;&gt; +=C2=A0 \field{num_in_fences} is treated as zero.=C2=A0 T=
he array of<br>
&gt;&gt; &gt;&gt; \field{in_fences}<br>
&gt;&gt; &gt;&gt; +=C2=A0 IDs is placed in between the \field{num_in_fences=
} field and the<br>
&gt;&gt; &gt;&gt; +=C2=A0 \field{cmd_data} array.=C2=A0 The \field{in_fence=
s} array contains virtio-gpu<br>
&gt;&gt; &gt;&gt; +=C2=A0 \field{fence_id}&#39;s corresponding to the out-f=
ence IDs of a previous<br>
&gt;&gt; &gt;&gt; +=C2=A0 3d submits.<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +\begin{lstlisting}<br>
&gt;&gt; &gt;&gt; +struct virtio_gpu_cmd_submit {<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl_hdr h=
dr;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 size;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 num_in_fences;<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64 in_fences[num_in_fences=
];<br>
&gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cmd_data[size/4];<br>
&gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; +\end{lstlisting}<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Don&#39;t you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere =
too?<br>
&gt;&gt;<br>
&gt;&gt; We haven&#39;t made use of this flag in the experimental/prototype=
 version<br>
&gt;&gt; that was made for the native contexts. The flag is unused by both =
Qemu<br>
&gt;&gt; and CrosVM.<br>
&gt;&gt;<br>
&gt;&gt; We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FENCE and i=
t&#39;s<br>
&gt;&gt; deemed to be enough. If the UAPI flag isn&#39;t set for a job&#39;=
s out-fence,<br>
&gt;&gt; then guest uses guest-side synchronization for this fence when it&=
#39;s<br>
&gt;&gt; passed as in-fence for the further jobs.<br>
&gt;&gt;<br>
&gt;&gt; The FENCE_SHAREABLE flag isn&#39;t needed by nctx/virgl/venus prot=
ocols. All<br>
&gt;&gt; fences are shareable by default. If VMM fails to export fence, it =
is<br>
&gt;&gt; treated like fence was already signaled. In case of Venus, it&#39;=
s up to<br>
&gt;&gt; Venus to decide internally which fences can be made shareable, i.e=
. both<br>
&gt;&gt; guest and virglrenderer Venus implementations are responsible for =
making<br>
&gt;&gt; decision whether fence should be made exportable. Venus won&#39;t =
make<br>
&gt;&gt; out-fence exportable for internal intermediate jobs and will encod=
e this<br>
&gt;&gt; export-info within the Venus protocol.<br>
&gt;&gt;<br>
&gt;&gt; Whether FENCE_SHAREABLE virtio-gpu flag will be needed by gfxstrea=
m is<br>
&gt;&gt; questionable. Gfxstream should be similar to Venus, i.e. you shoul=
d be<br>
&gt;&gt; able to add flag to the gfxstream. We&#39;ll need to be certain th=
at the new<br>
&gt;&gt; common flag is definitely needed by making use of it before specif=
ying<br>
&gt;&gt; it in the stable virtio-gpu protocol.<br>
&gt;<br>
&gt;<br>
&gt; I don&#39;t think you&#39;ve gotten fence passing working with display=
 integration.=C2=A0 Although passing external fences between two GPU instan=
ces does happen, the much more common and important case is passing a fence=
 from the virtual GPU to virtual display.<br>
&gt;<br>
&gt; Let me describe the use case for you:<br>
&gt;<br>
&gt; GPU creates a fence<br>
&gt; rutabaga exports fence on creation via stream_renderer_export_fence / =
or virglrenderer_export_fence --&gt; creates [fence_id --&gt; descriptor ma=
pping] when FLAG_SHAREABLE is set<br>
&gt; SUBMIT_CMD + CROSS_DOMAIN_SEND --&gt; takes the fence_ids and sends a =
fence to the compositor<br>
&gt;<br>
&gt; You also refer to <a href=3D"https://gitlab.freedesktop.org/virgl/virg=
lrenderer/-/merge_requests/1138#note_1996999" rel=3D"noreferrer" target=3D"=
_blank">https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests=
/1138#note_1996999</a>.<br>
&gt;<br>
&gt; Once you have a working prototype that shares an out_fence with the di=
splay, then we can talk about whether FLAG_SHAREABLE is needed or not.=C2=
=A0 So I suggest you focus on that before upstreaming uapis + virtio protoc=
ols.<br>
&gt;<br>
<br>
Why would sharing with display (via a different virtgpu ctx type) be<br>
any different than sharing with a different GPU context?=C2=A0 I don&#39;t<=
br>
really see a problem here, either the fence fd still exists on the<br>
host side, or you know that it is already signaled and you don&#39;t have<b=
r>
to wait on anything.<br></blockquote><div><br></div><div>I&#39;m not a huge=
 fan of the fact that the current implementation uses EGL to create the pre=
-signalled fence.=C2=A0 Vulkan ... it could work, but I think you&#39;ll ha=
ve to generate some sort of dummy command at startup?=C2=A0 Shouldn&#39;t t=
hat be implemented too?=C2=A0=C2=A0</div><div><br></div><div>Something shou=
ld use the new &quot;virgl_renderer_export_signalled_fence&quot; API to ver=
ify everything works.=C2=A0=C2=A0<br></div><div><br></div><div>Essentially,=
 let&#39;s do our due diligence and verify the most important use case (gpu=
 --&gt; display) actually works.=C2=A0=C2=A0</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
BR,<br>
-R<br>
<br>
&gt;&gt; --<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Dmitry<br>
&gt;&gt;<br>
</blockquote></div></div>

--0000000000009c55cb061055e3ce--
