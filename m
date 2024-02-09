Return-Path: <virtio-comment-return-9099-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0FEC4828F
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 18:03:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DE6E32AC4C
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 18:02:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C01FC98692D
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 18:02:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A277B986923; Fri,  9 Feb 2024 18:02:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85A68986924
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Feb 2024 18:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501775; x=1708106575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBhZYnq81W8oYbdvpNWomP2ct7B1MGUR24IIfU+Af5s=;
        b=OS7pd5xQnw18XfCXknsQRCd2Js46d5pT8LifqmiwEIZ9q4jT5qwYxMOxpdypkO66sV
         8t+NS0eokuD96/lc0NXtzmOYRgCOjBe9YuBMq/mIaI6iBJRGPrD/++7HQOTi7keVgsur
         xdUFsTHvAPywYNA8PEQhqudQ2y77kSpGLJ+remHct+dQkCgK82KJw0hvaXrt4bjEKuNz
         rcdth2iXIK0qTvD/22iM3N3Fg1vbXpwci8FN6heM8vQSenYMpgRyYkX44/LIOmjD9BcZ
         UIi1yasDpWiXW0uzVmqFCPxuTEfcPhB9FP/NznECWyyaIx6Z3B7uvVLCJRVLRB4tK9mv
         Dnyw==
X-Forwarded-Encrypted: i=1; AJvYcCVKObYTaatLtAzDWC6wk6TIcrYOAlvI7RV91e4CZAY5Cl/Z6/clA9QAsYv1ebUIzWn0xHpa1toiJMGkZax77n2qpyoOmJX2Fgxo09xP2UYJ7X9rLw==
X-Gm-Message-State: AOJu0Yyutj5JcgHLgM7BipO2nQDm/Y+lP34H8yJpc2gcB3shU6V2IGC2
	tA4E3gcL0Ty+Lrf58PYzCZYaJXEu+sfSUOtnHl288p2MIvxRQAzrHvFnOPF3nE9G4tPDwQPzhMB
	Wcg==
X-Google-Smtp-Source: AGHT+IFKMQmON1I7Y322LMikh4xqKKZiZQuTspBARQ+EA6/hc1HxAqVW3ctcPfT/IOQvTsZzjLIiTA==
X-Received: by 2002:aa7:c6d8:0:b0:560:3bcc:a5c0 with SMTP id b24-20020aa7c6d8000000b005603bcca5c0mr2001523eds.4.1707501775384;
        Fri, 09 Feb 2024 10:02:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOokNYxgWnFNiuVcd9INvUacFd2A9udUAtt5NcKjt87eR7X9NiKWumaCHlKnD+BXfmw0PF5cv/tGtfDJ2UqJd9+oteS9cZof/5l1e3SXnsUrVeBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk2tPYzVdyLpiwAo84b/PKvPN6M1XOpayQzUzDPQ2b6rjaHfLtTEMdXTeecTU9u9Ob/ybCaq4QesuaHHwHBScXLNLfo3fK0eXRGlc8F16RJqgPZQ==
X-Received: by 2002:a50:cd59:0:b0:560:ea86:4d28 with SMTP id
 d25-20020a50cd59000000b00560ea864d28mr174215edj.4.1707501774442; Fri, 09 Feb
 2024 10:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
 <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
 <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com> <CAAfnVBnGCP2m2WoXY=NKAQ4vQncB19c4YVMrC51r5KdsSq7uxQ@mail.gmail.com>
 <CAF6AEGtSGULUVVZ-45sdhUpffsqi7yM15aHSyPSt9=TMr8iEHw@mail.gmail.com>
 <CAAfnVBn-8a1kKe9M3RN75D9q9rdzep-=-7ixspmDDJu-Wz4C_Q@mail.gmail.com>
 <CAF6AEGuQD-zuHjkjeBEuteyvQE33pGeF0XPDjGDZrZBrr=tNJg@mail.gmail.com>
 <CAAfnVBmasMmXRcNnxG3J_8bg8w-Bq3yKZ66sLKxv+Q3gbbgr3g@mail.gmail.com>
 <CAF6AEGtmfFuh0iZpnzm9wbROeCcGx5hGU-BnnJKMcj0awhcZFQ@mail.gmail.com>
 <CAAfnVBnb9RcpCX03trdfxOTehUioCOXAkNfuW=5vS26qt_YSdQ@mail.gmail.com> <CAF6AEGu4tE5AoE9tjhbPYg94fyEyOLQAHhtsBK-DvC2ULRkgzQ@mail.gmail.com>
In-Reply-To: <CAF6AEGu4tE5AoE9tjhbPYg94fyEyOLQAHhtsBK-DvC2ULRkgzQ@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 9 Feb 2024 10:02:40 -0800
X-Gmail-Original-Message-ID: <CAAfnVBkb_xaRcAa9bwiW9GUEiqxQ=UGnW42T5s1JquX4Xw1YwQ@mail.gmail.com>
Message-ID: <CAAfnVBkb_xaRcAa9bwiW9GUEiqxQ=UGnW42T5s1JquX4Xw1YwQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Yiwei Zhang <zzyiwei@chromium.org>, 
	Ryan Neph <ryanneph@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>, Huang Rui <ray.huang@amd.com>, 
	Sergio Lopez <slp@redhat.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000b894140610f6bc8a"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--000000000000b894140610f6bc8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 8:55=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:

> On Tue, Feb 6, 2024 at 4:09=E2=80=AFPM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> > On Fri, Feb 2, 2024 at 11:40=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Fri, Feb 2, 2024 at 10:16=E2=80=AFAM Gurchetan Singh
> >> <gurchetansingh@chromium.org> wrote:
> >> >
> >> >
> >> >
> >> > On Thu, Feb 1, 2024 at 11:19=E2=80=AFAM Rob Clark <robdclark@gmail.c=
om>
> wrote:
> >> >>
> >> >> On Thu, Feb 1, 2024 at 10:08=E2=80=AFAM Gurchetan Singh
> >> >> <gurchetansingh@chromium.org> wrote:
> >> >> >
> >> >> >
> >> >> >
> >> >> > On Thu, Feb 1, 2024 at 9:14=E2=80=AFAM Rob Clark <robdclark@gmail=
.com>
> wrote:
> >> >> >>
> >> >> >> On Thu, Feb 1, 2024 at 9:00=E2=80=AFAM Gurchetan Singh
> >> >> >> <gurchetansingh@chromium.org> wrote:
> >> >> >> >
> >> >> >> >
> >> >> >> >
> >> >> >> >
> >> >> >> > On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
> >> >> >> >>
> >> >> >> >> On 1/30/24 04:34, Gurchetan Singh wrote:
> >> >> >> >> > On Sun, Jan 28, 2024 at 11:12=E2=80=AFAM Dmitry Osipenko <
> >> >> >> >> > dmitry.osipenko@collabora.com> wrote:
> >> >> >> >> >
> >> >> >> >> >> Document new virtio-gpu protocol fence-passing feature tha=
t
> extends 3d
> >> >> >> >> >> submit command with support of in-fences which are passed
> from guest to
> >> >> >> >> >> host for waiting. This feature allows to offload waiting
> for in-fences
> >> >> >> >> >> from guest to host, where it can be done more efficiently.
> >> >> >> >> >>
> >> >> >> >> >> Signed-off-by: Dmitry Osipenko <
> dmitry.osipenko@collabora.com>
> >> >> >> >> >> ---
> >> >> >> >> >>  device-types/gpu/description.tex | 22
> +++++++++++++++++++++-
> >> >> >> >> >>  1 file changed, 21 insertions(+), 1 deletion(-)
> >> >> >> >> >>
> >> >> >> >> >> diff --git a/device-types/gpu/description.tex
> >> >> >> >> >> b/device-types/gpu/description.tex
> >> >> >> >> >> index 443524851a05..e5e23b5c9072 100644
> >> >> >> >> >> --- a/device-types/gpu/description.tex
> >> >> >> >> >> +++ b/device-types/gpu/description.tex
> >> >> >> >> >> @@ -37,6 +37,8 @@ \subsection{Feature
> bits}\label{sec:Device Types / GPU
> >> >> >> >> >> Device / Feature bits}
> >> >> >> >> >>    resources is supported.
> >> >> >> >> >>  \item[VIRTIO_GPU_F_CONTEXT_INIT (4)] multiple context
> types and
> >> >> >> >> >>    synchronization timelines supported.  Requires
> VIRTIO_GPU_F_VIRGL.
> >> >> >> >> >> +\item[VIRTIO_GPU_F_FENCE_PASSING (5)] passing fence IDs
> from guest to host
> >> >> >> >> >> +  for waiting supported.  Requires VIRTIO_GPU_F_VIRGL.
> >> >> >> >> >>  \end{description}
> >> >> >> >> >>
> >> >> >> >> >>  \subsection{Device configuration layout}\label{sec:Device
> Types / GPU
> >> >> >> >> >> Device / Device configuration layout}
> >> >> >> >> >> @@ -746,7 +748,25 @@ \subsubsection{Device Operation:
> controlq
> >> >> >> >> >> (3d)}\label{sec:Device Types / GPU Dev
> >> >> >> >> >>
> >> >> >> >> >>  \item[VIRTIO_GPU_CMD_SUBMIT_3D]
> >> >> >> >> >>    Submit an opaque command stream.  The type of the
> command stream is
> >> >> >> >> >> -  determined when creating a context.
> >> >> >> >> >> +  determined when creating a context.  Request data is
> >> >> >> >> >> +  \field{struct virtio_gpu_cmd_submit}.  The \field{size}
> field describes
> >> >> >> >> >> +  the size of \field{cmd_data} array in bytes.  The
> \field{num_in_fences}
> >> >> >> >> >> +  field is active only if VIRTIO_GPU_F_FENCE_PASSING is
> enabled, otherwise
> >> >> >> >> >> +  \field{num_in_fences} is treated as zero.  The array of
> >> >> >> >> >> \field{in_fences}
> >> >> >> >> >> +  IDs is placed in between the \field{num_in_fences} fiel=
d
> and the
> >> >> >> >> >> +  \field{cmd_data} array.  The \field{in_fences} array
> contains virtio-gpu
> >> >> >> >> >> +  \field{fence_id}'s corresponding to the out-fence IDs o=
f
> a previous
> >> >> >> >> >> +  3d submits.
> >> >> >> >> >> +
> >> >> >> >> >> +\begin{lstlisting}
> >> >> >> >> >> +struct virtio_gpu_cmd_submit {
> >> >> >> >> >> +        struct virtio_gpu_ctrl_hdr hdr;
> >> >> >> >> >> +        le32 size;
> >> >> >> >> >> +        le32 num_in_fences;
> >> >> >> >> >> +        le64 in_fences[num_in_fences];
> >> >> >> >> >> +        u32 cmd_data[size/4];
> >> >> >> >> >> +};
> >> >> >> >> >> +\end{lstlisting}
> >> >> >> >> >>
> >> >> >> >> >
> >> >> >> >> > Don't you need VIRTIO_GPU_FLAG_FENCE_SHAREABLE somewhere to=
o?
> >> >> >> >>
> >> >> >> >> We haven't made use of this flag in the experimental/prototyp=
e
> version
> >> >> >> >> that was made for the native contexts. The flag is unused by
> both Qemu
> >> >> >> >> and CrosVM.
> >> >> >> >>
> >> >> >> >> We added Linux kernel UAPI flag VIRTGPU_EXECBUF_SHARED_FENCE
> and it's
> >> >> >> >> deemed to be enough. If the UAPI flag isn't set for a job's
> out-fence,
> >> >> >> >> then guest uses guest-side synchronization for this fence whe=
n
> it's
> >> >> >> >> passed as in-fence for the further jobs.
> >> >> >> >>
> >> >> >> >> The FENCE_SHAREABLE flag isn't needed by nctx/virgl/venus
> protocols. All
> >> >> >> >> fences are shareable by default. If VMM fails to export fence=
,
> it is
> >> >> >> >> treated like fence was already signaled. In case of Venus,
> it's up to
> >> >> >> >> Venus to decide internally which fences can be made shareable=
,
> i.e. both
> >> >> >> >> guest and virglrenderer Venus implementations are responsible
> for making
> >> >> >> >> decision whether fence should be made exportable. Venus won't
> make
> >> >> >> >> out-fence exportable for internal intermediate jobs and will
> encode this
> >> >> >> >> export-info within the Venus protocol.
> >> >> >> >>
> >> >> >> >> Whether FENCE_SHAREABLE virtio-gpu flag will be needed by
> gfxstream is
> >> >> >> >> questionable. Gfxstream should be similar to Venus, i.e. you
> should be
> >> >> >> >> able to add flag to the gfxstream. We'll need to be certain
> that the new
> >> >> >> >> common flag is definitely needed by making use of it before
> specifying
> >> >> >> >> it in the stable virtio-gpu protocol.
> >> >> >> >
> >> >> >> >
> >> >> >> > I don't think you've gotten fence passing working with display
> integration.  Although passing external fences between two GPU instances
> does happen, the much more common and important case is passing a fence
> from the virtual GPU to virtual display.
> >> >> >> >
> >> >> >> > Let me describe the use case for you:
> >> >> >> >
> >> >> >> > GPU creates a fence
> >> >> >> > rutabaga exports fence on creation via
> stream_renderer_export_fence / or virglrenderer_export_fence --> creates
> [fence_id --> descriptor mapping] when FLAG_SHAREABLE is set
> >> >> >> > SUBMIT_CMD + CROSS_DOMAIN_SEND --> takes the fence_ids and
> sends a fence to the compositor
> >> >> >> >
> >> >> >> > You also refer to
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#=
note_1996999
> .
> >> >> >> >
> >> >> >> > Once you have a working prototype that shares an out_fence wit=
h
> the display, then we can talk about whether FLAG_SHAREABLE is needed or
> not.  So I suggest you focus on that before upstreaming uapis + virtio
> protocols.
> >> >> >> >
> >> >> >>
> >> >> >> Why would sharing with display (via a different virtgpu ctx type=
)
> be
> >> >> >> any different than sharing with a different GPU context?  I don'=
t
> >> >> >> really see a problem here, either the fence fd still exists on t=
he
> >> >> >> host side, or you know that it is already signaled and you don't
> have
> >> >> >> to wait on anything.
> >> >> >
> >> >> >
> >> >> > I'm not a huge fan of the fact that the current implementation
> uses EGL to create the pre-signalled fence.  Vulkan ... it could work, bu=
t
> I think you'll have to generate some sort of dummy command at startup?
> Shouldn't that be implemented too?
> >> >> >
> >> >> > Something should use the new
> "virgl_renderer_export_signalled_fence" API to verify everything works.
> >> >>
> >> >> ok, so I gather you are talking about the awkwardness with the
> wayland
> >> >> protocol that we can't just pass -1 for a fence?  Rather than say
> >> >> something using kms.
> >> >
> >> >
> >> > Is there a plan to do a virtio-gpu KMS implementation?  Something
> like RESOURCE_FLUSH (in_fence)?  There are still many virtio-gpu KMS user=
s
> out there.
> >> >
> >> >>
> >> >>
> >> >> I think this is just an implementation detail.  At any rate, in the
> >> >> later version of the virglrenderer implementation, which got merged=
,
> >> >> there is no dependency on EGL for this.  Only that there was _some_
> >> >> prior work which created a fence.  Virglrenderer hangs on to a
> >> >> reference to the last signalled fence until it is replaced with a
> >> >> newer one.  If a guest fence is created, by definition the host wil=
l
> >> >> have _some_ signaled fence to hand out.
> >> >
> >> >
> >> > The implementation does use a static global table (virgl_fence_table=
)
> to coordinate between the virgl sync thread and the main thread?  This is
> common in C, but discouraged in Rust (and I do have a use case in mind).
> >> >
> >>
> >> This is fallout of how the virglrenderer API was designed (ie. not
> >> having a toplevel vgpu instance object).  But this seems pretty off
> >> topic from the protocol definition.  Maybe we can revisit if there
> >> ever is a libvirglrenderer2 where we can break API compatibility.
> >
> >
> > Well, at the very least we should pass through the proper information.
> FLAG_SHAREABLE is completely costless (DESTROY_FENCE would in theory add
> VM-exits).  I think we can pass some sort of shared data structure
> >
>
> costless or not, it is _useless_... I don't really see a good way to
> not just set FLAG_SHAREABLE on everything, and it kinda works against
> the guest kernel view of things... ie if you have a guest dma_fence,
> of course it is shareable.  That is why it exists in the first place.
> But it is designed to be cheap.
>

The definition of FLAG_SHAREABLE would be something like:

"This fence is shareable across host 3D contexts and subsystems (including
other virtio-devices)"

- For fences that will be shared with the host display, gfxstream guest
will set flag VIRTGPU_EXECBUF_SHARED_FENCE
- For CPU fences or when a display not capable of fencing sharing,
VIRTGPU_EXECBUF_SHARED_FENCE will not be set
- That would turn into FLAG_SHAREABLE on host: rutabaga_gfx will call
stream_renderer_export_fence to take ownership of the fence
- When KMS issues RESOURCE_FLUSH(fence_id), rutabaga_export_fence will
transfer ownership to the display
- After it's sent to Wayland, the fence may be closed

This flow has no mention of the last signaled fence, since
gfxstream/rutabaga_gfx can avoid this by clearer ownership semantics.

There does exist a theoretical case where the same fence is shared between
two different contexts, but I believe that may actually not happen in
practice yet.  The last signalled fence trick would fail on that
theoretical case too.

So with FLAG_SHAREABLE, I think we can:

- Avoid the last signalled fence trick (though virglrenderer may still
chose to use it) and associated oddities
- Make the fence transient, as you desire

Since VIRTGPU_EXECBUF_SHARED_FENCE already exists, adding FLAG_SHAREABLE on
the virtio side would be very trivial.


> >>
> >>
> >> > Spec-wise, having FLAG_SHAREABLE + another DESTROY_FENCE api would
> probably be the cleanest since it gives explicit lifetimes.  If there wer=
e
> no performance concerns we would totally do it.
> >> >
> >> > The concern is that DESTROY_FENCE causes excessive vm-exits as fence=
s
> are attached to the surface every frame.  So that's how we end up with th=
e
> last signalled fence idea, and somewhat undefined lifetime/ownership
> semantics.
> >> >
> >>
> >> The semantics are in fact well defined, a fence is just an integer in
> >> the context of a timeline, there is _no_ lifetime/ownership.
> >
> >
> > Interesting, your concerns are not just performance related, but more
> philosophical.  Namely:
> >
> > - What does a "fence_id" refer to?
> > - What is a fence on the host side?
> >
> > I think the spec should address these questions.
> >
> > You can't pass an integer between two GPU HW contexts, or share an
> integer with the display.  You can do those things with kernel file
> descriptors like sync_file (backed by dma_fence, which is refcounted).
> >
>
> I may have over-simplified things slightly in earlier replies.  It is
> not a single integer but a pair of integers, ie. the fence seqno and
> the timeline id.. but that doesn't really change anything from a
> lifetime standpoint.
>
> > In the past, each fence_id was associated with a glSync object.  It was
> deleted after the sync thread was done waiting for it (see
> free_fence_locked in vrend_renderer.c).  This meant the host lifetime was
> tied to fence signalling.  The guest dma_fence would out-live the host si=
de
> glSync object (backed by dma_fence under the hood).  The fence_id wasn't
> used by the host after signaling.
> >
> > Now, we're in the situation where the fence_id on the host side can be
> used after it's been signaled, and will be valid so long as the guest
> dma_fence is around.  "fence_id" must refer to a shareable host kernel
> object when VIRTIO_GPU_F_FENCE_PASSING is set.  Given the new requirement=
s,
> that's where the idea behind explicit lifetimes come from.
> >
> > The last signaled fence is a way to refer to *some* kernel object, afte=
r
> the original one has already been signaled and destroyed.  Using last
> signaled fence rather the original one may create oddities -- for example=
,
> if another process (say Wayland compositor) calls SYNC_IOC_FILE_INFO from
> fences received from virtio-gpu, there might be data anomalies (timestamp=
s,
> name) compared to if we just passed the original kernel object.
> >
>
> I mean, we are bending over backwards for one specific case that we
> should maybe solve more directly (by amending the wayland protocol, or
> changing how guest/host wayland proxy works)
>
> A fence is meant to be lightweight and transient.  It is a thing
> frequently created, and short lived.  We don't want to have guest
> interaction in order to destroy a host dma_fence, in fact ideally we
> want to minimize host depending on guest releasing transient
> resources, in order to avoid deadlock.. ie. only the host kernel
> cannot be preempted by page faults because all of the host kernel
> memory is pinned.  If the host kernel relies on the guest kernel to
> release transient resources, that is a priority inversion which can
> lead to deadlock in shrinker/reclaim.
>

The host kernel shouldn't depend on any userspace for memory
management/priority decisions.  The virtio-gpu process in QEMU/crosvm is
a user-space process, and can be compromised irrespective of
DESTROY_FENCES.  I don't think DESTROY_FENCES would add to any attack
surface.

Though, I hear you on your desire for a transient/lightweight fence.  I
just think you can accomplish this by being more explicit on how the fence
moves at the spec level.

For example, say one day we want to share the GPU fence with virtio-video,
and wait on the host side before passing to host V4L2.  We'll need
something like virtio-dmabuf [1] and the acknowledgement "fence_id" is not
just a {seqno, timeline}, but an unique identifier for a host-side sync
file.  Then we can say -- at the spec level -- virtio-video takes ownership
of the sync file and has responsibility for closing it.

This is both transient and more correct than just giving out the last
signaled fence.

However, this would take new v4l2 ioctls that take in an in-fence for the
virtio-video case, and hence I propose DESTROY_FENCES as a tunable fallback
if we can't make that happen everywhere.  But in the ideal world, yes, the
fence would be transient.

So in summary with my review comments:
    - Can we get a FLAG_SHAREABLE in v2?
    - Can we get a RESOURCE_FLUSH(in_fence) for KMS integration in v2?
    - Regarding transiency:
           - Good idea, but can we add it to the spec level rather than
being implementation defined?
           - For it to be transient everywhere, we'll need even
virtio-video to take an in-fence at-least?
           - I recommend more research on the transient subject, it *could*
work

[1] https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg00595.html


> The last_signaled_fence may be a workaround that leads to weird edge
> cases.. but over-complicating transient resource lifetime in the
> protocol is not the answer.
>
> BR,
> -R
>
> > We can probably survive these oddities, but we can probably avoid them
> too, so that's why it would be nice for the guest to provide the
> information it has.
> >
> >>
> >> > Though, the guest kernel already tracks fence lifetimes through
> dma_fence.  What if we add:
> >> >
> >> > - DESTROY_FENCES(fence_ids, num_fences)
> >> > - a virtio-config ("fence_destroy_threshold"), which controls
> num_fences in DESTROY_FENCES
> >> >
> >> > When fence_destroy_threshold =3D=3D 0, this would be the current pro=
posed
> solution (fence lifetimes implementation defined).  However, a user can
> make "fence_destroy_threshold" 100 or something like that, to cause a
> VM-exit everytime 100 fences have been destroyed.
> >> >
> >> > This attempts a tunable compromise between API purity and performanc=
e
> concerns.  WDYT?
> >>
> >> Tbh, I think the current approach is cleaner from the PoV of what a
> >> fence is.. it is just a seqno, it should not have a lifetime.
> >>
> >> BR,
> >> -R
> >>
> >> >
> >> >>
> >> >>
> >> >> But this is all implementation detail
> >> >>
> >> >> BR,
> >> >> -R
> >> >>
> >> >> >
> >> >> > Essentially, let's do our due diligence and verify the most
> important use case (gpu --> display) actually works.
> >> >> >
> >> >> >>
> >> >> >>
> >> >> >> BR,
> >> >> >> -R
> >> >> >>
> >> >> >> >> --
> >> >> >> >> Best regards,
> >> >> >> >> Dmitry
> >> >> >> >>
>

--000000000000b894140610f6bc8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 6, 2024 at 8:55=E2=80=AFP=
M Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">ro=
bdclark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Tue, Feb 6, 2024 at 4:09=E2=80=AFPM Gurchetan Singh<br>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Feb 2, 2024 at 11:40=E2=80=AFAM Rob Clark &lt;<a href=3D"mailt=
o:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Feb 2, 2024 at 10:16=E2=80=AFAM Gurchetan Singh<br>
&gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blan=
k">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, Feb 1, 2024 at 11:19=E2=80=AFAM Rob Clark &lt;<a href=
=3D"mailto:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Thu, Feb 1, 2024 at 10:08=E2=80=AFAM Gurchetan Singh<b=
r>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=
=3D"_blank">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Thu, Feb 1, 2024 at 9:14=E2=80=AFAM Rob Clark &lt=
;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; On Thu, Feb 1, 2024 at 9:00=E2=80=AFAM Gurchetan=
 Singh<br>
&gt;&gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.or=
g" target=3D"_blank">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; On Mon, Jan 29, 2024 at 9:21=E2=80=AFPM Dmi=
try Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D=
"_blank">dmitry.osipenko@collabora.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; On 1/30/24 04:34, Gurchetan Singh wrote=
:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; On Sun, Jan 28, 2024 at 11:12=E2=
=80=AFAM Dmitry Osipenko &lt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; <a href=3D"mailto:dmitry.osipenko@=
collabora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Document new virtio-gpu protoc=
ol fence-passing feature that extends 3d<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; submit command with support of=
 in-fences which are passed from guest to<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; host for waiting. This feature=
 allows to offload waiting for in-fences<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; from guest to host, where it c=
an be done more efficiently.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Signed-off-by: Dmitry Osipenko=
 &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com" target=3D"_blank">dmi=
try.osipenko@collabora.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 device-types/gpu/descrip=
tion.tex | 22 +++++++++++++++++++++-<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 1 file changed, 21 inser=
tions(+), 1 deletion(-)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; diff --git a/device-types/gpu/=
description.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; b/device-types/gpu/description=
.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; index 443524851a05..e5e23b5c90=
72 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; --- a/device-types/gpu/descrip=
tion.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +++ b/device-types/gpu/descrip=
tion.tex<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; @@ -37,6 +37,8 @@ \subsection{=
Feature bits}\label{sec:Device Types / GPU<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Device / Feature bits}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 resources is supp=
orted.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \item[VIRTIO_GPU_F_CONTE=
XT_INIT (4)] multiple context types and<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 synchronization t=
imelines supported.=C2=A0 Requires VIRTIO_GPU_F_VIRGL.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +\item[VIRTIO_GPU_F_FENCE_PASS=
ING (5)] passing fence IDs from guest to host<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 for waiting supported.=
=C2=A0 Requires VIRTIO_GPU_F_VIRGL.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \end{description}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \subsection{Device confi=
guration layout}\label{sec:Device Types / GPU<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Device / Device configuration =
layout}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; @@ -746,7 +748,25 @@ \subsubse=
ction{Device Operation: controlq<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; (3d)}\label{sec:Device Types /=
 GPU Dev<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 \item[VIRTIO_GPU_CMD_SUB=
MIT_3D]<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;=C2=A0 =C2=A0 Submit an opaque =
command stream.=C2=A0 The type of the command stream is<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; -=C2=A0 determined when creati=
ng a context.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 determined when creati=
ng a context.=C2=A0 Request data is<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{struct virtio_g=
pu_cmd_submit}.=C2=A0 The \field{size} field describes<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 the size of \field{cmd=
_data} array in bytes.=C2=A0 The \field{num_in_fences}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 field is active only i=
f VIRTIO_GPU_F_FENCE_PASSING is enabled, otherwise<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{num_in_fences} =
is treated as zero.=C2=A0 The array of<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; \field{in_fences}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 IDs is placed in betwe=
en the \field{num_in_fences} field and the<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{cmd_data} array=
.=C2=A0 The \field{in_fences} array contains virtio-gpu<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 \field{fence_id}&#39;s=
 corresponding to the out-fence IDs of a previous<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 3d submits.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +\begin{lstlisting}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +struct virtio_gpu_cmd_submit =
{<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct virtio_gpu_ctrl_hdr hdr;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l=
e32 size;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l=
e32 num_in_fences;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l=
e64 in_fences[num_in_fences];<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
32 cmd_data[size/4];<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +};<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; +\end{lstlisting}<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Don&#39;t you need VIRTIO_GPU_FLAG=
_FENCE_SHAREABLE somewhere too?<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; We haven&#39;t made use of this flag in=
 the experimental/prototype version<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; that was made for the native contexts. =
The flag is unused by both Qemu<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; and CrosVM.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; We added Linux kernel UAPI flag VIRTGPU=
_EXECBUF_SHARED_FENCE and it&#39;s<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; deemed to be enough. If the UAPI flag i=
sn&#39;t set for a job&#39;s out-fence,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; then guest uses guest-side synchronizat=
ion for this fence when it&#39;s<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; passed as in-fence for the further jobs=
.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; The FENCE_SHAREABLE flag isn&#39;t need=
ed by nctx/virgl/venus protocols. All<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; fences are shareable by default. If VMM=
 fails to export fence, it is<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; treated like fence was already signaled=
. In case of Venus, it&#39;s up to<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Venus to decide internally which fences=
 can be made shareable, i.e. both<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; guest and virglrenderer Venus implement=
ations are responsible for making<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; decision whether fence should be made e=
xportable. Venus won&#39;t make<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; out-fence exportable for internal inter=
mediate jobs and will encode this<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; export-info within the Venus protocol.<=
br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Whether FENCE_SHAREABLE virtio-gpu flag=
 will be needed by gfxstream is<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; questionable. Gfxstream should be simil=
ar to Venus, i.e. you should be<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; able to add flag to the gfxstream. We&#=
39;ll need to be certain that the new<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; common flag is definitely needed by mak=
ing use of it before specifying<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; it in the stable virtio-gpu protocol.<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; I don&#39;t think you&#39;ve gotten fence p=
assing working with display integration.=C2=A0 Although passing external fe=
nces between two GPU instances does happen, the much more common and import=
ant case is passing a fence from the virtual GPU to virtual display.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Let me describe the use case for you:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; GPU creates a fence<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; rutabaga exports fence on creation via stre=
am_renderer_export_fence / or virglrenderer_export_fence --&gt; creates [fe=
nce_id --&gt; descriptor mapping] when FLAG_SHAREABLE is set<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; SUBMIT_CMD + CROSS_DOMAIN_SEND --&gt; takes=
 the fence_ids and sends a fence to the compositor<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; You also refer to <a href=3D"https://gitlab=
.freedesktop.org/virgl/virglrenderer/-/merge_requests/1138#note_1996999" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/virgl/vir=
glrenderer/-/merge_requests/1138#note_1996999</a>.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Once you have a working prototype that shar=
es an out_fence with the display, then we can talk about whether FLAG_SHARE=
ABLE is needed or not.=C2=A0 So I suggest you focus on that before upstream=
ing uapis + virtio protocols.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Why would sharing with display (via a different =
virtgpu ctx type) be<br>
&gt;&gt; &gt;&gt; &gt;&gt; any different than sharing with a different GPU =
context?=C2=A0 I don&#39;t<br>
&gt;&gt; &gt;&gt; &gt;&gt; really see a problem here, either the fence fd s=
till exists on the<br>
&gt;&gt; &gt;&gt; &gt;&gt; host side, or you know that it is already signal=
ed and you don&#39;t have<br>
&gt;&gt; &gt;&gt; &gt;&gt; to wait on anything.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I&#39;m not a huge fan of the fact that the current =
implementation uses EGL to create the pre-signalled fence.=C2=A0 Vulkan ...=
 it could work, but I think you&#39;ll have to generate some sort of dummy =
command at startup?=C2=A0 Shouldn&#39;t that be implemented too?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Something should use the new &quot;virgl_renderer_ex=
port_signalled_fence&quot; API to verify everything works.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; ok, so I gather you are talking about the awkwardness wit=
h the wayland<br>
&gt;&gt; &gt;&gt; protocol that we can&#39;t just pass -1 for a fence?=C2=
=A0 Rather than say<br>
&gt;&gt; &gt;&gt; something using kms.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Is there a plan to do a virtio-gpu KMS implementation?=C2=A0 =
Something like RESOURCE_FLUSH (in_fence)?=C2=A0 There are still many virtio=
-gpu KMS users out there.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I think this is just an implementation detail.=C2=A0 At a=
ny rate, in the<br>
&gt;&gt; &gt;&gt; later version of the virglrenderer implementation, which =
got merged,<br>
&gt;&gt; &gt;&gt; there is no dependency on EGL for this.=C2=A0 Only that t=
here was _some_<br>
&gt;&gt; &gt;&gt; prior work which created a fence.=C2=A0 Virglrenderer han=
gs on to a<br>
&gt;&gt; &gt;&gt; reference to the last signalled fence until it is replace=
d with a<br>
&gt;&gt; &gt;&gt; newer one.=C2=A0 If a guest fence is created, by definiti=
on the host will<br>
&gt;&gt; &gt;&gt; have _some_ signaled fence to hand out.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The implementation does use a static global table (virgl_fenc=
e_table) to coordinate between the virgl sync thread and the main thread?=
=C2=A0 This is common in C, but discouraged in Rust (and I do have a use ca=
se in mind).<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; This is fallout of how the virglrenderer API was designed (ie. not=
<br>
&gt;&gt; having a toplevel vgpu instance object).=C2=A0 But this seems pret=
ty off<br>
&gt;&gt; topic from the protocol definition.=C2=A0 Maybe we can revisit if =
there<br>
&gt;&gt; ever is a libvirglrenderer2 where we can break API compatibility.<=
br>
&gt;<br>
&gt;<br>
&gt; Well, at the very least we should pass through the proper information.=
=C2=A0 FLAG_SHAREABLE is completely costless (DESTROY_FENCE would in theory=
 add VM-exits).=C2=A0 I think we can pass some sort of shared data structur=
e<br>
&gt;<br>
<br>
costless or not, it is _useless_... I don&#39;t really see a good way to<br=
>
not just set FLAG_SHAREABLE on everything, and it kinda works against<br>
the guest kernel view of things... ie if you have a guest dma_fence,<br>
of course it is shareable.=C2=A0 That is why it exists in the first place.<=
br>
But it is designed to be cheap.<br></blockquote><div><br></div><div>The def=
inition of FLAG_SHAREABLE would be something like:</div><div><br></div><div=
>&quot;This fence is shareable across host 3D contexts and subsystems (incl=
uding other virtio-devices)&quot;</div><div><br></div><div>- For fences tha=
t will be shared with the host display, gfxstream guest will set flag VIRTG=
PU_EXECBUF_SHARED_FENCE</div><div>- For CPU fences or when a display not ca=
pable of fencing sharing,=C2=A0 VIRTGPU_EXECBUF_SHARED_FENCE will not be se=
t</div><div>- That would turn into FLAG_SHAREABLE on host: rutabaga_gfx wil=
l call stream_renderer_export_fence to take ownership of the fence<br></div=
><div>- When KMS issues RESOURCE_FLUSH(fence_id), rutabaga_export_fence wil=
l transfer ownership to the display=C2=A0</div><div>- After it&#39;s sent t=
o Wayland, the fence may be closed</div><div><br></div><div>This flow has n=
o mention of the last signaled fence, since gfxstream/rutabaga_gfx can avoi=
d this by clearer ownership semantics.=C2=A0 =C2=A0=C2=A0</div><div><br></d=
iv><div>There does exist a theoretical case where the same fence is shared =
between two different contexts, but I believe that may actually not happen =
in practice yet.=C2=A0 The last signalled fence trick would fail on that th=
eoretical case too.</div><div><br></div><div>So with FLAG_SHAREABLE, I thin=
k we can:</div><div><br></div><div>- Avoid the last signalled fence trick (=
though virglrenderer may still chose to use it) and associated oddities</di=
v><div>- Make the fence transient, as you desire<br></div><div><br></div><d=
iv>Since VIRTGPU_EXECBUF_SHARED_FENCE already exists, adding FLAG_SHAREABLE=
 on the virtio side would be very trivial.</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; Spec-wise, having FLAG_SHAREABLE + another DESTROY_FENCE api =
would probably be the cleanest since it gives explicit lifetimes.=C2=A0 If =
there were no performance concerns we would totally do it.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The concern is that DESTROY_FENCE causes excessive vm-exits a=
s fences are attached to the surface every frame.=C2=A0 So that&#39;s how w=
e end up with the last signalled fence idea, and somewhat undefined lifetim=
e/ownership semantics.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; The semantics are in fact well defined, a fence is just an integer=
 in<br>
&gt;&gt; the context of a timeline, there is _no_ lifetime/ownership.<br>
&gt;<br>
&gt;<br>
&gt; Interesting, your concerns are not just performance related, but more =
philosophical.=C2=A0 Namely:<br>
&gt;<br>
&gt; - What does a &quot;fence_id&quot; refer to?<br>
&gt; - What is a fence on the host side?<br>
&gt;<br>
&gt; I think the spec should address these questions.<br>
&gt;<br>
&gt; You can&#39;t pass an integer between two GPU HW contexts, or share an=
 integer with the display.=C2=A0 You can do those things with kernel file d=
escriptors like sync_file (backed by dma_fence, which is refcounted).<br>
&gt;<br>
<br>
I may have over-simplified things slightly in earlier replies.=C2=A0 It is<=
br>
not a single integer but a pair of integers, ie. the fence seqno and<br>
the timeline id.. but that doesn&#39;t really change anything from a<br>
lifetime standpoint.<br>
<br>
&gt; In the past, each fence_id was associated with a glSync object.=C2=A0 =
It was deleted after the sync thread was done waiting for it (see free_fenc=
e_locked in vrend_renderer.c).=C2=A0 This meant the host lifetime was tied =
to fence signalling.=C2=A0 The guest dma_fence would out-live the host side=
 glSync object (backed by dma_fence under the hood).=C2=A0 The fence_id was=
n&#39;t used by the host after signaling.<br>
&gt;<br>
&gt; Now, we&#39;re in the situation where the fence_id on the host side ca=
n be used after it&#39;s been signaled, and will be valid so long as the gu=
est dma_fence is around.=C2=A0 &quot;fence_id&quot; must refer to a shareab=
le host kernel object when VIRTIO_GPU_F_FENCE_PASSING is set.=C2=A0 Given t=
he new requirements, that&#39;s where the idea behind explicit lifetimes co=
me from.<br>
&gt;<br>
&gt; The last signaled fence is a way to refer to *some* kernel object, aft=
er the original one has already been signaled and destroyed.=C2=A0 Using la=
st signaled fence rather the original one may create oddities -- for exampl=
e, if another process (say Wayland compositor) calls SYNC_IOC_FILE_INFO fro=
m fences received from virtio-gpu, there might be data anomalies (timestamp=
s, name) compared to if we just passed the original kernel object.<br>
&gt;<br>
<br>
I mean, we are bending over backwards for one specific case that we<br>
should maybe solve more directly (by amending the wayland protocol, or<br>
changing how guest/host wayland proxy works)<br>
<br>
A fence is meant to be lightweight and transient.=C2=A0 It is a thing<br>
frequently created, and short lived.=C2=A0 We don&#39;t want to have guest<=
br>
interaction in order to destroy a host dma_fence, in fact ideally we<br>
want to minimize host depending on guest releasing transient<br>
resources, in order to avoid deadlock.. ie. only the host kernel<br>
cannot be preempted by page faults because all of the host kernel<br>
memory is pinned.=C2=A0 If the host kernel relies on the guest kernel to<br=
>
release transient resources, that is a priority inversion which can<br>
lead to deadlock in shrinker/reclaim.<br></blockquote><div><br></div><div>T=
he host kernel shouldn&#39;t depend on any userspace for memory management/=
priority decisions.=C2=A0 The virtio-gpu process in QEMU/crosvm is a=C2=A0u=
ser-space process, and can be compromised irrespective of DESTROY_FENCES.=
=C2=A0 I don&#39;t think DESTROY_FENCES would add to any attack surface.</d=
iv><div><br></div><div>Though, I hear you on your desire for a transient/li=
ghtweight fence.=C2=A0 I just think you can accomplish this by being more e=
xplicit on how the fence moves at the spec level.=C2=A0=C2=A0</div><div><br=
></div><div>For example, say one day we want to share the GPU fence with vi=
rtio-video, and wait on the host side before passing to host=C2=A0V4L2.=C2=
=A0 We&#39;ll need something like virtio-dmabuf [1] and the acknowledgement=
 &quot;fence_id&quot; is not just a {seqno, timeline}, but an unique identi=
fier for a host-side sync file.=C2=A0 Then we can say -- at the spec level =
-- virtio-video takes ownership of the sync file and has responsibility for=
 closing it.=C2=A0=C2=A0</div><div><br></div><div><div>This is both transie=
nt and more correct than just giving out the last signaled fence.=C2=A0=C2=
=A0</div><div><br></div></div><div>However, this would take new v4l2 ioctls=
 that take in an in-fence for the virtio-video case, and hence I propose DE=
STROY_FENCES as a tunable fallback if we can&#39;t make that happen everywh=
ere.=C2=A0 But in the ideal world, yes, the fence would be transient.=C2=A0=
=C2=A0</div><div><br></div><div>So in summary with my review comments:</div=
><div>=C2=A0 =C2=A0 - Can we get a FLAG_SHAREABLE in v2?</div><div>=C2=A0 =
=C2=A0 - Can we get a RESOURCE_FLUSH(in_fence) for KMS integration in v2?</=
div><div>=C2=A0 =C2=A0 - Regarding transiency:</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- Good idea, but can we add it to the spec level ra=
ther than being implementation defined?</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- For it to be transient everywhere, we&#39;ll need even v=
irtio-video to take an in-fence at-least?</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0- I recommend more research on the transient subject, i=
t *could* work</div><div><br></div><div>[1] <a href=3D"https://lists.nongnu=
.org/archive/html/qemu-devel/2023-05/msg00595.html" target=3D"_blank">https=
://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg00595.html</a>=C2=A0=
=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
The last_signaled_fence may be a workaround that leads to weird edge<br>
cases.. but over-complicating transient resource lifetime in the<br>
protocol is not the answer.<br>
<br>
BR,<br>
-R<br>
<br>
&gt; We can probably survive these oddities, but we can probably avoid them=
 too, so that&#39;s why it would be nice for the guest to provide the infor=
mation it has.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; Though, the guest kernel already tracks fence lifetimes throu=
gh dma_fence.=C2=A0 What if we add:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - DESTROY_FENCES(fence_ids, num_fences)<br>
&gt;&gt; &gt; - a virtio-config (&quot;fence_destroy_threshold&quot;), whic=
h controls num_fences in DESTROY_FENCES<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; When fence_destroy_threshold =3D=3D 0, this would be the curr=
ent proposed solution (fence lifetimes implementation defined).=C2=A0 Howev=
er, a user can make &quot;fence_destroy_threshold&quot; 100 or something li=
ke that, to cause a VM-exit everytime 100 fences have been destroyed.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This attempts a tunable compromise between API purity and per=
formance concerns.=C2=A0 WDYT?<br>
&gt;&gt;<br>
&gt;&gt; Tbh, I think the current approach is cleaner from the PoV of what =
a<br>
&gt;&gt; fence is.. it is just a seqno, it should not have a lifetime.<br>
&gt;&gt;<br>
&gt;&gt; BR,<br>
&gt;&gt; -R<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; But this is all implementation detail<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Essentially, let&#39;s do our due diligence and veri=
fy the most important use case (gpu --&gt; display) actually works.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Best regards,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Dmitry<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
</blockquote></div></div>

--000000000000b894140610f6bc8a--

