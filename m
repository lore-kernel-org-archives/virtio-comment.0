Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194444BCAF
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210649; cv=none; b=psdSOmcBnMe97MQPXP/kSN8G5DT/UdbEu4/EqEpumNN708iaOYEu6UB1AONrlf39TTFeLPqQOnZkheo4ulwVoaU9R8Jtqn98juHulKmOIdV7hI/HouiMVAeaFHoH+ppjDFd/VCNTjRmsy+Vj2TUE2C5O5VVhr94PpJ5s8T3vtRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210649; c=relaxed/simple;
	bh=TFP5LHuWA5LVKrNnDx0lXpo8afxDCZV5Rlf4d0ITUhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgY63wUrRbT+fyGm3omFVu9nhMD+AEb0kwVReHc2752z8lx7Ee+binoqn+B5bHetvZ/TjvjZQW3gZjsrpHdKv57f7Uwt3TpzZfbugHYtsK2HiUF1duaxiHOhxKa2FPhqlSTr/WJlMGFDmG3LjG6WAz5IZqCE/Eerp/GnFyXegAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KsMI53A/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsMI53A/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781210646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TFP5LHuWA5LVKrNnDx0lXpo8afxDCZV5Rlf4d0ITUhg=;
	b=KsMI53A/ZMsmhlR/Jf4GTVLhG+dKf3kdggH4qoQcxz6DMKE7PYmRKBJPIH1IT2HwUkTtIO
	PufdhTI89QK30RHIBLY4of0MXUd39SlIfDOMCB6oeL87tDkvz+DCHzx6Nc9zaZTsF7v4Ic
	w5GlzTPI7oe/+j0qR1rfTe0mZ+CdwwY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-wV9QdDB6NnK7RgZ2OMvUaA-1; Thu,
 11 Jun 2026 16:44:00 -0400
X-MC-Unique: wV9QdDB6NnK7RgZ2OMvUaA-1
X-Mimecast-MFC-AGG-ID: wV9QdDB6NnK7RgZ2OMvUaA_1781210637
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 839871956069;
	Thu, 11 Jun 2026 20:43:57 +0000 (UTC)
Received: from localhost (unknown [10.2.16.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A4A3C1955BE0;
	Thu, 11 Jun 2026 20:43:55 +0000 (UTC)
Date: Thu, 11 Jun 2026 16:43:54 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Dorinda Bassey <dbassey@redhat.com>,
	Albert Esteve <aesteve@redhat.com>,
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
Message-ID: <20260611204354.GC237427@fedora>
References: <20260601151815.GC411459@fedora>
 <20260601160352-mutt-send-email-mst@kernel.org>
 <CACzuRyxedVMHNGkRf7AVyPWUTMgBMa6_DBnSHn+V6H7wN7XzWw@mail.gmail.com>
 <20260604162853.GC115597@fedora>
 <CAJSP0QXR6MyqoE1Uh-X7DzsOabbbN69TUyxf8r6ghUDCQnrP=w@mail.gmail.com>
 <CAFEAcA_Kd5_k+XyagUbB2+YVEMB0Sb0AB=oUZu6bGDot9TaFrQ@mail.gmail.com>
 <CAJSP0QVuSvVwa1szAy_3WVtWOjGK=oYAXjqAzbg5YoEvgybRjA@mail.gmail.com>
 <20260609163536-mutt-send-email-mst@kernel.org>
 <CAJSP0QWP5OnSaed4xD0FomwVSs1mN7e_U2jaM9KPFEy2bWPrVQ@mail.gmail.com>
 <aimTUHRIOFwYXvpw@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a28pE0YQ6E9QR4Wi"
Content-Disposition: inline
In-Reply-To: <aimTUHRIOFwYXvpw@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


--a28pE0YQ6E9QR4Wi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 05:39:44PM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Jun 10, 2026 at 09:03:39AM -0400, Stefan Hajnoczi wrote:
> > On Tue, Jun 9, 2026 at 4:36=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Tue, Jun 09, 2026 at 03:44:49PM -0400, Stefan Hajnoczi wrote:
> > > > On Tue, Jun 9, 2026 at 2:51=E2=80=AFPM Peter Maydell <peter.maydell=
@linaro.org> wrote:
> > > > >
> > > > > On Tue, 9 Jun 2026 at 19:00, Stefan Hajnoczi <stefanha@gmail.com>=
 wrote:
> > > > > > I'm not sure if anyone brought up this topic on qemu-devel and =
with
> > > > > > Michael before. As I mentioned in my reply, there are ways to a=
void
> > > > > > blocking vhost-user spec changes when qemu.git is frozen:
> > > > > >
> > > > > > The simplest approach is to keep merging vhost-user.rst changes=
 during
> > > > > > freeze since it does not jeopardize the release or introduce
> > > > > > instability.
> > > > >
> > > > > I'm not enthusiastic about having "this one document is an
> > > > > exception to our freeze and release process". Because it is
> > > > > only documentation, it is in the same "we can be relatively
> > > > > relaxed about allowing in documentation changes" boat as
> > > > > most of the rest of the docs. But docs changes can break the
> > > > > build (e.g. if you mess up a rST syntax thing), so as we
> > > >
> > > > CI prevents broken rST from being merged (there are multiple jobs w=
ith
> > > > `--enable-docs`), so I'm not sure this can happen?
> > > >
> > > > > get closer to the final release we are going to get more
> > > > > strict about "is this change really necessary or can it
> > > > > wait a few weeks?", and they must at a minimum continue to obey
> > > > > the "no changes of any kind between the last RC and the final
> > > > > release" rule.
> > > >
> > > > Why is the final release candidate special?
> > > >
> > > > > And definitely if a patchseries has both
> > > > > QEMU code changes and documentation updates then that is
> > > > > going to not get applied during freeze if the code changes
> > > > > don't follow the freeze rules.
> > > >
> > > > I agree that code changes cannot be merged.
> > > >
> > > > As long as the vhost-user maintainer is confident that the spec cha=
nge
> > > > is implementable and stable, they can merge the spec change on its =
own
> > > > without code changes. If they are not confident, then the spec chan=
ge
> > > > isn't ready to be merged yet.
> > > >
> > > > Stefan
> > >
> > > I personally have been confidently wrong enough times. Maybe others k=
now
> > > how to do better.
> >=20
> > There is a risk with merging a spec change without a finished
> > implementation, so no one can get it right every time.
> >=20
> > I bring this up because a clear guideline would help implementers know
> > what to expect.
>=20
> I'd be inclined to require non-trivial spec changes to have an
> accompanying impl that is broadly feature complete, linked to by
> the contributor as a pre-req for merge.
>=20
> If an impl is not ready, then by all means send spec proposals
> for the sake of design discussions. It can evolve in parallel
> with the impl, but the spec doesn't need to merge until the impl
> is broadly complete.
>=20
> A code impl does not need to live in the same place as the spec
> though.

VIRTIO does things this way most of the time and it works well. The spec
needs to be merged before the implementations, but sending out the
implementation patches around the same time as the spec patches is
appreciated by the spec reviewers.

Stefan

--a28pE0YQ6E9QR4Wi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmorHgoACgkQnKSrs4Gr
c8imqQf/Tn+bfbqZoMdMDaqgBbnXN1SKdDqxFMsAjeUWA/WdHNiokz2dL6/+RLJp
3MC186U7dCGQaxS//n2Tff2TbX9ZXT1jN+TH+1PJVah8TImHxOeL15PsqVw5zf6j
DoPHuoNVy5KimPhn98GhNKaH4hr5rbsF/hIFY0ryMSNQ184WgW4K0XjAZ4+koGpJ
MjwkGMot1mtrhntCa8DlvFyjFChgwqwxKTZpNMAGsAHe6u/i8mo0MIrgfw1ObAhT
UH5wJBVhK7rbC+dUVoILt+WLWCNeOfDiGvLmyu9Pz/G0Y0AZwruK4epHyI/M5g4r
9Hsp6t/kIcGELT44IcZWP0Ci/Ss4+Q==
=r8/a
-----END PGP SIGNATURE-----

--a28pE0YQ6E9QR4Wi--

