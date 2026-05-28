Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC22877DA
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976382; cv=none; b=F3UP7YuavmCpgC9TEA42YZZ57abd1HtvTZl2ku+p0zUWKDq0EyPb/EX5VoQDi+pnsw1wOW4IijdYu3fXB3V9o3Il7+KEQnRr++xszH8ZsAahbQyu9oFFzdPWTanX41giu+F/jm0eJqm4wbZySRco9p7F+PpIHiA+24ey7WY5y8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976382; c=relaxed/simple;
	bh=xiGOwZBAv/FC5BnqPTgsYGCe9frl6SbtA2nY3+bnyX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uA2/heUWF5BfKN8OaB/4SMfZHy8c2rQ0UPpgc1qe8qWUwSBy57D0PqHpIxVPD9GE6dqcZIWS/vgtknHpLeiYkvLPQ/X4gUoMUHuNRceDOMoCHa80n7AG43cOGI59TlrwxbHXXWYxzEjUjoRwf6vxY90E/cJ91IxXBEYcM9gqVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C3bIXrtx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C3bIXrtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779976379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O5UeLcR76MMAvcZF8IAcwZvzuHaEluInyW9btDbcnG0=;
	b=C3bIXrtxnGdfOhT6pXU2aDQSP3LN7TsWCM8/SqlVhrRSU3lVbz1eoltzd+H786ogg9LyIP
	ccBjbrkcVlEBnfV/OHC4I2u40JsdpOelx5NwFikXLTzoVB2JhKbJOwrv33eHxqQndZV+O8
	YEJfzOoa9er+o/Vj+F9JnGKmYYdHpTc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-348-M7HBtyT5NoqLBZsKDHuNTg-1; Thu,
 28 May 2026 09:52:55 -0400
X-MC-Unique: M7HBtyT5NoqLBZsKDHuNTg-1
X-Mimecast-MFC-AGG-ID: M7HBtyT5NoqLBZsKDHuNTg_1779976373
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F98B19560B7;
	Thu, 28 May 2026 13:52:52 +0000 (UTC)
Received: from localhost (unknown [10.2.16.62])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E64E1800347;
	Thu, 28 May 2026 13:52:50 +0000 (UTC)
Date: Thu, 28 May 2026 09:52:49 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alyssa Ross <hi@alyssa.is>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>, Rob Bradford <rbradford@meta.com>,
	Bo Chen <bchen@crusoe.ai>,
	"dev@lists.cloudhypervisor.org" <dev@lists.cloudhypervisor.org>,
	Spectrum OS Development <devel@spectrum-os.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: Vhost-guest (was virtio vhost-user) vs virtio-msg
Message-ID: <20260528135249.GC40266@fedora>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
 <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <CAAjaMXYGMTok_a2CJK8aKSqbTbgLx1CbkCVZw2VnZdJVuPJ38w@mail.gmail.com>
 <4ba67246-3a2b-43ee-b827-000c16ff07ed@gmail.com>
 <ahf72UIEHoKEzEvp@mbp.qyliss.net>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e0N80g+H0b1NAbA1"
Content-Disposition: inline
In-Reply-To: <ahf72UIEHoKEzEvp@mbp.qyliss.net>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


--e0N80g+H0b1NAbA1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 10:56:35AM +0200, Alyssa Ross wrote:
> On Thu, May 28, 2026 at 02:59:13AM -0400, Demi Marie Obenour wrote:
> > On 5/28/26 01:47, Manos Pitsidianakis wrote:
> > > On Thu, May 28, 2026 at 8:22=E2=80=AFAM Parav Pandit <parav@nvidia.co=
m> wrote:
> > >>
> > >>
> > >>> From: Demi Marie Obenour <demiobenour@gmail.com>
> > >>> Sent: 28 May 2026 05:23 AM
> > >>> To: virtio-comment@lists.linux.dev
> > >>> Subject: MSI-X vector limits and reserving a virtio device ID
> > >>>
> > >>> I'd like to reserve a virtio device ID for virtio vhost-guest,
> > >>> formally virtio vhost-user.  Would this be possible?
> > >>>
> > >> Vhost user is an implementation of the device.
> > >> I believe it stays as implementation and not a new device type.
> > >
> > > This exactly.
> > >
> > > Furthermore, we already have a mechanism for "providing" an arbitrary
> > > virtio device; it's called a transport.
> > >
> > > Demi, I suggest you look into virtio-msg transport, which would allow
> > > you to do what you want.
> >
> > I'm aware of virtio-msg, and in fact considered using it.  However, I
> > found that virtio-msg doesn't meet my requirements.
> >
> > 1. Virtio-msg needs to run over a transport of its own.  None of the
> >    proposed transports support KVM guests on x86.  FF-A is the only
> >    one that would make sense with KVM, but FF-A is specific to Arm.
> >
> > 2. Virtio-msg isn't compatible with existing frontend VMMs.
> >    Vhost-guest can be used with any frontend VMM that implements
> >    vhost-user.
> >
> > 3. Virtio-msg isn't compatible with existing frontend drivers.  While I
> >    expect that drivers for Linux will eventually be upstreamed,
> >    I doubt that drivers for Windows or *BSD will ever be written.
> >    I don't even know if the Windows Driver Framework provides enough
> >    to write one.  I don't need this myself, but I suspect that this
> >    is enough to make virtio-msg unsuitable in many environments.
> >
> > 4. Virtio-msg requires invasive changes to existing userspace device
> >    implementations.  The project I work on doesn't use QEMU, and the
> >    existing frontends are targeted at server use-cases.  Using the
> >    vhost-user protocol lets me reuse these with little effort.
> >
> > 5. To the best of my knowledge, virtio-msg doesn't support live
> >    migration of frontend VMs.  Vhost-guest uses the vhost-user
> >    protocol, which has supported this for a very long time.  I don't
> >    need live migration myself, but for many server use-cases, not
> >    having live migration is a dealbreaker.
> >
> > 6. I don't know if virtio-msg can achieve comparable performance.
> >    It appears to be optimized for reliability and isolation,
> >    not processing tens of gigabits of network traffic per second.
> >    Vhost-guest is designed with performance in mind.
> >
> > Vhost-guest is designed for storage and networking appliances on
> > servers, whereas virtio-msg is designed for safety-critical embedded
> > systems.  These domains have very different requirements, and as a
> > result they arrived at very different solutions.
> >
> > I work on Spectrum (https://spectrum-os.org), which uses Cloud
> > Hypervisor.  As the name implies, Cloud Hypervisor is primarily
> > intended for cloud workloads, though it can also be used on clients.
> > I don't think that an implementation of virtio-msg would be accepted,
> > as it benefits none of Cloud Hypervisor's other users.
>=20
> It would benefit them just as much as a virtio-vhost-user device would,
> surely?  (And that's not a great justification from a spec point of view
> regardless=E2=80=A6)
>=20
> But I think it's worth stepping back here and providing some context.
> virtio-vhost-user is an idea that's been kicking around in various forms
> since 2015, with incomplete implementations for QEMU, crosvm, and DPDK.
> It's been picked up by a number of different people during that time,
> and to my knowledge has only failed to make it across the line due to
> lack of investment.  There's clear demand for a way to run a vhost-user
> device inside a VM.
>=20
> Links to previous iterations:
>=20
> =E2=80=A2 Discussions about VVU vs. virtio-msg:
>   https://lore.kernel.org/virtio-comment/b291c8af-58ee-46e4-9033-e681ff96=
77db@gmail.com/
>   https://lore.kernel.org/virtio-comment/89d13644-04ac-4057-b197-a6efe5e8=
2ef6@gmail.com/
>=20
> =E2=80=A2 Inquiry into the possibility of this functionality:
>   https://lore.kernel.org/virtualization/ff2b81b0-04ba-49b7-8a4e-089f1c87=
5744@suse.com/
>=20
> =E2=80=A2 Most recent previous draft VIRTIO spec submission, with links to
>   implementations:
>   https://lore.kernel.org/virtio-dev/20221007165643.3920613-1-usama.arif@=
bytedance.com/raw
>=20
> =E2=80=A2 Another inquiry about how to do it:
>   https://lore.kernel.org/qemu-devel/CADx_CBPzAstC0o9X6CrnyFqYYAtPbw5-XHW=
xmXTt6+LyYb-U3g@mail.gmail.com/
>=20
> =E2=80=A2 Implementation in crosvm:
>   https://chromium-review.googlesource.com/c/chromiumos/platform/crosvm/+=
/3146213
>=20
> =E2=80=A2 My own initial inquiry about it:
>   https://lore.kernel.org/qemu-devel/87h7u1s5k1.fsf@alyssa.is/
>=20
> =E2=80=A2 The last of another round of spec submissions:
>   https://lore.kernel.org/virito-dev/1561418997-24608-1-git-send-email-nd=
ragazis@arrikto.com/
>=20
> (and more going back further)
>=20
> My point here is that VVU has been the go-to answer for how this problem
> could be solved for a very long time, during which an objection to a
> VIRTIO device used to implement other VIRTIO devices hasn't been
> widespread.  I'd be interested to understand what's changed there, if
> indeed anything has.  Is it just that virtio-msg now exists?
> Transporting VIRTIO over a stream isn't a huge leap, but the
> participants in prior discussions didn't suggest it as an alternative.
> From where I stand, virtio-msg seems at best an unproven and far-off way
> to accomplish this, whereas VVU has proven to work, at least well
> enough to have been considered worth putting in work to try to move
> the spec forward for multiple different (as far as I know) independent
> efforts over the years.

Both virtio-vhost-user and virtio-msg their own pros/cons and use cases.
Neither one comes out ahead in all cases, so I think it makes sense to
have both.

Demi, if you want to get the spec merged and are willing to participate
in maintenance (answering questions, reviewing spec extensions, etc)
then that would be nice. I will be around to transfer any knowledge I
still have of virtio-vhost-user and review the patches.

Stefan

--e0N80g+H0b1NAbA1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmoYSLEACgkQnKSrs4Gr
c8h3bQf+IVJFlOqroFfITTXbZsG9710YqdE33l8jY8SR4Iygu8XqNVBI7uV6pJg2
chB39wyIYtin3gCRoKEGdmwpzV2J57SN60f+Ivb0zDc5bxLmokpmkDH2tXO/+qwp
yuXiTg4EfGVJ1Uum67ODfo9XY+1h5tUmwrKIrpEAorYV72qIiZw/NlWGhENtCum7
Fmm7st1ozalQD81wS/Ym+nhVdnNH28hMfyct4edAuiBoo0hkG6h2aW+ay8cfdLHX
mBC05DNX4Lljhs+WA8FF7R0M7PHPbSDknBznzIpf+znueRSMZ8x4lSQnIIKEkGF4
+49iMmPyNhBstaNMvMtcK+r3CJsK+A==
=rbML
-----END PGP SIGNATURE-----

--e0N80g+H0b1NAbA1--

