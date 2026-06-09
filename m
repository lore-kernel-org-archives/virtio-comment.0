Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23793AEF30
	for <virtio-comment@lists.linux.dev>; Tue,  9 Jun 2026 18:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031383; cv=pass; b=RUrPS3abBSjwNL6dmUzs6aeIXv156elliPZGlgUL9zMpV7meK4hAxWHyOyOVZMDXBsNehGP3O6gB8ArBcNnjyFjhPIYWF2bAIUTmaFlyvqJYPb7qlOjbzmeZTb74qgLnF9KAAKK+x8vaZXXKpYP+YDykF7Ts85anGounRQL+4eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031383; c=relaxed/simple;
	bh=9jUp3iBPByccIet06cfjPUK09NvRBqzcZDFuywo9mHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZuVxM1pFEKE8m80SrYP470CLEPx3M8Aa1HBRu6AlUpD2zHmr6EWwI4TA6uAbPD721j2AmA9JPLDhjmjhk7nt3GX+tIuEnthnYBzeMQymp5BLJmjkMXoEcavtrUash5i7wxOKznosys7RaZmxRvUaQecSVQWVi+5DrSDk1S56dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpXVSW/P; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpXVSW/P"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cdae130cso17434005e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 09 Jun 2026 11:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781031380; cv=none;
        d=google.com; s=arc-20240605;
        b=OKReLUUz5FlOlTTFt1B4KfBNursmCmAiLml0Qi8hAWwUCNGX+yNlhSkk1OPIovota3
         mFP97lf/jBNTeHNUd2oiciiy8qoyHT+ccpfjdIZ4MIx0Plxrd57IgLOv7OpKr2rFCFjH
         y76+8xlKvvJz/REmVTF++E4ieYAFW3W3KCEZCWy5/pKLs6gdNt+G1P9UkMDEwCXSm5kx
         jx3Qci64E2BfKaeowos85BqPFOrs3yaXR608JFyhD9ZPNw/Zt4LhjTLZCM+YvSWc7JtH
         cxBBLEBdG7Jgog4Gr+fMc07UogNGyi5cLOl80cbkjzCYDFt8vqLKAKpvGtQXyXix9z1E
         m66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9jUp3iBPByccIet06cfjPUK09NvRBqzcZDFuywo9mHE=;
        fh=hJLYUmDvAWsSPHZmmWqfp3p1qHPS/cp/J3bK2qCLLvY=;
        b=CXaI/BcgTiShU3WCjnvfkNJD8pb71HWsxz3fPVG1U/TyDHqqESY3D08ltWU6JGl4cm
         my7TC2LyKhrzKXgl09j9mCpzvqoN7RZ22iozr0EFShWH7UIIsoGNMP2RyAVLmf9vJwZ7
         Mqhhi/iJ3Z9eiCXPcrSU85zvNiaRTDMMAyBWyTeR7jfDFCKmGEl8tk90XEJAfsm2zzhN
         6PqrpZACQRO/LOpX0jg5sscpjm5jtSpYX5XtT5prot3wfi/e85xg83l9u95Vmt6byF27
         K5CFylblov2ET3CeV8cPJOR/RcRy8LSNlGdU54d4aWJB9Z0bOy2jATd3GRAkvBaLyE8G
         VQig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781031380; x=1781636180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jUp3iBPByccIet06cfjPUK09NvRBqzcZDFuywo9mHE=;
        b=KpXVSW/PhTKGVp9LR+FIoezhfoVafAxqxn8VwwmEbBqJPPw6UVggd0GgPASrr17IO/
         sjsCKa3XLeXPrxnH22ZFtL9wleyg1r0GvNFaS3pFDNJYK44U7hdmtj2MUWP1enTTxauS
         DBwzj/zoxQdXHkroJL1tMSddNOmTacMUkzjjBaVoQJrlJ6Bh3tapygj5fQeoel7Ae6vo
         l3HZkiYmFBx4KTKSklERGMK6NFif/20EFuCNjlggN19vPtCyuvuGm/iiqlrZ/Q49C9kz
         KmlA4atFPfhJH4moPKQBPJq3LBa1Yp2eZGaZ9RfJEUFLscKUCYPKf/BreMGj8cTEDZxS
         W5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031380; x=1781636180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9jUp3iBPByccIet06cfjPUK09NvRBqzcZDFuywo9mHE=;
        b=kS5G31eRrz16K+k3LWI4ZI8CuqUIHLGgoE1GEhtfqHYjlt56fpYNF2/UvC+yG5hlPp
         D2AMtghu1ekgrODb2hjoGd/rHKbLc3mPlVpyDYiU29pqFi7kr7u6BOhNLc06zeUGeugU
         gyYpLxq5HV8qbn7py327joPt8g5J2BzKv5oup45YLERr4emC8vHJvYmjtG+poeIO0l5A
         FEzo+FRnkdUJlepTXeRGI29wY13ayoPoS20ceeYLAai/1Xt7gX64fgjOZxh+cCMhWlM/
         jSFBDGm/wpnUBA/FaS5N+2Q2a3z7D54zFCafngFGciyJKlp62mnBCBFkOaAtyj8Dm/4T
         FC+g==
X-Forwarded-Encrypted: i=1; AFNElJ/Jbataxt/E7SVd/R2c4GaPgt74+RDedtnZZLKDNeDjMcbV3gOuYObg6PlyBA7OB/t0bmIFVSgiKu+dIfEtFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzM/mywOcQ3sYNx07a34xPMbtsPW3smob9E0LTIgrN60lXYKOMr
	ZQnTvzwPUvcf9vqKLB3vARs2p+7cM/0K8kgTwV6fjCH+p7QaQ5lxWLjxYbkc3oZwWATem2KvKmd
	KTZHSQlWqnZ91qAvPbT9s5w7Z1TDDTKSTScdhZ07Q8g==
X-Gm-Gg: Acq92OGFgUWwHz1JAypIkjLZFiyRwDLonwKlLVMq4sJvl69v++9HgyG/g7BdJ3BbI52
	gEuHPc5IWRIQtcagpiBApuez2efRJmUTi1w2O9nfyfRStCfdbglXVQD63jCq0WUXxB9+7Pz4Y6X
	7taatI3mIp9HN2W8A8e9I+p2eY6RjH4Xsh9ANk140XGYrO3HIblYTU6iKRCZGRmP63v+oGrf7QJ
	67eVXtXkgrn37XaMdnpkzuASDTqtI6lTmC0Y9LrGosvT/a4cH6W6Ji8ir1iDxsCRTRhOj/dyDCc
	BXjvEekiCFWuhGUjZdcjU3/6ktoQfMv5OWjSZbqwlW3FfUe288Maoj6/DEmh
X-Received: by 2002:a05:600c:609b:b0:490:5466:8576 with SMTP id
 5b1f17b1804b1-490c259854emr346044955e9.1.1781031380105; Tue, 09 Jun 2026
 11:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <874ijtz038.fsf@draig.linaro.org> <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org> <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
 <20260601090953-mutt-send-email-mst@kernel.org> <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
 <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
 <20260601151815.GC411459@fedora> <20260601160352-mutt-send-email-mst@kernel.org>
 <CACzuRyxedVMHNGkRf7AVyPWUTMgBMa6_DBnSHn+V6H7wN7XzWw@mail.gmail.com>
 <20260604162853.GC115597@fedora> <CAJSP0QXR6MyqoE1Uh-X7DzsOabbbN69TUyxf8r6ghUDCQnrP=w@mail.gmail.com>
In-Reply-To: <CAJSP0QXR6MyqoE1Uh-X7DzsOabbbN69TUyxf8r6ghUDCQnrP=w@mail.gmail.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 9 Jun 2026 21:55:53 +0300
X-Gm-Features: AVVi8Cez7LrzR4UFcqFbMTZkIa6rqxqltEz6H7-ttHlixGU_miD6q2bZoE9M5-g
Message-ID: <CAAjaMXb8tnDuBBgVkVk31AYaWKpWhas7APWtSyjcrMFMYc26jg@mail.gmail.com>
Subject: Re: Where should the vhost-user specification live?
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Dorinda Bassey <dbassey@redhat.com>, 
	Albert Esteve <aesteve@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev, 
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org, 
	Stefano Garzarella <sgarzare@redhat.com>, Demi Marie Obenour <demi@invisiblethingslab.com>, 
	Alyssa Ross <hi@alyssa.is>, Mark Burton <MBURTON@qti.qualcomm.com>, 
	Matti Moell <matti@qti.qualcomm.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Sergio Lopez <slp@redhat.com>, Vishwanath Seshagiri <vishs@meta.com>, Rob Bradford <rbradford@meta.com>, 
	Zhengyu Zhao <zhaozhengyu@bytedance.com>, "Jorge E. Moreira" <jemoreira@google.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:59=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.com>=
 wrote:
>
> On Thu, Jun 4, 2026 at 12:39=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.=
com> wrote:
> >
> > On Tue, Jun 02, 2026 at 12:38:27PM +0200, Dorinda Bassey wrote:
> > > Hi All,
> > >
> > > Following up on this discussion: Albert, Stefano and I are organizing
> > > a BoF session on vhost-user for Linux Plumbers Conference, so this
> > > thread is very timely.
> > >
> > > > I get a sense that this is about politics in the end. Do people fee=
l
> > > > they are not represented and would like to have more influence in t=
he
> > > > vhost-user spec?
> > >
> > > I think the core issue is that vhost-user has grown beyond just QEMU.
> > > The spec is now implemented by rust-vmm, cloud-hypervisor, crosvm,
> > > libkrun, and others. All of these projects depend on the spec as thei=
r
> > > source of truth for interoperability.
> >
> > vhost-user was always an effort spanning multiple projects - that is
> > fundamentally the purpose of the vhost-user protocol - so it bothers me
> > when it is framed this way. CrosVM implemented a vhost-user front-end
> > years ago. Features have been added to the spec that are not used by
> > QEMU because the spec is for all front-ends and back-ends and their
> > different use cases, not just QEMU.
> >
> > I'm fine with moving the spec to a separate project if it makes
> > day-to-day work easier, but it's not accurate to portray vhost-user and
> > the work that has been done by people from many projects in this way.
> >
> > > There are also concrete technical friction points. Let me share some
> > > examples from rust-vmm:
> > >
> > > rust-vmm SHMEM PR https://github.com/rust-vmm/vhost/pull/251
> > > We had to wait for QEMU spec acceptance before merging the
> > > implementation. The spec update was delayed with the comment
> > > "should get picked for the next round" after QEMU freeze.
> >
> > I am happy to merge a vhost-user spec PR into qemu.git during the freez=
e
> > if other projects need the spec change.
> >
> > > rust-vmm PR https://github.com/rust-vmm/vhost/pull/339 : was
> > > kept as draft "waiting for QEMU spec changes to be finalized."
> > > It was eventually merged when they decided the spec was
> > > "stable enough" even though QEMU hadn't finalized it yet,
> > > which felt awkward.
> >
> > In this particular case the QEMU patch series could have been split int=
o
> > just the spec change and the QEMU implementation with a note in the
> > cover letter requesting to merge the spec change right away. I don't
> > think anything was fundamentally blocking the spec change, although
> > maintainers might be skeptical about rushing something that is still
> > work in progress. There was a lack of communication here.
> >
> > > When multiple independent implementations wait on one
> > > project's release cycles, it raises the question of whether the
> > > governance model matches the ecosystem reality.
> >
> > If the experience with QEMU's release cycle is the main point of
> > friction, then that is easy to solve by merging spec changes even durin=
g
> > freeze.
>
> Hi Michael,
> It has been a few days and I want to make sure we don't forget this
> discussion since rust-vmm was inconvenienced by waiting on QEMU's
> development cycle.
>
> I'm not sure if anyone brought up this topic on qemu-devel and with
> Michael before. As I mentioned in my reply, there are ways to avoid
> blocking vhost-user spec changes when qemu.git is frozen:
>
> The simplest approach is to keep merging vhost-user.rst changes during
> freeze since it does not jeopardize the release or introduce
> instability.
>
> Another approach is for Michael to merge patches and publish his vhost
> subsystem branch. This is a common approach that Linux and QEMU
> sub-maintainers use to share merged work before it reaches the final
> repo.

> As long as there is a guarantee that vhost-user.rst changes
> merged on Michael's vhost branch are stable, front-end and back-end
> implementers can rely on spec changes in Michael's tree without
> waiting for qemu.git/master.

I think this is the sanest and simplest solution. vhost-user.rst
changes do not need to go to master, a guarantee that they will get
submitted as a PR against master is enough.

>
> Moving vhost-user.rst to its own repo also solves this.
>
> Any preferences?
>
> Stefan
>
> >
> > >
> > > > Why is the current system not neutral and how will the new system s=
olve
> > > > that?
> > >
> > > For example the virtio-spec has OASIS governance where changes
> > > are proposed and merged independently of any implementation's release
> > > cycle. Whether that's the right model for vhost-user is worth discuss=
ing.
> > >
> > > > You bring up project neutrality and a model where Michael is no lon=
ger
> > > > the sole maintainer. It will be necessary to propose a concrete roa=
dmap
> > > > and also to explain the concerns about neutrality more so it's clea=
r
> > > > they won't be an issue anymore in the future system.
> > >
> > > You're right that we need a concrete roadmap before making changes.
> > > More reason to discuss in the BoF - to work this out with the people
> > > actually doing the work: you, Michael, Albert, and others who've been
> > > deeply involved. Maybe in the end the solution might be to "improve
> > > QEMU's process" (like Michael's submodule suggestion) rather than
> > > "move the spec." or something else? that's what we need to figure out
> > > together.
> > >
> > > Would folks here be interested in joining the discussion at Plumbers?
> >
> > Plumbers in October? How about scheduling a video call in the next few
> > days instead of waiting. That will allow anyone to attend.
> >
> > Stefan
