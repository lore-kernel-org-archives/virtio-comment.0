Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3933A7F40
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333119; cv=none; b=BUv6Cjpqbdx7hb62gnGcRAfDCaLsKioWUr4DAlffnFm+wU6m4YT2Pc61ijdte2p5lTGOFZKaJYlWg/ygNJouUZPhrzVZSblja6nprS/NqzyBzv/xGnvh0mfi0zUGPNJJmouM8l6/93GV5xnbxH4hvkqiIKSKqeXDeq+KzU1V0Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333119; c=relaxed/simple;
	bh=Sh+jV7CKW12s2jkvHrjfnyGGhQaNgXResj42Sa6cnPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz+vgcsrdmO86DxzlwK0Yl7v7EBiLH/QfKA2ifJGGv7OgoEs4oLMi7D/XrW0rmwnPNsiKZ6E/IKAHvYZdXDOclY3KcbsT5R4FLbdkuhJpQuGTdkKX1MZ074byVWo3r+y/fRDcw0SRUTMkrZ033sxxcdAB2y+dRRDQP4kFDMRoFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bM5LjzR6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bM5LjzR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780333116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ybkj6mEhgP8eAxFJNLPjYomL7/a72+5yaRdPCUasjg0=;
	b=bM5LjzR6rEtGSMhdI7wR8cFsvFklzHKAsX+X+TWi7wmi+md7Ri65c9fvnDJ8lvoFDVYZap
	jwctwmpgSMwTjIM8d0PEKSBAU95ACWhg0t93vGBls658/zmB0feVVeHlnOlamdDo2gR6rW
	zBJQ8G8jxJhWvXCqExKQbVzuP0RJiKY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-349-4UzV70gwOYORGoLUM3vRNg-1; Mon,
 01 Jun 2026 12:58:32 -0400
X-MC-Unique: 4UzV70gwOYORGoLUM3vRNg-1
X-Mimecast-MFC-AGG-ID: 4UzV70gwOYORGoLUM3vRNg_1780333110
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A00A61956094;
	Mon,  1 Jun 2026 16:58:29 +0000 (UTC)
Received: from localhost (unknown [10.2.16.102])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D4FA71800577;
	Mon,  1 Jun 2026 16:58:27 +0000 (UTC)
Date: Mon, 1 Jun 2026 12:58:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
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
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260601165824.GA428611@fedora>
References: <874ijtz038.fsf@draig.linaro.org>
 <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org>
 <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
 <20260601090953-mutt-send-email-mst@kernel.org>
 <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
 <20260601102216-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gas364zqSwtfrver"
Content-Disposition: inline
In-Reply-To: <20260601102216-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


--Gas364zqSwtfrver
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 10:22:32AM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 01, 2026 at 09:51:40AM -0400, Stefan Hajnoczi wrote:
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
> >=20
> > If I understand correctly, the motivation for moving the spec
> > somewhere else is to replace the email patch review process with a git
> > forge review process?
>=20
> wait who said that?

I thought that's what the issue ultimately comes down to but it's clear
now that's not it.

Stefan

--Gas364zqSwtfrver
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmodujAACgkQnKSrs4Gr
c8iMnAf9FhEItYatirGCRYlUNMtMnIJh1WEgBLyVx4ky+bk7z8ymjwkelgdzS3al
kjlqNgY8W0r8acJQfpLCFWC8Sn7gpDvlVV8761wskleBkCUk19DM5HHYpG/8e7bZ
bggBp9QsfuumCelE5rx4ePa8ria9EmxChbMyQ1fy1318FK8tI8omZddUvX9RrvQg
tkYu9svT9hGeul5H2KlhvpS2HHdbCs6CvpSckp04/gP+dDvCdOr+Qwn8FKGOkNMx
gz8GHZMlKuBuFj/di3CFc1yaXposopIjNl0bDZ4p7/o8vT3/7D+rgiY+EyEku5ox
oVW1egvEDYlKV3JLDUN+M9GkYyhqpQ==
=y53Q
-----END PGP SIGNATURE-----

--Gas364zqSwtfrver--

