Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A51C375F80
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317245; cv=none; b=H9y9qTTXiNhshWV8CgdmDfEbEH13NRateNp4Vsrl6Vo9atSIUQkapX82rEk60/s64juOqbl1GemaYmPZEoUxwMrOrOUd15Kh5UditjEZ6nSRPQ9AzcXtErLlM2wviJdxytcdcFaRsqu/8xc3N2hxVo2RULh44ZiShotK3ODbfg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317245; c=relaxed/simple;
	bh=dCKh9IRS8U2GQmnL0+iuba1hDcbO7zQR+sdM/k/4AP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXS9gGdr6DGVy8dbAK3s3sAfvSs31RkzJH532+RlIvOPSQ1sj6IJUC3v+pf3ss28XcjIsRbyckhDi16KsNmHLCm5nLs04m610sdLtI+zWYdzGON9QYffaoywOql8ZKtQWAepae86UUAhqEITlzB9ciCJNjBr76LFYd06JAfoWSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iiX/u7ug; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iiX/u7ug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780317243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4S2OoOJdCGik4sB7UdU96sEr9aO97fQctanm7w64oQ=;
	b=iiX/u7ugnVb8cMeP9tGEwxvVcDi9LfjFOzdD0UhasNF4Qc881UTLaUKtftJABaICPYtEOf
	ldbrtvnIIYAPd+VDYxgahxls+USdXfQkjQAb34XytCseFQoDW9Q98g9ueFXtVnGMKOBBnZ
	LHLFjMRfN1VlrRyz6bjatuZXG1Vyfoc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-g-97AIPYMdC9ti9jj2i13A-1; Mon, 01 Jun 2026 08:32:25 -0400
X-MC-Unique: g-97AIPYMdC9ti9jj2i13A-1
X-Mimecast-MFC-AGG-ID: g-97AIPYMdC9ti9jj2i13A_1780317144
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7e08bf5123cso31975047b3.3
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jun 2026 05:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317144; x=1780921944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4S2OoOJdCGik4sB7UdU96sEr9aO97fQctanm7w64oQ=;
        b=T+PFSiHoEskCYsQXZnVE8kF4KGumkJVx0v7G8GJVxxFBUPdrf7iK0CtTQcVFGk6JhO
         DvPL44yn6w0yY2HlBHY2CRgyHU/D4IC8w0i0ku2IsuRsvjO9Z035vPj+B7fMvFSXPbC4
         Q7VqPYviwTPSUC0fQ6r31GHcjGDZUsLiMf9z9VtAZFri2WXk1hd0L7VkB1ZLs5Ng1a7f
         p8CWUfdOgc7TDaJ81JJQbEcEwrQPa5BV+32E9FRt+DrgNUAf3wv3tdbGeyzvpYjywdK0
         tyQ3IL9Qqx9lolpg3zB8VMQMhJp7CGu8BkSlu7sauSaVfaTGRgS88358NnXSUQQU/TFY
         W4eg==
X-Forwarded-Encrypted: i=1; AFNElJ9xpdnUrxaTOpP/ifZHJa1GVw3Sts0LPkdhBT/O9jgw+G80N5SuZ3uMJn6TcMOeYXcEt08XxPzzP/RFx6ZcHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqcfTIqTPA+DW7EEyl0R4YEBqmzc4VgZSOWqCYiczW7Z+sREUR
	YXQ5M3QgTTViMZbEhMK2iQeRPgLSQHjaojoI/OKh4FxAX+dfD0zipP4oviJtu9+03w8dzYz9DsT
	pF7LVJFZbfFzAMF9CnWpb65dV2VDMQ32JGZ/gldtEVs0cQzNlo0WJqcowKFA6YyMDwusYDgoi7x
	d8n0LHfgUWfxWVcYinOEAFwLEBsRRo+8UlAvp9iXeiDL4=
X-Gm-Gg: Acq92OERkpKatsVm0smF+ODa4XCfR/YZBpvxsWzT5I3s2h/4/nY9RKerY+XNG/mzYZU
	itMjDgNDZWzdOO8fTN7aAKBPn9hDLL5q11o5Nq5ZpNcDowRbGfr8xRUFXOCeB34vvuurFBZtVUD
	C50RR4aIYutRXlInqO7KIDiQv05T0N9361Jon43PqXc56S8hrXLPIop5qPkIn0VOklTJVGozGf4
	Y0CJCrBrMCEvfeJ
X-Received: by 2002:a05:690c:6e06:b0:7bd:995a:a31e with SMTP id 00721157ae682-7e058b3e948mr90313887b3.7.1780317144321;
        Mon, 01 Jun 2026 05:32:24 -0700 (PDT)
X-Received: by 2002:a05:690c:6e06:b0:7bd:995a:a31e with SMTP id
 00721157ae682-7e058b3e948mr90313557b3.7.1780317143736; Mon, 01 Jun 2026
 05:32:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <874ijtz038.fsf@draig.linaro.org>
In-Reply-To: <874ijtz038.fsf@draig.linaro.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 1 Jun 2026 14:32:11 +0200
X-Gm-Features: AVHnY4IHsKtXvcmMZwHKbZCsvKSO-CnD7seD8KmIQFUM33ZbnQqqBiQDVQmL5Ts
Message-ID: <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
Subject: Re: Where should the vhost-user specification live?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev, 
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>, 
	Mark Burton <MBURTON@qti.qualcomm.com>, Matti Moell <matti@qti.qualcomm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>, 
	Vishwanath Seshagiri <vishs@meta.com>, Rob Bradford <rbradford@meta.com>, 
	Zhengyu Zhao <zhaozhengyu@bytedance.com>, "Jorge E. Moreira" <jemoreira@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: npJ2RhXxCxuxPmYpoDGdwu6iZdJzdzVDpmHlALX6c4A_1780317144
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, May 27, 2026 at 11:13=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>
>
> Hi,
>
> Apologies for the wide cross-posting but I wanted to find as many
> interested parties as possible.
>
> The vhost-user specification currently lives in the main qemu
> repository (docs/interop/vhost-user.rst) mainly due to historical
> reasons. QEMU was one of the first VMMs to implement vhost-user and the
> spec needed to live somewhere.
>
> However there are now vhost-user implementations for QEMU, rust-vmm,
> cloud hypervisor and I think CrosVM. We get queries about changing or
> updating the spec on qemu-devel from time to time and I feel that given
> it is an interoperability specification we should think about hosting
> it and its discussions elsewhere.

We recently discussed this with Dorinda and Stefano. I do see value in
moving it elsewhere. Mainly to remove the friction of external
communities navigating QEMU-specific tooling and workflows just to
propose protocol updates. But also because, in my opinion, separating
the specification would improve development agility by decoupling
specification development from QEMU's review and release cycles.

At least it is worth the discussion. Thanks for raising.

>
> I think broadly there are 4 options:
>
>   *  Move into the OASIS VirtIO group as an appendix/addendum to the main
>      VirtIO spec.
>
>      This probably brings the widest visibility to changes to those that
>      might be affected. However it does come with a certain amount of
>      bureaucracy with the OASIS process where only members can vote on
>      changes. While intimately tied to VirtIO it's concerns are more
>      focused on practical implementation details of the IPC between VMMs
>      and device backends.

While it does make sense for VirtIO, I'm wary of the added bureaucracy
that OASIS would introduce for vhost-user. The scope for vhost-user is
also much smaller, focusing more on the transport protocol as you
pointed out, so I do not see the need to subject ourselves to that
process.

>
>   * Move to a separate project under the qemu-project space.
>
>     QEMU hosts a number of sub-projects and mirrors so it would be easy
>     enough to split the spec into its own repo. Changes to the
>     specification could then be divorced from QEMU's release cycle and
>     at the maintainers option issues and merging strategies could be
>     configured for just the specification.
>
>   * Create a new project just for vhost-user
>
>     The interested parties could decide where to host (github, gitlab,
>     forgejo, whatever..) and decide to move away from mailing lists
>     altogether or create a mailing list but manage changes via the forge
>     interface.
>
>   * Status quo
>
>     Just keep the spec where it is and muddle through as before. Maybe
>     we could improve the contribution documentation for how and when
>     changes are discussed.
>
> Any thoughts?

Another option could be rust-vmm. It is a project shared by multiple
stakeholders. And while it is Rust-focused, its community heavily
overlaps with the exact ecosystems driving modern vhost-user
development.

BR,
Albert

>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

