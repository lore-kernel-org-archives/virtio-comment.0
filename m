Return-Path: <virtio-comment-return-9075-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A89C4828D
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 00:21:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 80B7B2AC43
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 00:21:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6334A9868D1
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 00:21:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 49658986366; Wed,  7 Feb 2024 00:21:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39C8A9868C6
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 00:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707265308; x=1707870108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVXPVSsl36Lycb1bZo5eg3y0youXYSmQtsygXUw0aPs=;
        b=GczU+cWoAXGKvk31BDFSlp3u1sX7UQmMb6m+Wor4iuvJqQIEuO64FA47HKhPPjYXs0
         IEMxdaDVRIQk6ErzzPskaplPmhm8fzhpcV9U8GduvdYn15rgk+hqvAgxAEeRNaPdts/A
         4HrkQaziDMhzAGJR6NnN7KWoIlNCZzH8cEtHPi/thSvTRtKwhCPLXODt6TyE+sWQVXP0
         BJFrxYNfcwg5T+WbCRZzTM3cgqSMhWabq5vR57mzeN5n6KklrHOVKJLfEICg1tG7tQ6a
         J9fSa5oWJmVSmpyLtV9ICJys4tE4ADjjQMsKk3G2+nNZFL19dW/QFmoFnSaBTHEzIvGD
         IhZA==
X-Forwarded-Encrypted: i=1; AJvYcCVhYMgCDPbhCei5ekb1Sw0tkM1vNP3pJm+bLoO2Glzy5uETFP+hLcC1sYAQq+y8JD/l4GfPvuFUYRfN93X4gRl6jD6XjXwNp1d23gkvgxU/MW6JZA==
X-Gm-Message-State: AOJu0YzffPle74ZaMpv7dkPOl0wfuNt4oJMS96yp6p/Rv1kLxXOckhi6
	vGnCEo3EIAF9m8RLQjCoYvmcNGK4h6TUQDZLbbNIGyUBz+tpyXq4vQJP4erl9Qt9RqR5CXXoPoG
	tMg==
X-Google-Smtp-Source: AGHT+IHg3qFd3X2dtRHEkEN/8DPnSVR//540XCHLT0X1+L0z/n0dTRIhfY1N6i4Xl3yqJfcc7FgzVg==
X-Received: by 2002:a50:c04f:0:b0:55f:ce14:337a with SMTP id u15-20020a50c04f000000b0055fce14337amr11852782edd.11.1707265307831;
        Tue, 06 Feb 2024 16:21:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVat0yNDjKighCsEQUn8mI+AT71EKQQYFRKvVzFN/tF+1bimjCEy7hrIH7msuzVcnsy222j2ijU/1qBJBr3V44DVVPrW26NzmKCQ6XUH0pZVHyNEA==
X-Forwarded-Encrypted: i=1; AJvYcCVUfAmOEX0FJKRGA6WKRe2FVE9cF56GjYJ82+AvTfLlB6M5WZS7Sm4BftQIht/xnsF6CASTY8MrO4g6gPM4VrwsykRrkK7Ju4jKkxFAPOt+8bUvSA==
X-Received: by 2002:a50:f61d:0:b0:55f:993a:f1c2 with SMTP id
 c29-20020a50f61d000000b0055f993af1c2mr5418edn.6.1707265306865; Tue, 06 Feb
 2024 16:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
 <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
 <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com> <CAAfnVBnGCP2m2WoXY=NKAQ4vQncB19c4YVMrC51r5KdsSq7uxQ@mail.gmail.com>
 <7e1da0ce-d8ec-4f54-9426-ba24730b12cd@collabora.com>
In-Reply-To: <7e1da0ce-d8ec-4f54-9426-ba24730b12cd@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 6 Feb 2024 16:21:33 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmLkc0kbx3U6uP_2w3xSRsyNCz_C--=gTpNurU1XeNBaQ@mail.gmail.com>
Message-ID: <CAAfnVBmLkc0kbx3U6uP_2w3xSRsyNCz_C--=gTpNurU1XeNBaQ@mail.gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Yiwei Zhang <zzyiwei@chromium.org>, 
	Ryan Neph <ryanneph@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Rob Clark <robdclark@gmail.com>, Huang Rui <ray.huang@amd.com>, Sergio Lopez <slp@redhat.com>, 
	virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="00000000000027f4e90610bfae81"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--00000000000027f4e90610bfae81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 6:53=E2=80=AFAM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> On 2/1/24 19:59, Gurchetan Singh wrote:
> > On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko <
> > dmitry.osipenko@collabora.com> wrote:
> >
> >> On 1/30/24 04:34, Gurchetan Singh wrote:
> >>> On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko <
> >>> dmitry.osipenko@collabora.com> wrote:
> >>>
> >>>> Document new virtio-gpu protocol fence-passing feature that extends =
3d
> >>>> submit command with support of in-fences which are passed from guest
> to
> >>>> host for waiting. This feature allows to offload waiting for in-fenc=
es
> >>>> from guest to host, where it can be done more efficiently.
> >>>>
> >>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>> ---
> >>>>  device-types/gpu/description.tex | 22 +++++++++++++++++++++-
> >>>>  1 file changed, 21 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/device-types/gpu/description.tex
> >>>> b/device-types/gpu/description.tex
> >>>> index 443524851a05..e5e23b5c9072 100644
> >>>> --- a/device-types/gpu/description.tex
> >>>> +++ b/device-types/gpu/description.tex
> >>>> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> GPU
> >>>> Device / Feature bits}
> >>>>    resources is supported.
> >>>>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
> >>>>    synchronization timelines supported.  Requires VIRTIO_GPU_F_VIRGL=
.
> >>>> +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from guest =
to
> >> host
> >>>> +  for waiting supported.  Requires VIRTIO_GPU_F_VIRGL.
> >>>>  \end{description}
> >>>>
> >>>>  \subsection{Device configuration layout}\label{sec:Device Types / G=
PU
> >>>> Device / Device configuration layout}
> >>>> @@ -746,7 +748,25 @@ \subsubsection{Device Operation: controlq
> >>>> (3d)}\label{sec:Device Types / GPU Dev
> >>>>
> >>>>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
> >>>>    Submit an opaque command stream.  The type of the command stream =
is
> >>>> -  determined when creating a context.
> >>>> +  determined when creating a context.  Request data is
> >>>> +  \field{struct virtio_gpu_cmd_submit}.  The \field{size} field
> >> describes
> >>>> +  the size of \field{cmd_data} array in bytes.  The
> >> \field{num_in_fences}
> >>>> +  field is active only if VIRTIO_GPU_F_FENCE_PASSING is enabled,
> >> otherwise
> >>>> +  \field{num_in_fences} is treated as zero.  The array of
> >>>> \field{in_fences}
> >>>> +  IDs is placed in between the \field{num_in_fences} field and the
> >>>> +  \field{cmd_data} array.  The \field{in_fences} array contains
> >> virtio-gpu
> >>>> +  \field{fence_id}'s corresponding to the out-fence IDs of a previo=
us
> >>>> +  3d submits.
> >>>> +
> >>>> +\begin{lstlisting}
> >>>> +struct virtio_gpu_cmd_submit {
> >>>> +        struct virtio_gpu_ctrl_hdr hdr;
> >>>> +        le32 size;
> >>>> +        le32 num_in_fences;
> >>>> +        le64 in_fences[num_in_fences];
> >>>> +        u32 cmd_data[size/4];
> >>>> +};
> >>>> +\end{lstlisting}
> >>>>
> >>>
> >>> Don't you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?
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
> >>
> >
> > I don't think you've gotten fence passing working with display
> > integration.  Although passing external fences between two GPU instance=
s
> > does happen, the much more common and important case is passing a fence
> > from the virtual GPU to virtual display.
> >
> > Let me describe the use case for you:
> >
> >    1. GPU creates a fence
> >    2. rutabaga exports fence on creation via
> stream_renderer_export_fence /
> >    or virglrenderer_export_fence --> creates [fence_id --> descriptor
> >    mapping] when FLAG_SHAREABLE is set
> >    3. SUBMIT_CMD + CROSS_DOMAIN_SEND --> takes the fence_ids and sends =
a
> >    fence to the compositor
> >
> > You also refer to
> >
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#=
note_1996999
> > .
> >
> > Once you have a working prototype that shares an out_fence with the
> > display, then we can talk about whether FLAG_SHAREABLE is needed or not=
.
> > So I suggest you focus on that before upstreaming uapis + virtio
> protocols.
>
> AMD nctx uses fence-passing for multi-gpu job syncing. I don't think
> Pierre-Eric uses it for display syncing on Qemu, Pierre don't you?


> The point is that the negated variant of the flag (i.e.
> FLAG_NOT_SHAREABLE) could be added later on if it will be needed. To my
> knowledge, there is a lot of work to be done until we'll be able to test
> the display path on CrOS. Hence it's more preferred not to block
> enabling of the basic variant of the feature, given that we can extend
> it in the future, IMO.
>

With crosvm on generic Linux, you can test both the virtio-gpu KMS display
sharing path and the Wayland pass-through paths within 1-2 months.  For
example, you may start with a drm-test that renders via GPU, shares the
fence with KMS, and which talks the Wayland display:

https://chromium.googlesource.com/chromiumos/platform/drm-tests/+/refs/head=
s/main
https://github.com/google/crosvm/blob/main/gpu_display/src/gpu_display_wl.r=
s

There's been talk about fence passing for a long-time [1] so I would get it
done rather than kicking the can down the road.  Definitely want to avoid a
FENCE_PASSING_V2 / FLAG_NOT_SHAREABLE.

[1] https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/208


>
> --
> Best regards,
> Dmitry
>
>

--00000000000027f4e90610bfae81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 5, 2024 at 6:53=E2=80=AFA=
M Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" targ=
et=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 2/1/24 19:59, Gurchetan Singh=
 wrote:<br>
&gt; On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko &lt;<br>
&gt; <a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmi=
try.osipenko@collabora.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 1/30/24 04:34, Gurchetan Singh wrote:<br>
&gt;&gt;&gt; On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko &lt;<=
br>
&gt;&gt;&gt; <a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_bl=
ank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Document new virtio-gpu protocol fence-passing feature tha=
t extends 3d<br>
&gt;&gt;&gt;&gt; submit command with support of in-fences which are passed =
from guest to<br>
&gt;&gt;&gt;&gt; host for waiting. This feature allows to offload waiting f=
or in-fences<br>
&gt;&gt;&gt;&gt; from guest to host, where it can be done more efficiently.=
<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Dmitry Osipenko &lt;<a href=3D"mailto:dmitr=
y.osipenko@collabora.com" target=3D"_blank">dmitry.osipenko@collabora.com</=
a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 device-types/gpu/description.tex | 22 ++++++++++++++=
+++++++-<br>
&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 21 insertions(+), 1 deletion(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/device-types/gpu/description.tex<br>
&gt;&gt;&gt;&gt; b/device-types/gpu/description.tex<br>
&gt;&gt;&gt;&gt; index 443524851a05..e5e23b5c9072 100644<br>
&gt;&gt;&gt;&gt; --- a/device-types/gpu/description.tex<br>
&gt;&gt;&gt;&gt; +++ b/device-types/gpu/description.tex<br>
&gt;&gt;&gt;&gt; @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Devi=
ce Types / GPU<br>
&gt;&gt;&gt;&gt; Device / Feature bits}<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 resources is supported.<br>
&gt;&gt;&gt;&gt;=C2=A0 \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple contex=
t types and<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 synchronization timelines supported.=C2=A0 Re=
quires VIRTIO_GPU_F_VIRGL.<br>
&gt;&gt;&gt;&gt; +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs f=
rom guest to<br>
&gt;&gt; host<br>
&gt;&gt;&gt;&gt; +=C2=A0 for waiting supported.=C2=A0 Requires VIRTIO_GPU_F=
_VIRGL.<br>
&gt;&gt;&gt;&gt;=C2=A0 \end{description}<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 \subsection{Device configuration layout}\label{sec:D=
evice Types / GPU<br>
&gt;&gt;&gt;&gt; Device / Device configuration layout}<br>
&gt;&gt;&gt;&gt; @@ -746,7 +748,25 @@ \subsubsection{Device Operation: cont=
rolq<br>
&gt;&gt;&gt;&gt; (3d)}\label{sec:Device Types / GPU Dev<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 \item[VIRTIO_GPU_CMD_SUBMIT_3D]<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 Submit an opaque command stream.=C2=A0 The ty=
pe of the command stream is<br>
&gt;&gt;&gt;&gt; -=C2=A0 determined when creating a context.<br>
&gt;&gt;&gt;&gt; +=C2=A0 determined when creating a context.=C2=A0 Request =
data is<br>
&gt;&gt;&gt;&gt; +=C2=A0 \field{struct virtio_gpu_cmd_submit}.=C2=A0 The \f=
ield{size} field<br>
&gt;&gt; describes<br>
&gt;&gt;&gt;&gt; +=C2=A0 the size of \field{cmd_data} array in bytes.=C2=A0=
 The<br>
&gt;&gt; \field{num_in_fences}<br>
&gt;&gt;&gt;&gt; +=C2=A0 field is active only if VIRTIO_GPU_F_FENCE_PASSING=
 is enabled,<br>
&gt;&gt; otherwise<br>
&gt;&gt;&gt;&gt; +=C2=A0 \field{num_in_fences} is treated as zero.=C2=A0 Th=
e array of<br>
&gt;&gt;&gt;&gt; \field{in_fences}<br>
&gt;&gt;&gt;&gt; +=C2=A0 IDs is placed in between the \field{num_in_fences}=
 field and the<br>
&gt;&gt;&gt;&gt; +=C2=A0 \field{cmd_data} array.=C2=A0 The \field{in_fences=
} array contains<br>
&gt;&gt; virtio-gpu<br>
&gt;&gt;&gt;&gt; +=C2=A0 \field{fence_id}&#39;s corresponding to the out-fe=
nce IDs of a previous<br>
&gt;&gt;&gt;&gt; +=C2=A0 3d submits.<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +\begin{lstlisting}<br>
&gt;&gt;&gt;&gt; +struct virtio_gpu_cmd_submit {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl_hdr hd=
r;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 size;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 num_in_fences;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64 in_fences[num_in_fences]=
;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cmd_data[size/4];<br>
&gt;&gt;&gt;&gt; +};<br>
&gt;&gt;&gt;&gt; +\end{lstlisting}<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Don&#39;t you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere t=
oo?<br>
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
&gt;&gt;<br>
&gt; <br>
&gt; I don&#39;t think you&#39;ve gotten fence passing working with display=
<br>
&gt; integration.=C2=A0 Although passing external fences between two GPU in=
stances<br>
&gt; does happen, the much more common and important case is passing a fenc=
e<br>
&gt; from the virtual GPU to virtual display.<br>
&gt; <br>
&gt; Let me describe the use case for you:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 1. GPU creates a fence<br>
&gt;=C2=A0 =C2=A0 2. rutabaga exports fence on creation via stream_renderer=
_export_fence /<br>
&gt;=C2=A0 =C2=A0 or virglrenderer_export_fence --&gt; creates [fence_id --=
&gt; descriptor<br>
&gt;=C2=A0 =C2=A0 mapping] when FLAG_SHAREABLE is set<br>
&gt;=C2=A0 =C2=A0 3. SUBMIT_CMD + CROSS_DOMAIN_SEND --&gt; takes the fence_=
ids and sends a<br>
&gt;=C2=A0 =C2=A0 fence to the compositor<br>
&gt; <br>
&gt; You also refer to<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_=
requests/1138#note_1996999" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#note_1996999=
</a><br>
&gt; .<br>
&gt; <br>
&gt; Once you have a working prototype that shares an out_fence with the<br=
>
&gt; display, then we can talk about whether FLAG_SHAREABLE is needed or no=
t.<br>
&gt; So I suggest you focus on that before upstreaming uapis + virtio proto=
cols.<br>
<br>
AMD nctx uses fence-passing for multi-gpu job syncing. I don&#39;t think<br=
>
Pierre-Eric uses it for display syncing on Qemu, Pierre don&#39;t you?=C2=
=A0=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The point is that the negated variant of the flag (i.e.<br>
FLAG_NOT_SHAREABLE) could be added later on if it will be needed. To my<br>
knowledge, there is a lot of work to be done until we&#39;ll be able to tes=
t<br>
the display path on CrOS. Hence it&#39;s more preferred not to block<br>
enabling of the basic variant of the feature, given that we can extend<br>
it in the future, IMO.<br></blockquote><div><br></div><div>With crosvm on g=
eneric Linux, you can test both the virtio-gpu KMS display sharing path and=
 the Wayland pass-through paths within 1-2 months.=C2=A0 For example, you m=
ay start with a drm-test that renders via GPU, shares the fence with KMS, a=
nd which talks the Wayland display:<br></div><div><br></div><div><a href=3D=
"https://chromium.googlesource.com/chromiumos/platform/drm-tests/+/refs/hea=
ds/main" target=3D"_blank">https://chromium.googlesource.com/chromiumos/pla=
tform/drm-tests/+/refs/heads/main</a><br></div><div><a href=3D"https://gith=
ub.com/google/crosvm/blob/main/gpu_display/src/gpu_display_wl.rs" target=3D=
"_blank">https://github.com/google/crosvm/blob/main/gpu_display/src/gpu_dis=
play_wl.rs</a><br></div><div><br></div><div>There&#39;s been talk about fen=
ce passing for a long-time [1] so I would get it done rather than kicking t=
he can down the road.=C2=A0 Definitely want to avoid a FENCE_PASSING_V2 / F=
LAG_NOT_SHAREABLE.=C2=A0 =C2=A0</div><div><br></div><div>[1]=C2=A0<a href=
=3D"https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/208" target=
=3D"_blank">https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/208=
</a></div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div></div>

--00000000000027f4e90610bfae81--
