Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833583DB318
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327110; cv=none; b=OOWFe+NSngPGw4/9tBs3iNpuV4sYFtA/988A4VP9oLC986G0adElfLR5rrn6dHuSaacvz9I5XhKuRDiJA44XJTSkS1g2SJUoqWX+h9rjH6INPwxrgxGK16uMGHZxgo+5IWuSRyD5Y95N8f40gnmfwNV/xqUwWqBmIjFgRC4bAs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327110; c=relaxed/simple;
	bh=SAI/oedHJBBgHUxep7npuP6FpUlvJ17Pe57euEJl6E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACPb6qZlgBgiY3bcsnUVtsT3sSxKlyRi2dp9BksJVJ/yITxQbe4p+8fhxPoVltXjCGxl77bASzikO/lYtQwQyNLFK2JQYvWiUCvBI3TOYkNDTaxEuH5dhbCWWBuJENT/KsLdvpyjppVxLl6N5k04zgxALiULaQ4UIiFo2vZH8ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhQUaFyr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhQUaFyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780327104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt3eyMH0ipYhRk9m1oEQ4cSndFpI0aHFkvbSlW+mJ4A=;
	b=dhQUaFyr0ewTo17wmRRWtns78dPP3x+9tEI5L/M16P4bEqalFEoT4CnUIGSyFAnRaeQ+kQ
	VQ5JhCi+kNmuddPbSJYRPw3o+IirNUKiXpT6DXmxq9Feh7gaWiTfpGaRjG2wM1dQC6hOZE
	/dnp9dKvgGuy3RZtPGz8WLXYqsyMl0A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-pfvITQBVNVynAQHGWMtMBA-1; Mon,
 01 Jun 2026 11:18:21 -0400
X-MC-Unique: pfvITQBVNVynAQHGWMtMBA-1
X-Mimecast-MFC-AGG-ID: pfvITQBVNVynAQHGWMtMBA_1780327099
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 115BF1956095;
	Mon,  1 Jun 2026 15:18:18 +0000 (UTC)
Received: from localhost (unknown [10.2.16.102])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 63D201684;
	Mon,  1 Jun 2026 15:18:16 +0000 (UTC)
Date: Mon, 1 Jun 2026 11:18:15 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev,
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>, Mark Burton <MBURTON@qti.qualcomm.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260601151815.GC411459@fedora>
References: <874ijtz038.fsf@draig.linaro.org>
 <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org>
 <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
 <20260601090953-mutt-send-email-mst@kernel.org>
 <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
 <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HQ4jA1N2etY42/kr"
Content-Disposition: inline
In-Reply-To: <CADSE00+ziHc8W2FqNT-aJU0Lt4sZ=NfQLc65m16vpT++pZM+xQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95


--HQ4jA1N2etY42/kr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 04:27:46PM +0200, Albert Esteve wrote:
> On Mon, Jun 1, 2026 at 3:51=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.co=
m> wrote:
> >
> > On Mon, Jun 1, 2026 at 9:12=E2=80=AFAM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Mon, Jun 01, 2026 at 03:05:50PM +0200, Albert Esteve wrote:
> > > > On Mon, Jun 1, 2026 at 2:39=E2=80=AFPM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> > > > >
> > > > > On Mon, Jun 01, 2026 at 02:32:11PM +0200, Albert Esteve wrote:
> > > > > >  But also because, in my opinion, separating
> > > > > > the specification would improve development agility by decoupli=
ng
> > > > > > specification development from QEMU's review and release cycles.
> > > > >
> > > > > Generally for QEMU this will be less agility, unless I misunderst=
and
> > > > > what is proposed)
> > > > >
> > > > > Because presumably there will need to be spec releases then?
> > > > >
> > > > > So
> > > > >         new feature -> spec tree -> spec release -> qemu implemen=
tation -> qemu release
> > > > >
> > > > > is surely longer that what we have now.
> > > >
> > > > I see your point.
> > > >
> > > > However, we do not really need to introduce a heavy release managem=
ent
> > > > layer. We could just operate it as a living document, where the main
> > > > branch is the authoritative source of truth.
> > > >
> > > > For the workflow, development doesn't have to be strictly sequential
> > > > either. A contributor can propose the spec update while working on =
the
> > > > implementation, much like we do for VirtIO updates. Actually, this =
way
> > > > one update/change supports the other.
> > > >
> > > > I guess my point is that a dedicated repository could lower the
> > > > barrier for new changes AND keep QEMU's own development speed mostly
> > > > unaffected.
> > > >
> > > > BR,
> > > > Albert
> > >
> > > Something something submodule? Possibly. If you want to make progress
> > > on this, pls think of the process, try it out.
> >
> > If I understand correctly, the motivation for moving the spec
> > somewhere else is to replace the email patch review process with a git
> > forge review process?
> >
> > This seems like a superficial change and is not worth in my opinion if
> > you consider we'll have to redirect from the old spec location and
> > move the community over to the new repo.
>=20
> The core issue from my perspective is project neutrality and
> decoupling lifecycles.
>
> Currently, protocol updates are tied to QEMU's tree rules and release
> freezes for example. Since these changes also affect other projects
> (like rust-vmm, crosvm, DPDK, etc.), separating them may make sense
> and could streamline the process.

I don't see a reason to block vhost-user.rst changes during QEMU's
freeze. If Michael sent a vhost-user spec pull request during freeze I
would merge it.

> >We could actually lose spec
> > change reviewers in the process either because they don't know what's
> > going on or decide that they prefer to spend time elsewhere when faced
> > with switching processes (the people who review and participate in
> > discussion do so out of personal interest and as far as I'm aware no
> > one is employed to work on vhost-user as their #1 priority).
>=20
> This is a fair concern. I hope we maintain reviewer engagement. But it
> could also be argued that contributors from other communities may be
> more comfortable with a dedicated project-neutral home. It could well
> go both ways, but it also represents an opportunity to grow.
>=20
> >
> > Having said that, here is what I imagine it would involve:
> >
> > 1. Michael creates a new repo on a git forge (if he wants it to be
> > under the GitLab qemu-project organization I can help with creating
> > the repo, otherwise he creates a new organization and repo).
> > 2. Discussion happens in Issues.
> > 3. Spec changes are proposed in Merge Requests. Michael merges them
> > once consensus has been reached.
>=20
> Mostly yes, though we wouldn't necessarily need Michael as the sole
> gatekeeper. We could invite co-maintainers from other key projects to
> share the reviewer load.
>
> Also I'd want to clarify that although I am advocating for this
> change, I do not claim to have the definitive roadmap. I am just
> sharing my view on why this could be a positive evolution. Consensus
> may end up being to remain with the current status quo, or any of the
> other options proposed by Alex.

I get a sense that this is about politics in the end. Do people feel
they are not represented and would like to have more influence in the
vhost-user spec?

You bring up project neutrality and a model where Michael is no longer
the sole maintainer. It will be necessary to propose a concrete roadmap
and also to explain the concerns about neutrality more so it's clear
they won't be an issue anymore in the future system.

Why is the current system not neutral and how will the new system solve
that?

Who should be a co-maintainer?

Stefan

--HQ4jA1N2etY42/kr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmodorcACgkQnKSrs4Gr
c8hXJAgAxVdjUSAgTFp31oFqwGcwdKTPiiBXlpCbBdIq2oWW0N0+xIbmowne/48I
zjsG+6JgWNqnzZ5U7FFCQ9EuD72ovhkCo0RHvYA3YEg/i70vqaeG8d68UDJRE5YZ
21dAoXmjVGgJJaMpfho5DXGylcm/hp38rAe6qEqCNA0U2VJX74chbRdcZrS1rV6O
g8hdgasuFd0cuiYBqs5Swk9GN3YLAQx/zxFFmUJImSOYvASQ/ha67N+UguLeFbtN
muEPBSq83QIkwbGN8Nk0OdKlqwDoKDUOapjEp/rrTTOA85NFbFQC/WAOZEFEqltL
v8Nst8Xif4sIOnpYurLrsu6bVUlRsA==
=mxa9
-----END PGP SIGNATURE-----

--HQ4jA1N2etY42/kr--

