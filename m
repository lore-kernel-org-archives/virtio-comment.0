Return-Path: <virtio-comment-return-9064-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0D7C48291
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Feb 2024 18:16:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 35D6475B88
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Feb 2024 18:16:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 147629868C9
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Feb 2024 18:16:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F0BC498403A; Fri,  2 Feb 2024 18:16:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF75D9868BE
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Feb 2024 18:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897794; x=1707502594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HUfE4+dent+4DLlcJnkNIfhXtH9f8d+Gt6xM+kKNuw=;
        b=SVN0Fucwbaj3PC7U5pZBJU7zJST1kQbLjCe6/GKuyUK091HGVa2NQ8dhQ6g6VmDO1t
         Zddc6oP/IPL+LBr7sgD3fLPEF3Qdl/QUJCAY1Uj8V1ZtkTqrHYVOKF6YnGIwODM0FnXt
         aO+PDoQQ4t5F7bne7b4vnCTmxqRdUcMQGbILRVbtDv8JrOh07G4NW0ZXVk1eP85HtVDR
         Gc5k3iJTG8ydV4a7Cjro6XOUY2+JmyrEJ/+aMuzsp6zTkm5eYlR4U4aU/F4jtFAcbIr4
         AGhpj07B4eNnN/N8uunKjeVE7h1oluII/fj41iq31yp0kA52WrWM0VpRkxnjwLjxshQE
         2Kow==
X-Gm-Message-State: AOJu0YwSWF+NjNRUI2H7yrZrO1zvCPHaWJYHPX+ZE4o5pal/Gbu0+nI3
	jqF/lkhmvv/bQjXWHli+1dy5LgP1fYe3qwHYlUAg597F+JbFJV1J15nr/J2puBU7m/WB46/0VKC
	aBg==
X-Google-Smtp-Source: AGHT+IFj72cZ6UjtysPWfXY+3p/J6J3rfMSllXh8JFZauBrMPG7fLn/otnHTdF+Tr1H6LQQyf6OYAQ==
X-Received: by 2002:a50:9fe3:0:b0:55f:d7f8:1072 with SMTP id c90-20020a509fe3000000b0055fd7f81072mr442285edf.3.1706897794420;
        Fri, 02 Feb 2024 10:16:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVPfH3imkvAdp6MJRgeouiQEZbRPVNUCVo7YAjxWBJdj1cvirX569UVHm6ZfPZh3ahodXO83g8M1nfBR+XZHSyM0CN0V7btMpMqXaRlJGBfR8q8xQ==
X-Received: by 2002:a50:9f2f:0:b0:560:1f8:1669 with SMTP id
 b44-20020a509f2f000000b0056001f81669mr64110edf.2.1706897793152; Fri, 02 Feb
 2024 10:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
 <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
 <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com> <CAAfnVBnGCP2m2WoXY=NKAQ4vQncB19c4YVMrC51r5KdsSq7uxQ@mail.gmail.com>
 <CAF6AEGtSGULUVVZ-45sdhUpffsqi7yM15aHSyPSt9=TMr8iEHw@mail.gmail.com>
 <CAAfnVBn-8a1kKe9M3RN75D9q9rdzep-=-7ixspmDDJu-Wz4C_Q@mail.gmail.com> <CAF6AEGuQD-zuHjkjeBEuteyvQE33pGeF0XPDjGDZrZBrr=tNJg@mail.gmail.com>
In-Reply-To: <CAF6AEGuQD-zuHjkjeBEuteyvQE33pGeF0XPDjGDZrZBrr=tNJg@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 2 Feb 2024 10:16:19 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmasMmXRcNnxG3J_8bg8w-Bq3yKZ66sLKxv+Q3gbbgr3g@mail.gmail.com>
Message-ID: <CAAfnVBmasMmXRcNnxG3J_8bg8w-Bq3yKZ66sLKxv+Q3gbbgr3g@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Yiwei Zhang <zzyiwei@chromium.org>, 
	Ryan Neph <ryanneph@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>, Huang Rui <ray.huang@amd.com>, 
	Sergio Lopez <slp@redhat.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000a1485906106a1c33"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--000000000000a1485906106a1c33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 11:19=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:

> On Thu, Feb 1, 2024 at 10:08=E2=80=AFAM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> > On Thu, Feb 1, 2024 at 9:14=E2=80=AFAM Rob Clark <robdclark@gmail.com> =
wrote:
> >>
> >> On Thu, Feb 1, 2024 at 9:00=E2=80=AFAM Gurchetan Singh
> >> <gurchetansingh@chromium.org> wrote:
> >> >
> >> >
> >> >
> >> >
> >> > On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
> >> >>
> >> >> On 1/30/24 04:34, Gurchetan Singh wrote:
> >> >> > On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko <
> >> >> > dmitry.osipenko@collabora.com> wrote:
> >> >> >
> >> >> >> Document new virtio-gpu protocol fence-passing feature that
> extends 3d
> >> >> >> submit command with support of in-fences which are passed from
> guest to
> >> >> >> host for waiting. This feature allows to offload waiting for
> in-fences
> >> >> >> from guest to host, where it can be done more efficiently.
> >> >> >>
> >> >> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> >> >> ---
> >> >> >>  device-types/gpu/description.tex | 22 +++++++++++++++++++++-
> >> >> >>  1 file changed, 21 insertions(+), 1 deletion(-)
> >> >> >>
> >> >> >> diff --git a/device-types/gpu/description.tex
> >> >> >> b/device-types/gpu/description.tex
> >> >> >> index 443524851a05..e5e23b5c9072 100644
> >> >> >> --- a/device-types/gpu/description.tex
> >> >> >> +++ b/device-types/gpu/description.tex
> >> >> >> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device
> Types / GPU
> >> >> >> Device / Feature bits}
> >> >> >>    resources is supported.
> >> >> >>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types and
> >> >> >>    synchronization timelines supported.  Requires
> VIRTIO_GPU_F_VIRGL.
> >> >> >> +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from
> guest to host
> >> >> >> +  for waiting supported.  Requires VIRTIO_GPU_F_VIRGL.
> >> >> >>  \end{description}
> >> >> >>
> >> >> >>  \subsection{Device configuration layout}\label{sec:Device Types
> / GPU
> >> >> >> Device / Device configuration layout}
> >> >> >> @@ -746,7 +748,25 @@ \subsubsection{Device Operation: controlq
> >> >> >> (3d)}\label{sec:Device Types / GPU Dev
> >> >> >>
> >> >> >>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
> >> >> >>    Submit an opaque command stream.  The type of the command
> stream is
> >> >> >> -  determined when creating a context.
> >> >> >> +  determined when creating a context.  Request data is
> >> >> >> +  \field{struct virtio_gpu_cmd_submit}.  The \field{size} field
> describes
> >> >> >> +  the size of \field{cmd_data} array in bytes.  The
> \field{num_in_fences}
> >> >> >> +  field is active only if VIRTIO_GPU_F_FENCE_PASSING is enabled=
,
> otherwise
> >> >> >> +  \field{num_in_fences} is treated as zero.  The array of
> >> >> >> \field{in_fences}
> >> >> >> +  IDs is placed in between the \field{num_in_fences} field and
> the
> >> >> >> +  \field{cmd_data} array.  The \field{in_fences} array contains
> virtio-gpu
> >> >> >> +  \field{fence_id}'s corresponding to the out-fence IDs of a
> previous
> >> >> >> +  3d submits.
> >> >> >> +
> >> >> >> +\begin{lstlisting}
> >> >> >> +struct virtio_gpu_cmd_submit {
> >> >> >> +        struct virtio_gpu_ctrl_hdr hdr;
> >> >> >> +        le32 size;
> >> >> >> +        le32 num_in_fences;
> >> >> >> +        le64 in_fences[num_in_fences];
> >> >> >> +        u32 cmd_data[size/4];
> >> >> >> +};
> >> >> >> +\end{lstlisting}
> >> >> >>
> >> >> >
> >> >> > Don't you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?
> >> >>
> >> >> We haven't made use of this flag in the experimental/prototype
> version
> >> >> that was made for the native contexts. The flag is unused by both
> Qemu
> >> >> and CrosVM.
> >> >>
> >> >> We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FENCE and it=
's
> >> >> deemed to be enough. If the UAPI flag isn't set for a job's
> out-fence,
> >> >> then guest uses guest-side synchronization for this fence when it's
> >> >> passed as in-fence for the further jobs.
> >> >>
> >> >> The FENCE_SHAREABLE flag isn't needed by nctx/virgl/venus protocols=
.
> All
> >> >> fences are shareable by default. If VMM fails to export fence, it i=
s
> >> >> treated like fence was already signaled. In case of Venus, it's up =
to
> >> >> Venus to decide internally which fences can be made shareable, i.e.
> both
> >> >> guest and virglrenderer Venus implementations are responsible for
> making
> >> >> decision whether fence should be made exportable. Venus won't make
> >> >> out-fence exportable for internal intermediate jobs and will encode
> this
> >> >> export-info within the Venus protocol.
> >> >>
> >> >> Whether FENCE_SHAREABLE virtio-gpu flag will be needed by gfxstream
> is
> >> >> questionable. Gfxstream should be similar to Venus, i.e. you should
> be
> >> >> able to add flag to the gfxstream. We'll need to be certain that th=
e
> new
> >> >> common flag is definitely needed by making use of it before
> specifying
> >> >> it in the stable virtio-gpu protocol.
> >> >
> >> >
> >> > I don't think you've gotten fence passing working with display
> integration.  Although passing external fences between two GPU instances
> does happen, the much more common and important case is passing a fence
> from the virtual GPU to virtual display.
> >> >
> >> > Let me describe the use case for you:
> >> >
> >> > GPU creates a fence
> >> > rutabaga exports fence on creation via stream_renderer_export_fence =
/
> or virglrenderer_export_fence --> creates [fence_id --> descriptor mappin=
g]
> when FLAG_SHAREABLE is set
> >> > SUBMIT_CMD + CROSS_DOMAIN_SEND --> takes the fence_ids and sends a
> fence to the compositor
> >> >
> >> > You also refer to
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#=
note_1996999
> .
> >> >
> >> > Once you have a working prototype that shares an out_fence with the
> display, then we can talk about whether FLAG_SHAREABLE is needed or not.
> So I suggest you focus on that before upstreaming uapis + virtio protocol=
s.
> >> >
> >>
> >> Why would sharing with display (via a different virtgpu ctx type) be
> >> any different than sharing with a different GPU context?  I don't
> >> really see a problem here, either the fence fd still exists on the
> >> host side, or you know that it is already signaled and you don't have
> >> to wait on anything.
> >
> >
> > I'm not a huge fan of the fact that the current implementation uses EGL
> to create the pre-signalled fence.  Vulkan ... it could work, but I think
> you'll have to generate some sort of dummy command at startup?  Shouldn't
> that be implemented too?
> >
> > Something should use the new "virgl_renderer_export_signalled_fence" AP=
I
> to verify everything works.
>
> ok, so I gather you are talking about the awkwardness with the wayland
> protocol that we can't just pass -1 for a fence?  Rather than say
> something using kms.
>

Is there a plan to do a virtio-gpu KMS implementation?  Something like
RESOURCE_FLUSH (in_fence)?  There are still many virtio-gpu KMS users out
there.


>
> I think this is just an implementation detail.  At any rate, in the
> later version of the virglrenderer implementation, which got merged,
> there is no dependency on EGL for this.  Only that there was _some_
> prior work which created a fence.  Virglrenderer hangs on to a
> reference to the last signalled fence until it is replaced with a
> newer one.  If a guest fence is created, by definition the host will
> have _some_ signaled fence to hand out.
>

The implementation does use a static global table (virgl_fence_table) to
coordinate between the virgl sync thread and the main thread?  This is
common in C, but discouraged in Rust (and I do have a use case in mind).

Spec-wise, having FLAG_SHAREABLE + another DESTROY_FENCE api would probably
be the cleanest since it gives explicit lifetimes.  If there were no
performance concerns we would totally do it.

The concern is that DESTROY_FENCE causes excessive vm-exits as fences are
attached to the surface every frame.  So that's how we end up with the last
signalled fence idea, and somewhat undefined lifetime/ownership semantics.

Though, the guest kernel already tracks fence lifetimes through dma_fence.
What if we add:

- DESTROY_FENCES(fence_ids, num_fences)
- a virtio-config ("fence_destroy_threshold"), which controls num_fences in
DESTROY_FENCES

When fence_destroy_threshold =3D=3D 0, this would be the current proposed
solution (fence lifetimes implementation defined).  However, a user can
make "fence_destroy_threshold" 100 or something like that, to cause a
VM-exit everytime 100 fences have been destroyed.

This attempts a tunable compromise between API purity and performance
concerns.  WDYT?


>
> But this is all implementation detail
>
> BR,
> -R
>
> >
> > Essentially, let's do our due diligence and verify the most important
> use case (gpu --> display) actually works.
> >
> >>
> >>
> >> BR,
> >> -R
> >>
> >> >> --
> >> >> Best regards,
> >> >> Dmitry
> >> >>
>

--000000000000a1485906106a1c33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 1, 2024 at 11:19=E2=80=AF=
AM Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">r=
obdclark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Thu, Feb 1, 2024 at 10:08=E2=80=AFAM Gurchetan Singh<b=
r>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Feb 1, 2024 at 9:14=E2=80=AFAM Rob Clark &lt;<a href=3D"mailto=
:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; On Thu, Feb 1, 2024 at 9:00=E2=80=AFAM Gurchetan Singh<br>
&gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blan=
k">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko &lt;<=
a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmitry.os=
ipenko@collabora.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On 1/30/24 04:34, Gurchetan Singh wrote:<br>
&gt;&gt; &gt;&gt; &gt; On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osip=
enko &lt;<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"mailto:dmitry.osipenko@collabora.com" tar=
get=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Document new virtio-gpu protocol fence-passing f=
eature that extends 3d<br>
&gt;&gt; &gt;&gt; &gt;&gt; submit command with support of in-fences which a=
re passed from guest to<br>
&gt;&gt; &gt;&gt; &gt;&gt; host for waiting. This feature allows to offload=
 waiting for in-fences<br>
&gt;&gt; &gt;&gt; &gt;&gt; from guest to host, where it can be done more ef=
ficiently.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Signed-off-by: Dmitry Osipenko &lt;<a href=3D"ma=
ilto:dmitry.osipenko@collabora.com" target=3D"_blank">dmitry.osipenko@colla=
bora.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 device-types/gpu/description.tex | 22 ++++=
+++++++++++++++++-<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 1 file changed, 21 insertions(+), 1 deleti=
on(-)<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; diff --git a/device-types/gpu/description.tex<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; b/device-types/gpu/description.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; index 443524851a05..e5e23b5c9072 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; --- a/device-types/gpu/description.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; +++ b/device-types/gpu/description.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; @@ -37,6 +37,8 @@ \subsection{Feature bits}\labe=
l{sec:Device Types / GPU<br>
&gt;&gt; &gt;&gt; &gt;&gt; Device / Feature bits}<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 resources is supported.<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multi=
ple context types and<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 synchronization timelines supported=
.=C2=A0 Requires VIRTIO_GPU_F_VIRGL.<br>
&gt;&gt; &gt;&gt; &gt;&gt; +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing f=
ence IDs from guest to host<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 for waiting supported.=C2=A0 Requires VI=
RTIO_GPU_F_VIRGL.<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \end{description}<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \subsection{Device configuration layout}\l=
abel{sec:Device Types / GPU<br>
&gt;&gt; &gt;&gt; &gt;&gt; Device / Device configuration layout}<br>
&gt;&gt; &gt;&gt; &gt;&gt; @@ -746,7 +748,25 @@ \subsubsection{Device Opera=
tion: controlq<br>
&gt;&gt; &gt;&gt; &gt;&gt; (3d)}\label{sec:Device Types / GPU Dev<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \item[VIRTIO_GPU_CMD_SUBMIT_3D]<br>
&gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 Submit an opaque command stream.=C2=
=A0 The type of the command stream is<br>
&gt;&gt; &gt;&gt; &gt;&gt; -=C2=A0 determined when creating a context.<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 determined when creating a context.=C2=
=A0 Request data is<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{struct virtio_gpu_cmd_submit}.=C2=
=A0 The \field{size} field describes<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 the size of \field{cmd_data} array in by=
tes.=C2=A0 The \field{num_in_fences}<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 field is active only if VIRTIO_GPU_F_FEN=
CE_PASSING is enabled, otherwise<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{num_in_fences} is treated as zero=
.=C2=A0 The array of<br>
&gt;&gt; &gt;&gt; &gt;&gt; \field{in_fences}<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 IDs is placed in between the \field{num_=
in_fences} field and the<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{cmd_data} array.=C2=A0 The \field=
{in_fences} array contains virtio-gpu<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{fence_id}&#39;s corresponding to =
the out-fence IDs of a previous<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 3d submits.<br>
&gt;&gt; &gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; +\begin{lstlisting}<br>
&gt;&gt; &gt;&gt; &gt;&gt; +struct virtio_gpu_cmd_submit {<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_c=
trl_hdr hdr;<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 size;<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 num_in_fences;=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64 in_fences[num_=
in_fences];<br>
&gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cmd_data[size/4=
];<br>
&gt;&gt; &gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; &gt;&gt; +\end{lstlisting}<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Don&#39;t you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE s=
omewhere too?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; We haven&#39;t made use of this flag in the experimental/=
prototype version<br>
&gt;&gt; &gt;&gt; that was made for the native contexts. The flag is unused=
 by both Qemu<br>
&gt;&gt; &gt;&gt; and CrosVM.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FE=
NCE and it&#39;s<br>
&gt;&gt; &gt;&gt; deemed to be enough. If the UAPI flag isn&#39;t set for a=
 job&#39;s out-fence,<br>
&gt;&gt; &gt;&gt; then guest uses guest-side synchronization for this fence=
 when it&#39;s<br>
&gt;&gt; &gt;&gt; passed as in-fence for the further jobs.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The FENCE_SHAREABLE flag isn&#39;t needed by nctx/virgl/v=
enus protocols. All<br>
&gt;&gt; &gt;&gt; fences are shareable by default. If VMM fails to export f=
ence, it is<br>
&gt;&gt; &gt;&gt; treated like fence was already signaled. In case of Venus=
, it&#39;s up to<br>
&gt;&gt; &gt;&gt; Venus to decide internally which fences can be made share=
able, i.e. both<br>
&gt;&gt; &gt;&gt; guest and virglrenderer Venus implementations are respons=
ible for making<br>
&gt;&gt; &gt;&gt; decision whether fence should be made exportable. Venus w=
on&#39;t make<br>
&gt;&gt; &gt;&gt; out-fence exportable for internal intermediate jobs and w=
ill encode this<br>
&gt;&gt; &gt;&gt; export-info within the Venus protocol.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Whether FENCE_SHAREABLE virtio-gpu flag will be needed by=
 gfxstream is<br>
&gt;&gt; &gt;&gt; questionable. Gfxstream should be similar to Venus, i.e. =
you should be<br>
&gt;&gt; &gt;&gt; able to add flag to the gfxstream. We&#39;ll need to be c=
ertain that the new<br>
&gt;&gt; &gt;&gt; common flag is definitely needed by making use of it befo=
re specifying<br>
&gt;&gt; &gt;&gt; it in the stable virtio-gpu protocol.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I don&#39;t think you&#39;ve gotten fence passing working wit=
h display integration.=C2=A0 Although passing external fences between two G=
PU instances does happen, the much more common and important case is passin=
g a fence from the virtual GPU to virtual display.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Let me describe the use case for you:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; GPU creates a fence<br>
&gt;&gt; &gt; rutabaga exports fence on creation via stream_renderer_export=
_fence / or virglrenderer_export_fence --&gt; creates [fence_id --&gt; desc=
riptor mapping] when FLAG_SHAREABLE is set<br>
&gt;&gt; &gt; SUBMIT_CMD + CROSS_DOMAIN_SEND --&gt; takes the fence_ids and=
 sends a fence to the compositor<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; You also refer to <a href=3D"https://gitlab.freedesktop.org/v=
irgl/virglrenderer/-/merge_requests/1138#note_1996999" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge=
_requests/1138#note_1996999</a>.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Once you have a working prototype that shares an out_fence wi=
th the display, then we can talk about whether FLAG_SHAREABLE is needed or =
not.=C2=A0 So I suggest you focus on that before upstreaming uapis + virtio=
 protocols.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Why would sharing with display (via a different virtgpu ctx type) =
be<br>
&gt;&gt; any different than sharing with a different GPU context?=C2=A0 I d=
on&#39;t<br>
&gt;&gt; really see a problem here, either the fence fd still exists on the=
<br>
&gt;&gt; host side, or you know that it is already signaled and you don&#39=
;t have<br>
&gt;&gt; to wait on anything.<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m not a huge fan of the fact that the current implementation use=
s EGL to create the pre-signalled fence.=C2=A0 Vulkan ... it could work, bu=
t I think you&#39;ll have to generate some sort of dummy command at startup=
?=C2=A0 Shouldn&#39;t that be implemented too?<br>
&gt;<br>
&gt; Something should use the new &quot;virgl_renderer_export_signalled_fen=
ce&quot; API to verify everything works.<br>
<br>
ok, so I gather you are talking about the awkwardness with the wayland<br>
protocol that we can&#39;t just pass -1 for a fence?=C2=A0 Rather than say<=
br>
something using kms.<br></blockquote><div><br></div><div>Is there a plan to=
 do a virtio-gpu KMS implementation?=C2=A0 Something like RESOURCE_FLUSH (i=
n_fence)?=C2=A0 There are still many virtio-gpu KMS users out there.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I think this is just an implementation detail.=C2=A0 At any rate, in the<br=
>
later version of the virglrenderer implementation, which got merged,<br>
there is no dependency on EGL for this.=C2=A0 Only that there was _some_<br=
>
prior work which created a fence.=C2=A0 Virglrenderer hangs on to a<br>
reference to the last signalled fence until it is replaced with a<br>
newer one.=C2=A0 If a guest fence is created, by definition the host will<b=
r>
have _some_ signaled fence to hand out.<br></blockquote><div><br></div><div=
>The implementation does use a static global table (virgl_fence_table) to c=
oordinate between the virgl sync thread and the main thread?=C2=A0 This is =
common in C, but discouraged in Rust (and I do have a use case in mind).=C2=
=A0</div><div><br></div><div>Spec-wise, having FLAG_SHAREABLE=C2=A0+ anothe=
r DESTROY_FENCE api would probably be the cleanest since it gives explicit =
lifetimes.=C2=A0 If there were no performance concerns we would totally do =
it.<br></div><div><br></div><div>The concern is that DESTROY_FENCE=C2=A0cau=
ses excessive vm-exits as fences are attached to the surface every frame.=
=C2=A0 So that&#39;s how we end up with the last signalled fence idea, and =
somewhat undefined lifetime/ownership semantics.</div><div><br></div><div>T=
hough, the guest kernel already tracks fence lifetimes through dma_fence.=
=C2=A0 What if we add:</div><div><br></div><div>- DESTROY_FENCES(fence_ids,=
 num_fences)</div><div>- a virtio-config (&quot;fence_destroy_threshold&quo=
t;), which controls num_fences in DESTROY_FENCES</div><div><br></div><div>W=
hen fence_destroy_threshold =3D=3D 0, this would be the current proposed so=
lution (fence lifetimes implementation defined).=C2=A0 However, a user can =
make &quot;fence_destroy_threshold&quot; 100 or something like that, to cau=
se a VM-exit everytime 100 fences have been destroyed.</div><div><br></div>=
<div>This attempts a tunable compromise between API purity and performance =
concerns.=C2=A0 WDYT?</div><div>=C2=A0=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
But this is all implementation detail<br>
<br>
BR,<br>
-R<br>
<br>
&gt;<br>
&gt; Essentially, let&#39;s do our due diligence and verify the most import=
ant use case (gpu --&gt; display) actually works.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; BR,<br>
&gt;&gt; -R<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; Best regards,<br>
&gt;&gt; &gt;&gt; Dmitry<br>
&gt;&gt; &gt;&gt;<br>
</blockquote></div></div>

--000000000000a1485906106a1c33--
