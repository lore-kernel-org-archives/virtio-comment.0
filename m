Return-Path: <virtio-comment-return-9074-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23884C48297
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 00:09:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5681D2B022
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 00:09:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 318829868D0
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 00:09:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1539F986366; Wed,  7 Feb 2024 00:09:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFF729868C6
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 00:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707264589; x=1707869389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2wykjdq4+rHaYPR2u0h37XSmmje0WRPAQZJQSRQq+s=;
        b=ry99xcZ51t0ipq53sugTsrTyhiAxx0xW7FuVI4e9SGLcwwS1LsiZBT++Os+9A4ehf8
         vPNp6xNRi8lsM9ggTL7hi+03m/UJh/LIlSLkndHpmvaJOAW79PjV+1slDStfogyURro7
         wOq8RAsDf4ziNEIgmV2TKnj9yYR1E0POTnV66i840lUNXHhdLFa+8Un9OY3gy5ZkkfH4
         IbmqJ8roYOS8iWLM6H+dpe2dCPk7bSNsKDVSQqbGv4T2TSCmFpNhbCKMI6zBqTcNC8W2
         Egr3MrykZFWCOlmeFGHz++y+bj6bFyr3MqCEZrXAbWPgOKB4+V6PwtY9NkO+YnADQ+Km
         xX/w==
X-Gm-Message-State: AOJu0Yz3KUUxYEjI4yDVniqd5nCWPVMOsVXmZ+1oFSJLIDCGSt+ry5sR
	ppylDuel2SIk/GA+RJvYAGjXf4AsfXeQzvIQg9O83jS5Ux/9+sJp2tDAQAZFZ8lppeThe6dhl0o
	p3Q==
X-Google-Smtp-Source: AGHT+IGF4ErFpzGG+9rMScQO//Zzb/U5Livu6Z7txiL4OmbvPyxTEaSNmLXhGX6tL2k2H7NFG+wusA==
X-Received: by 2002:a17:906:31d0:b0:a38:34a5:7113 with SMTP id f16-20020a17090631d000b00a3834a57113mr2000692ejf.20.1707264589370;
        Tue, 06 Feb 2024 16:09:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWhA/nnYU3xWAkJXPOhPK+hY8co9v+CXbkQyU/nhKY4GmKt0m7zQJ2FJcPAeI1BZonGW19dSN9wn7fIcK0u4LONFKj1JFK3/Qnsv2mKU1AIfLTfQ==
X-Received: by 2002:a50:9f42:0:b0:55f:e704:85ce with SMTP id
 b60-20020a509f42000000b0055fe70485cemr5217edf.3.1707264588122; Tue, 06 Feb
 2024 16:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
 <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
 <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com> <CAAfnVBnGCP2m2WoXY=NKAQ4vQncB19c4YVMrC51r5KdsSq7uxQ@mail.gmail.com>
 <CAF6AEGtSGULUVVZ-45sdhUpffsqi7yM15aHSyPSt9=TMr8iEHw@mail.gmail.com>
 <CAAfnVBn-8a1kKe9M3RN75D9q9rdzep-=-7ixspmDDJu-Wz4C_Q@mail.gmail.com>
 <CAF6AEGuQD-zuHjkjeBEuteyvQE33pGeF0XPDjGDZrZBrr=tNJg@mail.gmail.com>
 <CAAfnVBmasMmXRcNnxG3J_8bg8w-Bq3yKZ66sLKxv+Q3gbbgr3g@mail.gmail.com> <CAF6AEGtmfFuh0iZpnzm9wbROeCcGx5hGU-BnnJKMcj0awhcZFQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtmfFuh0iZpnzm9wbROeCcGx5hGU-BnnJKMcj0awhcZFQ@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 6 Feb 2024 16:09:34 -0800
X-Gmail-Original-Message-ID: <CAAfnVBnb9RcpCX03trdfxOTehUioCOXAkNfuW=5vS26qt_YSdQ@mail.gmail.com>
Message-ID: <CAAfnVBnb9RcpCX03trdfxOTehUioCOXAkNfuW=5vS26qt_YSdQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Yiwei Zhang <zzyiwei@chromium.org>, 
	Ryan Neph <ryanneph@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>, Huang Rui <ray.huang@amd.com>, 
	Sergio Lopez <slp@redhat.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="00000000000050e5d30610bf83b7"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--00000000000050e5d30610bf83b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 11:40=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:

> On Fri, Feb 2, 2024 at 10:16=E2=80=AFAM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> > On Thu, Feb 1, 2024 at 11:19=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Thu, Feb 1, 2024 at 10:08=E2=80=AFAM Gurchetan Singh
> >> <gurchetansingh@chromium.org> wrote:
> >> >
> >> >
> >> >
> >> > On Thu, Feb 1, 2024 at 9:14=E2=80=AFAM Rob Clark <robdclark@gmail.co=
m> wrote:
> >> >>
> >> >> On Thu, Feb 1, 2024 at 9:00=E2=80=AFAM Gurchetan Singh
> >> >> <gurchetansingh@chromium.org> wrote:
> >> >> >
> >> >> >
> >> >> >
> >> >> >
> >> >> > On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
> >> >> >>
> >> >> >> On 1/30/24 04:34, Gurchetan Singh wrote:
> >> >> >> > On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko <
> >> >> >> > dmitry.osipenko@collabora.com> wrote:
> >> >> >> >
> >> >> >> >> Document new virtio-gpu protocol fence-passing feature that
> extends 3d
> >> >> >> >> submit command with support of in-fences which are passed fro=
m
> guest to
> >> >> >> >> host for waiting. This feature allows to offload waiting for
> in-fences
> >> >> >> >> from guest to host, where it can be done more efficiently.
> >> >> >> >>
> >> >> >> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com=
>
> >> >> >> >> ---
> >> >> >> >>  device-types/gpu/description.tex | 22 +++++++++++++++++++++-
> >> >> >> >>  1 file changed, 21 insertions(+), 1 deletion(-)
> >> >> >> >>
> >> >> >> >> diff --git a/device-types/gpu/description.tex
> >> >> >> >> b/device-types/gpu/description.tex
> >> >> >> >> index 443524851a05..e5e23b5c9072 100644
> >> >> >> >> --- a/device-types/gpu/description.tex
> >> >> >> >> +++ b/device-types/gpu/description.tex
> >> >> >> >> @@ -37,6 +37,8 @@ \subsection{Feature bits}\label{sec:Device
> Types / GPU
> >> >> >> >> Device / Feature bits}
> >> >> >> >>    resources is supported.
> >> >> >> >>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context types
> and
> >> >> >> >>    synchronization timelines supported.  Requires
> VIRTIO_GPU_F_VIRGL.
> >> >> >> >> +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs from
> guest to host
> >> >> >> >> +  for waiting supported.  Requires VIRTIO_GPU_F_VIRGL.
> >> >> >> >>  \end{description}
> >> >> >> >>
> >> >> >> >>  \subsection{Device configuration layout}\label{sec:Device
> Types / GPU
> >> >> >> >> Device / Device configuration layout}
> >> >> >> >> @@ -746,7 +748,25 @@ \subsubsection{Device Operation: control=
q
> >> >> >> >> (3d)}\label{sec:Device Types / GPU Dev
> >> >> >> >>
> >> >> >> >>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
> >> >> >> >>    Submit an opaque command stream.  The type of the command
> stream is
> >> >> >> >> -  determined when creating a context.
> >> >> >> >> +  determined when creating a context.  Request data is
> >> >> >> >> +  \field{struct virtio_gpu_cmd_submit}.  The \field{size}
> field describes
> >> >> >> >> +  the size of \field{cmd_data} array in bytes.  The
> \field{num_in_fences}
> >> >> >> >> +  field is active only if VIRTIO_GPU_F_FENCE_PASSING is
> enabled, otherwise
> >> >> >> >> +  \field{num_in_fences} is treated as zero.  The array of
> >> >> >> >> \field{in_fences}
> >> >> >> >> +  IDs is placed in between the \field{num_in_fences} field
> and the
> >> >> >> >> +  \field{cmd_data} array.  The \field{in_fences} array
> contains virtio-gpu
> >> >> >> >> +  \field{fence_id}'s corresponding to the out-fence IDs of a
> previous
> >> >> >> >> +  3d submits.
> >> >> >> >> +
> >> >> >> >> +\begin{lstlisting}
> >> >> >> >> +struct virtio_gpu_cmd_submit {
> >> >> >> >> +        struct virtio_gpu_ctrl_hdr hdr;
> >> >> >> >> +        le32 size;
> >> >> >> >> +        le32 num_in_fences;
> >> >> >> >> +        le64 in_fences[num_in_fences];
> >> >> >> >> +        u32 cmd_data[size/4];
> >> >> >> >> +};
> >> >> >> >> +\end{lstlisting}
> >> >> >> >>
> >> >> >> >
> >> >> >> > Don't you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere too?
> >> >> >>
> >> >> >> We haven't made use of this flag in the experimental/prototype
> version
> >> >> >> that was made for the native contexts. The flag is unused by bot=
h
> Qemu
> >> >> >> and CrosVM.
> >> >> >>
> >> >> >> We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FENCE and
> it's
> >> >> >> deemed to be enough. If the UAPI flag isn't set for a job's
> out-fence,
> >> >> >> then guest uses guest-side synchronization for this fence when
> it's
> >> >> >> passed as in-fence for the further jobs.
> >> >> >>
> >> >> >> The FENCE_SHAREABLE flag isn't needed by nctx/virgl/venus
> protocols. All
> >> >> >> fences are shareable by default. If VMM fails to export fence, i=
t
> is
> >> >> >> treated like fence was already signaled. In case of Venus, it's
> up to
> >> >> >> Venus to decide internally which fences can be made shareable,
> i.e. both
> >> >> >> guest and virglrenderer Venus implementations are responsible fo=
r
> making
> >> >> >> decision whether fence should be made exportable. Venus won't ma=
ke
> >> >> >> out-fence exportable for internal intermediate jobs and will
> encode this
> >> >> >> export-info within the Venus protocol.
> >> >> >>
> >> >> >> Whether FENCE_SHAREABLE virtio-gpu flag will be needed by
> gfxstream is
> >> >> >> questionable. Gfxstream should be similar to Venus, i.e. you
> should be
> >> >> >> able to add flag to the gfxstream. We'll need to be certain that
> the new
> >> >> >> common flag is definitely needed by making use of it before
> specifying
> >> >> >> it in the stable virtio-gpu protocol.
> >> >> >
> >> >> >
> >> >> > I don't think you've gotten fence passing working with display
> integration.  Although passing external fences between two GPU instances
> does happen, the much more common and important case is passing a fence
> from the virtual GPU to virtual display.
> >> >> >
> >> >> > Let me describe the use case for you:
> >> >> >
> >> >> > GPU creates a fence
> >> >> > rutabaga exports fence on creation via
> stream_renderer_export_fence / or virglrenderer_export_fence --> creates
> [fence_id --> descriptor mapping] when FLAG_SHAREABLE is set
> >> >> > SUBMIT_CMD + CROSS_DOMAIN_SEND --> takes the fence_ids and sends =
a
> fence to the compositor
> >> >> >
> >> >> > You also refer to
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#=
note_1996999
> .
> >> >> >
> >> >> > Once you have a working prototype that shares an out_fence with
> the display, then we can talk about whether FLAG_SHAREABLE is needed or
> not.  So I suggest you focus on that before upstreaming uapis + virtio
> protocols.
> >> >> >
> >> >>
> >> >> Why would sharing with display (via a different virtgpu ctx type) b=
e
> >> >> any different than sharing with a different GPU context?  I don't
> >> >> really see a problem here, either the fence fd still exists on the
> >> >> host side, or you know that it is already signaled and you don't ha=
ve
> >> >> to wait on anything.
> >> >
> >> >
> >> > I'm not a huge fan of the fact that the current implementation uses
> EGL to create the pre-signalled fence.  Vulkan ... it could work, but I
> think you'll have to generate some sort of dummy command at startup?
> Shouldn't that be implemented too?
> >> >
> >> > Something should use the new "virgl_renderer_export_signalled_fence"
> API to verify everything works.
> >>
> >> ok, so I gather you are talking about the awkwardness with the wayland
> >> protocol that we can't just pass -1 for a fence?  Rather than say
> >> something using kms.
> >
> >
> > Is there a plan to do a virtio-gpu KMS implementation?  Something like
> RESOURCE_FLUSH (in_fence)?  There are still many virtio-gpu KMS users out
> there.
> >
> >>
> >>
> >> I think this is just an implementation detail.  At any rate, in the
> >> later version of the virglrenderer implementation, which got merged,
> >> there is no dependency on EGL for this.  Only that there was _some_
> >> prior work which created a fence.  Virglrenderer hangs on to a
> >> reference to the last signalled fence until it is replaced with a
> >> newer one.  If a guest fence is created, by definition the host will
> >> have _some_ signaled fence to hand out.
> >
> >
> > The implementation does use a static global table (virgl_fence_table) t=
o
> coordinate between the virgl sync thread and the main thread?  This is
> common in C, but discouraged in Rust (and I do have a use case in mind).
> >
>
> This is fallout of how the virglrenderer API was designed (ie. not
> having a toplevel vgpu instance object).  But this seems pretty off
> topic from the protocol definition.  Maybe we can revisit if there
> ever is a libvirglrenderer2 where we can break API compatibility.
>

Well, at the very least we should pass through the proper information.
FLAG_SHAREABLE is completely costless (DESTROY_FENCE would in theory add
VM-exits).  I think we can pass some sort of shared data structure


>
> > Spec-wise, having FLAG_SHAREABLE + another DESTROY_FENCE api would
> probably be the cleanest since it gives explicit lifetimes.  If there wer=
e
> no performance concerns we would totally do it.
> >
> > The concern is that DESTROY_FENCE causes excessive vm-exits as fences
> are attached to the surface every frame.  So that's how we end up with th=
e
> last signalled fence idea, and somewhat undefined lifetime/ownership
> semantics.
> >
>
> The semantics are in fact well defined, a fence is just an integer in
> the context of a timeline, there is _no_ lifetime/ownership.
>

Interesting, your concerns are not just performance related, but more
philosophical.  Namely:

- What does a "fence_id" refer to?
- What is a fence on the host side?

I think the spec should address these questions.

You can't pass an integer between two GPU HW contexts, or share an integer
with the display.  You can do those things with kernel file descriptors
like sync_file (backed by dma_fence, which is refcounted).

In the past, each fence_id was associated with a glSync object.  It was
deleted after the sync thread was done waiting for it (see
free_fence_locked in vrend_renderer.c).  This meant the host lifetime was
tied to fence signalling.  The guest dma_fence would out-live the host side
glSync object (backed by dma_fence under the hood).  The fence_id wasn't
used by the host after signaling.

Now, we're in the situation where the fence_id on the host side can be used
after it's been signaled, and will be valid so long as the guest dma_fence
is around.  "fence_id" must refer to a shareable host kernel object when
VIRTIO_GPU_F_FENCE_PASSING is set.  Given the new requirements, that's
where the idea behind explicit lifetimes come from.

The last signaled fence is a way to refer to *some* kernel object, after
the original one has already been signaled and destroyed.  Using last
signaled fence rather the original one may create oddities -- for example,
if another process (say Wayland compositor) calls SYNC_IOC_FILE_INFO from
fences received from virtio-gpu, there might be data anomalies (timestamps,
name) compared to if we just passed the original kernel object.

We can probably survive these oddities, but we can probably avoid them too,
so that's why it would be nice for the guest to provide the information it
has.


> > Though, the guest kernel already tracks fence lifetimes through
> dma_fence.  What if we add:
> >
> > - DESTROY_FENCES(fence_ids, num_fences)
> > - a virtio-config ("fence_destroy_threshold"), which controls num_fence=
s
> in DESTROY_FENCES
> >
> > When fence_destroy_threshold =3D=3D 0, this would be the current propos=
ed
> solution (fence lifetimes implementation defined).  However, a user can
> make "fence_destroy_threshold" 100 or something like that, to cause a
> VM-exit everytime 100 fences have been destroyed.
> >
> > This attempts a tunable compromise between API purity and performance
> concerns.  WDYT?
>
> Tbh, I think the current approach is cleaner from the PoV of what a
> fence is.. it is just a seqno, it should not have a lifetime.
>
> BR,
> -R
>
> >
> >>
> >>
> >> But this is all implementation detail
> >>
> >> BR,
> >> -R
> >>
> >> >
> >> > Essentially, let's do our due diligence and verify the most importan=
t
> use case (gpu --> display) actually works.
> >> >
> >> >>
> >> >>
> >> >> BR,
> >> >> -R
> >> >>
> >> >> >> --
> >> >> >> Best regards,
> >> >> >> Dmitry
> >> >> >>
>

--00000000000050e5d30610bf83b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 2, 2024 at 11:40=E2=80=AF=
AM Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">r=
obdclark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Fri, Feb 2, 2024 at 10:16=E2=80=AFAM Gurchetan Singh<b=
r>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Feb 1, 2024 at 11:19=E2=80=AFAM Rob Clark &lt;<a href=3D"mailt=
o:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Feb 1, 2024 at 10:08=E2=80=AFAM Gurchetan Singh<br>
&gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blan=
k">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, Feb 1, 2024 at 9:14=E2=80=AFAM Rob Clark &lt;<a href=
=3D"mailto:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Thu, Feb 1, 2024 at 9:00=E2=80=AFAM Gurchetan Singh<br=
>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=
=3D"_blank">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipe=
nko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_blank">=
dmitry.osipenko@collabora.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; On 1/30/24 04:34, Gurchetan Singh wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dm=
itry Osipenko &lt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; <a href=3D"mailto:dmitry.osipenko@collabora=
.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Document new virtio-gpu protocol fence-=
passing feature that extends 3d<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; submit command with support of in-fence=
s which are passed from guest to<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; host for waiting. This feature allows t=
o offload waiting for in-fences<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; from guest to host, where it can be don=
e more efficiently.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Signed-off-by: Dmitry Osipenko &lt;<a h=
ref=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmitry.osipe=
nko@collabora.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 device-types/gpu/description.tex =
| 22 +++++++++++++++++++++-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 1 file changed, 21 insertions(+),=
 1 deletion(-)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; diff --git a/device-types/gpu/descripti=
on.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; b/device-types/gpu/description.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; index 443524851a05..e5e23b5c9072 100644=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; --- a/device-types/gpu/description.tex<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +++ b/device-types/gpu/description.tex<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; @@ -37,6 +37,8 @@ \subsection{Feature b=
its}\label{sec:Device Types / GPU<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Device / Feature bits}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 resources is supported.<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \item[VIRTIO_GPU_F_CONTEXT_INIT (=
4)] multiple context types and<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 synchronization timelines =
supported.=C2=A0 Requires VIRTIO_GPU_F_VIRGL.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] =
passing fence IDs from guest to host<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 for waiting supported.=C2=A0 Re=
quires VIRTIO_GPU_F_VIRGL.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \end{description}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \subsection{Device configuration =
layout}\label{sec:Device Types / GPU<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Device / Device configuration layout}<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; @@ -746,7 +748,25 @@ \subsubsection{Dev=
ice Operation: controlq<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; (3d)}\label{sec:Device Types / GPU Dev<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \item[VIRTIO_GPU_CMD_SUBMIT_3D]<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 Submit an opaque command s=
tream.=C2=A0 The type of the command stream is<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; -=C2=A0 determined when creating a cont=
ext.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 determined when creating a cont=
ext.=C2=A0 Request data is<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{struct virtio_gpu_cmd_su=
bmit}.=C2=A0 The \field{size} field describes<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 the size of \field{cmd_data} ar=
ray in bytes.=C2=A0 The \field{num_in_fences}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 field is active only if VIRTIO_=
GPU_F_FENCE_PASSING is enabled, otherwise<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{num_in_fences} is treate=
d as zero.=C2=A0 The array of<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; \field{in_fences}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 IDs is placed in between the \f=
ield{num_in_fences} field and the<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{cmd_data} array.=C2=A0 T=
he \field{in_fences} array contains virtio-gpu<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{fence_id}&#39;s correspo=
nding to the out-fence IDs of a previous<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 3d submits.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +\begin{lstlisting}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +struct virtio_gpu_cmd_submit {<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vir=
tio_gpu_ctrl_hdr hdr;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 size;=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le32 num_i=
n_fences;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 le64 in_fe=
nces[num_in_fences];<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 cmd_da=
ta[size/4];<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +\end{lstlisting}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Don&#39;t you need VIRTIO_GPU_FLAG_FENCE_SH=
AREABLE somewhere too?<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; We haven&#39;t made use of this flag in the expe=
rimental/prototype version<br>
&gt;&gt; &gt;&gt; &gt;&gt; that was made for the native contexts. The flag =
is unused by both Qemu<br>
&gt;&gt; &gt;&gt; &gt;&gt; and CrosVM.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; We added Linux kernel UAPI flag VIRTGPU_EXECBUF_=
SHARED_FENCE and it&#39;s<br>
&gt;&gt; &gt;&gt; &gt;&gt; deemed to be enough. If the UAPI flag isn&#39;t =
set for a job&#39;s out-fence,<br>
&gt;&gt; &gt;&gt; &gt;&gt; then guest uses guest-side synchronization for t=
his fence when it&#39;s<br>
&gt;&gt; &gt;&gt; &gt;&gt; passed as in-fence for the further jobs.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The FENCE_SHAREABLE flag isn&#39;t needed by nct=
x/virgl/venus protocols. All<br>
&gt;&gt; &gt;&gt; &gt;&gt; fences are shareable by default. If VMM fails to=
 export fence, it is<br>
&gt;&gt; &gt;&gt; &gt;&gt; treated like fence was already signaled. In case=
 of Venus, it&#39;s up to<br>
&gt;&gt; &gt;&gt; &gt;&gt; Venus to decide internally which fences can be m=
ade shareable, i.e. both<br>
&gt;&gt; &gt;&gt; &gt;&gt; guest and virglrenderer Venus implementations ar=
e responsible for making<br>
&gt;&gt; &gt;&gt; &gt;&gt; decision whether fence should be made exportable=
. Venus won&#39;t make<br>
&gt;&gt; &gt;&gt; &gt;&gt; out-fence exportable for internal intermediate j=
obs and will encode this<br>
&gt;&gt; &gt;&gt; &gt;&gt; export-info within the Venus protocol.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Whether FENCE_SHAREABLE virtio-gpu flag will be =
needed by gfxstream is<br>
&gt;&gt; &gt;&gt; &gt;&gt; questionable. Gfxstream should be similar to Ven=
us, i.e. you should be<br>
&gt;&gt; &gt;&gt; &gt;&gt; able to add flag to the gfxstream. We&#39;ll nee=
d to be certain that the new<br>
&gt;&gt; &gt;&gt; &gt;&gt; common flag is definitely needed by making use o=
f it before specifying<br>
&gt;&gt; &gt;&gt; &gt;&gt; it in the stable virtio-gpu protocol.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I don&#39;t think you&#39;ve gotten fence passing wo=
rking with display integration.=C2=A0 Although passing external fences betw=
een two GPU instances does happen, the much more common and important case =
is passing a fence from the virtual GPU to virtual display.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Let me describe the use case for you:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; GPU creates a fence<br>
&gt;&gt; &gt;&gt; &gt; rutabaga exports fence on creation via stream_render=
er_export_fence / or virglrenderer_export_fence --&gt; creates [fence_id --=
&gt; descriptor mapping] when FLAG_SHAREABLE is set<br>
&gt;&gt; &gt;&gt; &gt; SUBMIT_CMD + CROSS_DOMAIN_SEND --&gt; takes the fenc=
e_ids and sends a fence to the compositor<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; You also refer to <a href=3D"https://gitlab.freedesk=
top.org/virgl/virglrenderer/-/merge_requests/1138#note_1996999" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/virgl/virglrendere=
r/-/merge_requests/1138#note_1996999</a>.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Once you have a working prototype that shares an out=
_fence with the display, then we can talk about whether FLAG_SHAREABLE is n=
eeded or not.=C2=A0 So I suggest you focus on that before upstreaming uapis=
 + virtio protocols.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Why would sharing with display (via a different virtgpu c=
tx type) be<br>
&gt;&gt; &gt;&gt; any different than sharing with a different GPU context?=
=C2=A0 I don&#39;t<br>
&gt;&gt; &gt;&gt; really see a problem here, either the fence fd still exis=
ts on the<br>
&gt;&gt; &gt;&gt; host side, or you know that it is already signaled and yo=
u don&#39;t have<br>
&gt;&gt; &gt;&gt; to wait on anything.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m not a huge fan of the fact that the current implement=
ation uses EGL to create the pre-signalled fence.=C2=A0 Vulkan ... it could=
 work, but I think you&#39;ll have to generate some sort of dummy command a=
t startup?=C2=A0 Shouldn&#39;t that be implemented too?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Something should use the new &quot;virgl_renderer_export_sign=
alled_fence&quot; API to verify everything works.<br>
&gt;&gt;<br>
&gt;&gt; ok, so I gather you are talking about the awkwardness with the way=
land<br>
&gt;&gt; protocol that we can&#39;t just pass -1 for a fence?=C2=A0 Rather =
than say<br>
&gt;&gt; something using kms.<br>
&gt;<br>
&gt;<br>
&gt; Is there a plan to do a virtio-gpu KMS implementation?=C2=A0 Something=
 like RESOURCE_FLUSH (in_fence)?=C2=A0 There are still many virtio-gpu KMS =
users out there.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I think this is just an implementation detail.=C2=A0 At any rate, =
in the<br>
&gt;&gt; later version of the virglrenderer implementation, which got merge=
d,<br>
&gt;&gt; there is no dependency on EGL for this.=C2=A0 Only that there was =
_some_<br>
&gt;&gt; prior work which created a fence.=C2=A0 Virglrenderer hangs on to =
a<br>
&gt;&gt; reference to the last signalled fence until it is replaced with a<=
br>
&gt;&gt; newer one.=C2=A0 If a guest fence is created, by definition the ho=
st will<br>
&gt;&gt; have _some_ signaled fence to hand out.<br>
&gt;<br>
&gt;<br>
&gt; The implementation does use a static global table (virgl_fence_table) =
to coordinate between the virgl sync thread and the main thread?=C2=A0 This=
 is common in C, but discouraged in Rust (and I do have a use case in mind)=
.<br>
&gt;<br>
<br>
This is fallout of how the virglrenderer API was designed (ie. not<br>
having a toplevel vgpu instance object).=C2=A0 But this seems pretty off<br=
>
topic from the protocol definition.=C2=A0 Maybe we can revisit if there<br>
ever is a libvirglrenderer2 where we can break API compatibility.<br></bloc=
kquote><div><br></div><div>Well, at the very least we should pass through t=
he proper information.=C2=A0 FLAG_SHAREABLE is completely costless (DESTROY=
_FENCE would in theory add VM-exits).=C2=A0 I think we can pass some sort o=
f shared data structure</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; Spec-wise, having FLAG_SHAREABLE + another DESTROY_FENCE api would pro=
bably be the cleanest since it gives explicit lifetimes.=C2=A0 If there wer=
e no performance concerns we would totally do it.<br>
&gt;<br>
&gt; The concern is that DESTROY_FENCE causes excessive vm-exits as fences =
are attached to the surface every frame.=C2=A0 So that&#39;s how we end up =
with the last signalled fence idea, and somewhat undefined lifetime/ownersh=
ip semantics.<br>
&gt;<br>
<br>
The semantics are in fact well defined, a fence is just an integer in<br>
the context of a timeline, there is _no_ lifetime/ownership.<br></blockquot=
e><div><br></div><div>Interesting, your concerns are not just performance r=
elated, but more philosophical.=C2=A0 Namely:</div><div><br></div><div>- Wh=
at does a &quot;fence_id&quot; refer to?</div><div>- What is a fence on the=
 host side?</div><div><br></div><div>I think the spec should address these =
questions.</div><div><br></div><div>You can&#39;t pass an integer between t=
wo GPU HW contexts, or share an integer with the display.=C2=A0 You can do =
those things with kernel file descriptors like sync_file (backed by dma_fen=
ce, which is refcounted).</div><div><br></div><div>In the past, each fence_=
id was associated with a glSync object.=C2=A0 It was deleted after the sync=
 thread was done waiting for it (see free_fence_locked in vrend_renderer.c)=
.=C2=A0 This meant the host lifetime was tied to fence signalling.=C2=A0 Th=
e guest dma_fence would out-live the host side glSync object (backed by dma=
_fence under the hood).=C2=A0 The fence_id wasn&#39;t used by the host afte=
r signaling.</div><div><br></div><div>Now, we&#39;re in the situation where=
 the fence_id on the host side can be used after it&#39;s been signaled, an=
d will be valid so long as the guest dma_fence is around.=C2=A0 &quot;fence=
_id&quot; must refer to a shareable host kernel object when VIRTIO_GPU_F_FE=
NCE_PASSING is set.=C2=A0 Given the new requirements, that&#39;s where the =
idea behind explicit lifetimes come from.=C2=A0</div><div><br></div><div>Th=
e last signaled fence is a way to refer to *some* kernel object, after the =
original one has already been signaled and destroyed.=C2=A0 Using last sign=
aled fence rather the original one may create oddities -- for example, if a=
nother process (say Wayland compositor) calls SYNC_IOC_FILE_INFO from fence=
s received from virtio-gpu, there might be data anomalies (timestamps, name=
) compared to if we just passed the original kernel object.=C2=A0</div><div=
><br></div><div>We can probably survive these oddities, but we can probably=
 avoid them too, so that&#39;s why it would be nice for the guest to provid=
e the information it has.=C2=A0<br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; Though, the guest kernel already tracks fence lifetimes through dma_fe=
nce.=C2=A0 What if we add:<br>
&gt;<br>
&gt; - DESTROY_FENCES(fence_ids, num_fences)<br>
&gt; - a virtio-config (&quot;fence_destroy_threshold&quot;), which control=
s num_fences in DESTROY_FENCES<br>
&gt;<br>
&gt; When fence_destroy_threshold =3D=3D 0, this would be the current propo=
sed solution (fence lifetimes implementation defined).=C2=A0 However, a use=
r can make &quot;fence_destroy_threshold&quot; 100 or something like that, =
to cause a VM-exit everytime 100 fences have been destroyed.<br>
&gt;<br>
&gt; This attempts a tunable compromise between API purity and performance =
concerns.=C2=A0 WDYT?<br>
<br>
Tbh, I think the current approach is cleaner from the PoV of what a<br>
fence is.. it is just a seqno, it should not have a lifetime.<br>
<br>
BR,<br>
-R<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; But this is all implementation detail<br>
&gt;&gt;<br>
&gt;&gt; BR,<br>
&gt;&gt; -R<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Essentially, let&#39;s do our due diligence and verify the mo=
st important use case (gpu --&gt; display) actually works.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; Best regards,<br>
&gt;&gt; &gt;&gt; &gt;&gt; Dmitry<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
</blockquote></div></div>

--00000000000050e5d30610bf83b7--
