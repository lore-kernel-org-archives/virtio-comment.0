Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E463BB105
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324149; cv=none; b=rm08MzAiLj6uiS7xDu3/wl8bCy8E9F3vlVuVCmRxgcQ3vNBgvNxKGJzoMoBuAA2ROvX0xLDjhh5BqS38VbNwP9mSJyU1iVFsxH5jf7LO/2QLHs/n70VLgXh1mhIRiLlVQzJHlzWe6vmk0IJa5IQ4gpo1aBbtl+cIo/d6V+HMi0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324149; c=relaxed/simple;
	bh=B6zG59Ern2ZuTKn+fMy0i0RewZ03YYnlDI3PGzoMd3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejmre/mBMIxSq3Cznd4ehHiMLbZBR4xCKvXVxGlYXVql5nDg3Xm7MPGaGullCHF1pTrg/jZAShL+O1Wq3Thk32wxfOf8xl1suRsaBjQPg/IWb3Gs4NLtr/d6Hc9KAVk5a5XBLjj43wG66vbC/coe2RY7RK1OppKM8aDdVEruNuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CzQrdVWD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CzQrdVWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780324147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nzxGVtD8LzmdHy9vSLwx4b0m9AMJU6GxbTYPcOb5Wxk=;
	b=CzQrdVWDRf0mjGAq2mBJPY7p0m0dfAZkkBC0eE0wxBfWgZtQcKeG3iw4nU0XN+kbGinMZJ
	Y06/OY6zpvWFwjIV08LqNXvJr9ff0a+Fa42C31VkdE5ScH2F4ktupigNZl4sDK6FfYx8Io
	8ZUso84NInkxyyFg8dq4A6WlV/+Vb+M=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-aClLPa5ZPB20eHDucN5iVQ-1; Mon, 01 Jun 2026 10:27:58 -0400
X-MC-Unique: aClLPa5ZPB20eHDucN5iVQ-1
X-Mimecast-MFC-AGG-ID: aClLPa5ZPB20eHDucN5iVQ_1780324078
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7e08bf5123cso35089737b3.3
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jun 2026 07:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324078; x=1780928878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzxGVtD8LzmdHy9vSLwx4b0m9AMJU6GxbTYPcOb5Wxk=;
        b=eC8ICXyn1f0uswgsFBf3B195bF6dU8kaFBX4+1Eaw1KbChNxxnLPgxcLTA/P83JYC+
         QdNNtMhqWA1vm9QarH4dgg3F/sCxU5kBGC+rtiNUctr48p96eI/8LfeN4+0eQMjK6QOm
         5m1xTJVtZm/RQP4pUUi3c8ZJxt4g+yJsaUaUzpro3Y+CUPQafBO+pJRNLc7cOHfdvYQr
         4o6IsHQbAAgPrr8+G5PRW3iUCAWaZzMC670JkQv6+i6ewGw7QaKTZ+HoK7yI9s7k1Ulr
         4DHVDrtSWZpUVz2pBaA541IrXzf8/S8518+12wqn3vD1hZf48tMgUKtUA4DvCm5zmLRv
         xoUg==
X-Forwarded-Encrypted: i=1; AFNElJ8FXYum3HRuDf8yK5BX4Js917gSey0yzf3SIClsw1iWwGgKWaYAdPd6B7zRCQAouFBIfoxLE+Gf7Gqvt/BE4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZA6O5UNgEFBaVTc7Us2bfrvVBV3ZinYeKZskyooqRbr8/lyda
	MCK7vicnzJgk4HwaLL5H3g4pt1rVg6YuZXxCFAC9RjZ2oMWBq3dATp2TAUPe7oLaQOwv+3SLAfN
	7ki/U4Zz3e88ctu56wMxnow3C3BrIi5X2EDWX2Ph5URhHMYdX2KNKi7ilxjGGYH60TCf+d/1Gai
	uct+Bb0IcuO4SVbMjfCl7eN2xK/kCro0iH+8ucK7wZwa0=
X-Gm-Gg: Acq92OE4YbuKPBaev1Vp92N6P0oNPr6aGbfL0jnX4UFkQBzPc7/diH5MZCIy17HhyPe
	VhQ/4x4DdbdOk0y1pSkEb2XPWnSY/lGSEGR6r8000Ua9oyMgrKzAj6cyOr8Vfke/8hODKFwwylK
	8fkBGIj6u+usqSlwx5sxwqbMk91/Ohm0V2Fl5ODhpjG2cB/lnhS08nQSrEf3CdOmgstg0cAdPZI
	/oBcBfDONskohYX
X-Received: by 2002:a05:690c:600f:b0:7dc:f7b3:8e08 with SMTP id 00721157ae682-7e05d8d073dmr97402177b3.23.1780324077675;
        Mon, 01 Jun 2026 07:27:57 -0700 (PDT)
X-Received: by 2002:a05:690c:600f:b0:7dc:f7b3:8e08 with SMTP id
 00721157ae682-7e05d8d073dmr97401917b3.23.1780324077295; Mon, 01 Jun 2026
 07:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <874ijtz038.fsf@draig.linaro.org> <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org> <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
 <20260601090953-mutt-send-email-mst@kernel.org> <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
In-Reply-To: <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 1 Jun 2026 16:27:46 +0200
X-Gm-Features: AVHnY4KkVphEgTcvUaTusVW5m8BJdtQFZnb5ZMHPSTXxKAdxVYyJEGJ_HsR1UR8
Message-ID: <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
Subject: Re: Where should the vhost-user specification live?
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev, 
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org, 
	Stefano Garzarella <sgarzare@redhat.com>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>, 
	Mark Burton <MBURTON@qti.qualcomm.com>, Matti Moell <matti@qti.qualcomm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>, 
	Vishwanath Seshagiri <vishs@meta.com>, Rob Bradford <rbradford@meta.com>, 
	Zhengyu Zhao <zhaozhengyu@bytedance.com>, "Jorge E. Moreira" <jemoreira@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pEd1qztYTJM4t5q36-aCKKAOpJj-d5Sz9yML_B4HdrE_1780324078
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:51=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.com>=
 wrote:
>
> On Mon, Jun 1, 2026 at 9:12=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
> >
> > On Mon, Jun 01, 2026 at 03:05:50PM +0200, Albert Esteve wrote:
> > > On Mon, Jun 1, 2026 at 2:39=E2=80=AFPM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> > > >
> > > > On Mon, Jun 01, 2026 at 02:32:11PM +0200, Albert Esteve wrote:
> > > > >  But also because, in my opinion, separating
> > > > > the specification would improve development agility by decoupling
> > > > > specification development from QEMU's review and release cycles.
> > > >
> > > > Generally for QEMU this will be less agility, unless I misunderstan=
d
> > > > what is proposed)
> > > >
> > > > Because presumably there will need to be spec releases then?
> > > >
> > > > So
> > > >         new feature -> spec tree -> spec release -> qemu implementa=
tion -> qemu release
> > > >
> > > > is surely longer that what we have now.
> > >
> > > I see your point.
> > >
> > > However, we do not really need to introduce a heavy release managemen=
t
> > > layer. We could just operate it as a living document, where the main
> > > branch is the authoritative source of truth.
> > >
> > > For the workflow, development doesn't have to be strictly sequential
> > > either. A contributor can propose the spec update while working on th=
e
> > > implementation, much like we do for VirtIO updates. Actually, this wa=
y
> > > one update/change supports the other.
> > >
> > > I guess my point is that a dedicated repository could lower the
> > > barrier for new changes AND keep QEMU's own development speed mostly
> > > unaffected.
> > >
> > > BR,
> > > Albert
> >
> > Something something submodule? Possibly. If you want to make progress
> > on this, pls think of the process, try it out.
>
> If I understand correctly, the motivation for moving the spec
> somewhere else is to replace the email patch review process with a git
> forge review process?
>
> This seems like a superficial change and is not worth in my opinion if
> you consider we'll have to redirect from the old spec location and
> move the community over to the new repo.

The core issue from my perspective is project neutrality and
decoupling lifecycles.

Currently, protocol updates are tied to QEMU's tree rules and release
freezes for example. Since these changes also affect other projects
(like rust-vmm, crosvm, DPDK, etc.), separating them may make sense
and could streamline the process.

>We could actually lose spec
> change reviewers in the process either because they don't know what's
> going on or decide that they prefer to spend time elsewhere when faced
> with switching processes (the people who review and participate in
> discussion do so out of personal interest and as far as I'm aware no
> one is employed to work on vhost-user as their #1 priority).

This is a fair concern. I hope we maintain reviewer engagement. But it
could also be argued that contributors from other communities may be
more comfortable with a dedicated project-neutral home. It could well
go both ways, but it also represents an opportunity to grow.

>
> Having said that, here is what I imagine it would involve:
>
> 1. Michael creates a new repo on a git forge (if he wants it to be
> under the GitLab qemu-project organization I can help with creating
> the repo, otherwise he creates a new organization and repo).
> 2. Discussion happens in Issues.
> 3. Spec changes are proposed in Merge Requests. Michael merges them
> once consensus has been reached.

Mostly yes, though we wouldn't necessarily need Michael as the sole
gatekeeper. We could invite co-maintainers from other key projects to
share the reviewer load.

Also I'd want to clarify that although I am advocating for this
change, I do not claim to have the definitive roadmap. I am just
sharing my view on why this could be a positive evolution. Consensus
may end up being to remain with the current status quo, or any of the
other options proposed by Alex.

>
> It's similar to what we have now in qemu.git, except that a git forge is =
used.
>
> Stefan
>

