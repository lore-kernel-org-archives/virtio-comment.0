Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7FC38B12C
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958605; cv=none; b=MMCljWxn5bLOHNM3XZG8QRDeX+eiNw4pZvuQOJvbj4Kd7wo7JGlPOpu/EgUSgJmDCewSYNwzXXbxx05st5wpGEo+QUjDC3QySgyV0cFEcsALzsPZDhQW2U6o4wBxnKhjp35Q2xeztlpVbpNX6bYG+HZbU+x+vAT2r9tt4KOPNAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958605; c=relaxed/simple;
	bh=N0AukWndR+y+wxeI8NDOdDzP0tpPbjBCtwFG/bTcQOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hs4b0nDwoFLH3z0df26xk3TstGKKa0FCkA6zzjzXiEj/pEMX1CjZ3nv7AhWC77Ay4HC77fYdZR8AoHA3wFh+q1NWPU7yi5Il2Md/JdxAmLKp+I6HoiTgYPwLXHvkudBAOzV500NxOG8k3gXLNfOg7130JEU80YF6FlTcJ/JkHV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alyssa.is; spf=pass smtp.mailfrom=alyssa.is; dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is header.b=o3bF9DCm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TePHscoX; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alyssa.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alyssa.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alyssa.is header.i=@alyssa.is header.b="o3bF9DCm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TePHscoX"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 456A17A00E0;
	Thu, 28 May 2026 04:56:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 28 May 2026 04:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1779958598; x=1780044998; bh=OBDjLMCzFR
	wIW7RPgx7b2dUbiMh/ftUTiapFhyVbS2w=; b=o3bF9DCmUWKdO2xTgktpPbKv2x
	UEyUqnQhEQ5sZlnqr71wrtKvpfcP7+0Kw7QEmfa9p6hqk3gycNwNtk3xzH7Q5JMJ
	g8flDik92BWMRDwX8cHVBhpTfYSSWmwIKEYZeRTGluIjhIInVHDnIiIG+5FMY6vC
	EG/Bk4r05BRLaN9oHJKjmDjKhl7gpi4OS0oTUs2vZENyyfJNS8cc5r4Q5EvTV27T
	E5ydKZ85LCCiA7AiP/F4FPttbZL165ikriUOl1qPLYZMI0OokOdi7MppQao3Dmdw
	NYd5H6cUN0z22QR1FK4HgE00jA++rV4i0TOniBtAYOsEUDX/GRr2i4bWpgvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779958598; x=1780044998; bh=OBDjLMCzFRwIW7RPgx7b2dUbiMh/ftUTiap
	FhyVbS2w=; b=TePHscoXh4wDnw2jTufyx+eogyTJ8f8mHKsO3qMNpdzh1yopWdE
	ip3A0FBUA8qhG3yx3gINt5OoX7rvN6RQwTFjvEn1Z4dyRFgI5sNGh/gYKNm5mxy9
	+DBLiCINYFpAp7H932ilyIiGgtw0/sjm08g7kYQ4/+qQPbdjT2Ec9y+gyUjiAq32
	tvtaPNR36RQ5NlzbfNCDcOq0AJ8Ty8quYK5gLu7oPpQY9bNaKaTM2Rz16SBq5hV5
	Ey/LvHTTMTDlevaGXhtaV8Ggzs0FPB9yGf5AaOiHt+Apdy0/I6vy0KO5V3OLr4ub
	rGgmLBuXK5FJI6frUnUTXaR99OCpvL4BKiQ==
X-ME-Sender: <xms:RQMYaqsivkTqF24Vi8_uhrnq9iej5-FuJyeGRJ-pkkMoetPee_q6Ww>
    <xme:RQMYaihmM4g-5tPT9EEUSZGYDSSwcw33NYtpmlf2_S0mNJKIDgMgZ_nk_BIw5XJtX
    WEjVvlXjaMAyLug48bbT8047qU3PLzl24VKJqhfTEFiRF4_73ZFWw>
X-ME-Received: <xmr:RQMYagZHqGRxaab_vJWtCmo3aYIKcCqVtbMz99nqTzXTsxm1GnqUxP5BeMi137F81P6HmrMciHUbqYMRK3_EfOuzxdwxQ98_JcQokE24>
X-ME-Proxy-Cause: dmFkZTEfukrR8fF+yvIEuiGkxwpexdsQRi5wFJjDe9ZBy+ag3/lKcWoV+eFlPAAT1jfph9
    Ubzzd8YxHvZKmG/1yU/e/hBCynInXfJAbYfxL/ZDupvoTySNGPQdSO6z+cDnvmZy0EIlLj
    MLEJfuTH0rJMFy56kCCGLY3y69JlUsz+X1ecn/md5bCLmTnPIZ3HCyFXACqmTlWWhhWYJh
    exCDo8GCJ1mBXxwndXOR5kf3VlfreVPcuHhOV2jT/JF1Ub+z518fiFd6kclysu/BJ8Vj5s
    lxaeQxOZgZFBO3rGz7EL2OQrHNYsiNQFIGlP6UWvUPQcI4fFJYp/gBpbTohbxXIgKnOSV3
    1d+WnHmXrozU4cICK8gL9vFYkSH009FSV8oWg5Da3IDd6vmXiaVdEhThbfXwxTgGbMygqa
    QOIhcCMhDGGy8u0gxqvYjVW/NrWwqT+lAN1AeP3rZ85ChOt0+K4aHwWlylBHZVvzNCKhx2
    PZrcPMUqBDMQwYf8e+6bADLk/jMDF73swQph1l4UatvSRwrYKWgd9c38KO8V7CU5V96RYI
    zGRaIH8Ekn/y7aHYG+w0I7ChLP9aCK+QTXrA2jysPNK4elA9GSgwekDOouiu9+vvATUdUH
    lDg02+UWpIEbrfNV0aOrwlluywqlrgDyLWthLP8IH4Uiqa6TWggtiVqeAt5A
X-ME-Proxy: <xmx:RQMYahYZAJILxHMLRo9bJ6CNlDg2Mllp8_IWxpkeU9zC1OagaFgnsg>
    <xmx:RQMYalzbnAhZy43v2XnJNlNqbAGxziidY9o2iLiQWfUOKrPmDl0o8Q>
    <xmx:RQMYatceIFuqIbptctcEHaHCSFrQbd4qZvXwvhPYF84CvUrdzYM_KA>
    <xmx:RQMYaq4NERK_TCBc5yASQlnGvzzpNySsTtvUuj6eLZHeL4c_B51E0w>
    <xmx:RgMYaiGc-zTCXWrEJ73xRUXfyzjM9yAZUcxS3Y5Nhv07IwEa6wcMVgEc>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 May 2026 04:56:36 -0400 (EDT)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
	id D63D781B4AEB; Thu, 28 May 2026 10:56:35 +0200 (CEST)
Date: Thu, 28 May 2026 10:56:35 +0200
From: Alyssa Ross <hi@alyssa.is>
To: Demi Marie Obenour <demiobenour@gmail.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Parav Pandit <parav@nvidia.com>
Cc: Rob Bradford <rbradford@meta.com>, Bo Chen <bchen@crusoe.ai>, 
	"dev@lists.cloudhypervisor.org" <dev@lists.cloudhypervisor.org>, Spectrum OS Development <devel@spectrum-os.org>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: Vhost-guest (was virtio vhost-user) vs virtio-msg
Message-ID: <ahf72UIEHoKEzEvp@mbp.qyliss.net>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
 <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <CAAjaMXYGMTok_a2CJK8aKSqbTbgLx1CbkCVZw2VnZdJVuPJ38w@mail.gmail.com>
 <4ba67246-3a2b-43ee-b827-000c16ff07ed@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rbmbjv33er3uphxf"
Content-Disposition: inline
In-Reply-To: <4ba67246-3a2b-43ee-b827-000c16ff07ed@gmail.com>


--rbmbjv33er3uphxf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Vhost-guest (was virtio vhost-user) vs virtio-msg
MIME-Version: 1.0

On Thu, May 28, 2026 at 02:59:13AM -0400, Demi Marie Obenour wrote:
> On 5/28/26 01:47, Manos Pitsidianakis wrote:
> > On Thu, May 28, 2026 at 8:22=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> >>
> >>
> >>> From: Demi Marie Obenour <demiobenour@gmail.com>
> >>> Sent: 28 May 2026 05:23 AM
> >>> To: virtio-comment@lists.linux.dev
> >>> Subject: MSI-X vector limits and reserving a virtio device ID
> >>>
> >>> I'd like to reserve a virtio device ID for virtio vhost-guest,
> >>> formally virtio vhost-user.  Would this be possible?
> >>>
> >> Vhost user is an implementation of the device.
> >> I believe it stays as implementation and not a new device type.
> >
> > This exactly.
> >
> > Furthermore, we already have a mechanism for "providing" an arbitrary
> > virtio device; it's called a transport.
> >
> > Demi, I suggest you look into virtio-msg transport, which would allow
> > you to do what you want.
>
> I'm aware of virtio-msg, and in fact considered using it.  However, I
> found that virtio-msg doesn't meet my requirements.
>
> 1. Virtio-msg needs to run over a transport of its own.  None of the
>    proposed transports support KVM guests on x86.  FF-A is the only
>    one that would make sense with KVM, but FF-A is specific to Arm.
>
> 2. Virtio-msg isn't compatible with existing frontend VMMs.
>    Vhost-guest can be used with any frontend VMM that implements
>    vhost-user.
>
> 3. Virtio-msg isn't compatible with existing frontend drivers.  While I
>    expect that drivers for Linux will eventually be upstreamed,
>    I doubt that drivers for Windows or *BSD will ever be written.
>    I don't even know if the Windows Driver Framework provides enough
>    to write one.  I don't need this myself, but I suspect that this
>    is enough to make virtio-msg unsuitable in many environments.
>
> 4. Virtio-msg requires invasive changes to existing userspace device
>    implementations.  The project I work on doesn't use QEMU, and the
>    existing frontends are targeted at server use-cases.  Using the
>    vhost-user protocol lets me reuse these with little effort.
>
> 5. To the best of my knowledge, virtio-msg doesn't support live
>    migration of frontend VMs.  Vhost-guest uses the vhost-user
>    protocol, which has supported this for a very long time.  I don't
>    need live migration myself, but for many server use-cases, not
>    having live migration is a dealbreaker.
>
> 6. I don't know if virtio-msg can achieve comparable performance.
>    It appears to be optimized for reliability and isolation,
>    not processing tens of gigabits of network traffic per second.
>    Vhost-guest is designed with performance in mind.
>
> Vhost-guest is designed for storage and networking appliances on
> servers, whereas virtio-msg is designed for safety-critical embedded
> systems.  These domains have very different requirements, and as a
> result they arrived at very different solutions.
>
> I work on Spectrum (https://spectrum-os.org), which uses Cloud
> Hypervisor.  As the name implies, Cloud Hypervisor is primarily
> intended for cloud workloads, though it can also be used on clients.
> I don't think that an implementation of virtio-msg would be accepted,
> as it benefits none of Cloud Hypervisor's other users.

It would benefit them just as much as a virtio-vhost-user device would,
surely?  (And that's not a great justification from a spec point of view
regardless=E2=80=A6)

But I think it's worth stepping back here and providing some context.
virtio-vhost-user is an idea that's been kicking around in various forms
since 2015, with incomplete implementations for QEMU, crosvm, and DPDK.
It's been picked up by a number of different people during that time,
and to my knowledge has only failed to make it across the line due to
lack of investment.  There's clear demand for a way to run a vhost-user
device inside a VM.

Links to previous iterations:

=E2=80=A2 Discussions about VVU vs. virtio-msg:
  https://lore.kernel.org/virtio-comment/b291c8af-58ee-46e4-9033-e681ff9677=
db@gmail.com/
  https://lore.kernel.org/virtio-comment/89d13644-04ac-4057-b197-a6efe5e82e=
f6@gmail.com/

=E2=80=A2 Inquiry into the possibility of this functionality:
  https://lore.kernel.org/virtualization/ff2b81b0-04ba-49b7-8a4e-089f1c8757=
44@suse.com/

=E2=80=A2 Most recent previous draft VIRTIO spec submission, with links to
  implementations:
  https://lore.kernel.org/virtio-dev/20221007165643.3920613-1-usama.arif@by=
tedance.com/raw

=E2=80=A2 Another inquiry about how to do it:
  https://lore.kernel.org/qemu-devel/CADx_CBPzAstC0o9X6CrnyFqYYAtPbw5-XHWxm=
XTt6+LyYb-U3g@mail.gmail.com/

=E2=80=A2 Implementation in crosvm:
  https://chromium-review.googlesource.com/c/chromiumos/platform/crosvm/+/3=
146213

=E2=80=A2 My own initial inquiry about it:
  https://lore.kernel.org/qemu-devel/87h7u1s5k1.fsf@alyssa.is/

=E2=80=A2 The last of another round of spec submissions:
  https://lore.kernel.org/virito-dev/1561418997-24608-1-git-send-email-ndra=
gazis@arrikto.com/

(and more going back further)

My point here is that VVU has been the go-to answer for how this problem
could be solved for a very long time, during which an objection to a
VIRTIO device used to implement other VIRTIO devices hasn't been
widespread.  I'd be interested to understand what's changed there, if
indeed anything has.  Is it just that virtio-msg now exists?
Transporting VIRTIO over a stream isn't a huge leap, but the
participants in prior discussions didn't suggest it as an alternative.
=46rom where I stand, virtio-msg seems at best an unproven and far-off way
to accomplish this, whereas VVU has proven to work, at least well
enough to have been considered worth putting in work to try to move
the spec forward for multiple different (as far as I know) independent
efforts over the years.

--rbmbjv33er3uphxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRV/neXydHjZma5XLJbRZGEIw/wogUCahgDQgAKCRBbRZGEIw/w
ovF8AP44Pi8HIhlHav68I99NP4Am3u2/Y3FLXXhcfUjSiDh6vwEApgRWKD9U510p
Lzp44wTDExYQ6WQ/cd+PWww3seGnfAc=
=jH/D
-----END PGP SIGNATURE-----

--rbmbjv33er3uphxf--
