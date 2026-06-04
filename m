Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC134DB46
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jun 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591148; cv=none; b=iCrg8yjVKLGEBTbomQzQ7a+kex3Om9mjU5mBh01Mi2vF0nW9czazHMFwsk35PDrpHHxWm0g///ezXT+Nw7rETWSUdEjIhQ2/dvy4+C+KzTDQ57g4cKpRG7grOlepX6gnmEqycXQgGHTYJLORJx3u3tyjhNTMDnONyW5MwUAoPn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591148; c=relaxed/simple;
	bh=2r+fzOpo5enQdSe1jmJ0C+/wa4xJ8Pn+LBWPFKbjY40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giMuvKkc8O3RuV3r2e6GimuNUMyzXi7ND3fXKKFwc9of2nMwheCJwMdLIKsIvJwjXOt13hRSREvwpVY3lgUOHpfmmTyluMu1IEmmJo7ljrJT/K/gPySH+nikkwwWdwm31hIX1jTyrhiYxWbk2Gg+Gk2RGJjiJUPYf3ghQWhApas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SB4KOiGN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SB4KOiGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780591146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2r+fzOpo5enQdSe1jmJ0C+/wa4xJ8Pn+LBWPFKbjY40=;
	b=SB4KOiGNGZswQnFLyqbyOjPHuil4vvOh7r2OUDLp4ADWioPkssjgYnFey/QVffl9OGamcP
	92RmPmpxI5ONGQtt6zzbZVjUkMKqGg4SR2vkQ3kc9RUXOG6k4czDdFrDSH1QhYiWAEYIaF
	oUzDXii6bW6Zzyh+NtHs8YQhuLq9psY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-580-D4xkaiw8Op2hCC6E435Jgg-1; Thu,
 04 Jun 2026 12:39:01 -0400
X-MC-Unique: D4xkaiw8Op2hCC6E435Jgg-1
X-Mimecast-MFC-AGG-ID: D4xkaiw8Op2hCC6E435Jgg_1780591139
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B8032180034C;
	Thu,  4 Jun 2026 16:38:58 +0000 (UTC)
Received: from localhost (unknown [10.2.17.68])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4458A27A;
	Thu,  4 Jun 2026 16:38:56 +0000 (UTC)
Date: Thu, 4 Jun 2026 12:28:53 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Dorinda Bassey <dbassey@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Albert Esteve <aesteve@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev,
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>, Mark Burton <MBURTON@qti.qualcomm.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260604162853.GC115597@fedora>
References: <874ijtz038.fsf@draig.linaro.org>
 <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org>
 <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
 <20260601090953-mutt-send-email-mst@kernel.org>
 <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
 <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
 <20260601151815.GC411459@fedora>
 <20260601160352-mutt-send-email-mst@kernel.org>
 <CACzuRyxedVMHNGkRf7AVyPWUTMgBMa6_DBnSHn+V6H7wN7XzWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DetFCX6AZnDHq900"
Content-Disposition: inline
In-Reply-To: <CACzuRyxedVMHNGkRf7AVyPWUTMgBMa6_DBnSHn+V6H7wN7XzWw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95


--DetFCX6AZnDHq900
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 12:38:27PM +0200, Dorinda Bassey wrote:
> Hi All,
>=20
> Following up on this discussion: Albert, Stefano and I are organizing
> a BoF session on vhost-user for Linux Plumbers Conference, so this
> thread is very timely.
>=20
> > I get a sense that this is about politics in the end. Do people feel
> > they are not represented and would like to have more influence in the
> > vhost-user spec?
>=20
> I think the core issue is that vhost-user has grown beyond just QEMU.
> The spec is now implemented by rust-vmm, cloud-hypervisor, crosvm,
> libkrun, and others. All of these projects depend on the spec as their
> source of truth for interoperability.

vhost-user was always an effort spanning multiple projects - that is
fundamentally the purpose of the vhost-user protocol - so it bothers me
when it is framed this way. CrosVM implemented a vhost-user front-end
years ago. Features have been added to the spec that are not used by
QEMU because the spec is for all front-ends and back-ends and their
different use cases, not just QEMU.

I'm fine with moving the spec to a separate project if it makes
day-to-day work easier, but it's not accurate to portray vhost-user and
the work that has been done by people from many projects in this way.

> There are also concrete technical friction points. Let me share some
> examples from rust-vmm:
>=20
> rust-vmm SHMEM PR https://github.com/rust-vmm/vhost/pull/251
> We had to wait for QEMU spec acceptance before merging the
> implementation. The spec update was delayed with the comment
> "should get picked for the next round" after QEMU freeze.

I am happy to merge a vhost-user spec PR into qemu.git during the freeze
if other projects need the spec change.

> rust-vmm PR https://github.com/rust-vmm/vhost/pull/339 : was
> kept as draft "waiting for QEMU spec changes to be finalized."
> It was eventually merged when they decided the spec was
> "stable enough" even though QEMU hadn't finalized it yet,
> which felt awkward.

In this particular case the QEMU patch series could have been split into
just the spec change and the QEMU implementation with a note in the
cover letter requesting to merge the spec change right away. I don't
think anything was fundamentally blocking the spec change, although
maintainers might be skeptical about rushing something that is still
work in progress. There was a lack of communication here.

> When multiple independent implementations wait on one
> project's release cycles, it raises the question of whether the
> governance model matches the ecosystem reality.

If the experience with QEMU's release cycle is the main point of
friction, then that is easy to solve by merging spec changes even during
freeze.

>=20
> > Why is the current system not neutral and how will the new system solve
> > that?
>=20
> For example the virtio-spec has OASIS governance where changes
> are proposed and merged independently of any implementation's release
> cycle. Whether that's the right model for vhost-user is worth discussing.
>
> > You bring up project neutrality and a model where Michael is no longer
> > the sole maintainer. It will be necessary to propose a concrete roadmap
> > and also to explain the concerns about neutrality more so it's clear
> > they won't be an issue anymore in the future system.
>=20
> You're right that we need a concrete roadmap before making changes.
> More reason to discuss in the BoF - to work this out with the people
> actually doing the work: you, Michael, Albert, and others who've been
> deeply involved. Maybe in the end the solution might be to "improve
> QEMU's process" (like Michael's submodule suggestion) rather than
> "move the spec." or something else? that's what we need to figure out
> together.
>=20
> Would folks here be interested in joining the discussion at Plumbers?

Plumbers in October? How about scheduling a video call in the next few
days instead of waiting. That will allow anyone to attend.

Stefan

--DetFCX6AZnDHq900
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmohp8UACgkQnKSrs4Gr
c8gICggAmfO31ycvI1saRRHQ8FbegJUjYWapIIaTNsyfKsiRkbF8eHyFSE8n5yHk
63/8TepFvCR96RWl0vs3g3iNenamRF6Entd7RsgmuLF+ZIYuw7l8a9TebV8niit7
cJ7gy7k7si2TSkoD+GcLhDZTQQQOLrO1tbTnYXiZhRoR0+Ja2hUnXQxZY8puL4ES
eNV/5XeXI3UFLZJmaQ4lL4eXl+kvFVXMOk7I8tfScY5KBTxEALJx5nFvcpwxRZUn
NF60X86/jcXqEJFKy36JCZkxKEYG1GXa9m2fIflLxlZofbDG/HdmIeZop3ADZbE2
77yByygMc2FyUBlUDcPHuozmYB1AHg==
=pPYA
-----END PGP SIGNATURE-----

--DetFCX6AZnDHq900--

