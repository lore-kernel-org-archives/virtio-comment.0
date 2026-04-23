Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0606637D137
	for <virtio-comment@lists.linux.dev>; Thu, 23 Apr 2026 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776963479; cv=none; b=QtL+JizIDJV4vTr8Gz2IWPTP6SyB4QD3vHW97Kg1SbjncH3CeFVuvVkJHX1HGHYSEDy6hTlMwe8t9NS79rZEqqfWfmVVRtwmkpVH9mPKehpGkuzZwEV9nmPW639myUvoMTLTlFkC+Gzvbv1uYuXfW6YFMnrw4jJWEPjvQ3f+O6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776963479; c=relaxed/simple;
	bh=arGqpn5w5oIbzdGIGrLtiHF2BpvkhEkD4PIgHvbtPTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Od0sUmWhXlnM2lXQXsLJVFP//RQNUE+0J5jHPSF7cPYOrxwjT/S2S3VXAh30nvQmuFVuyigLo500Q68GfegKj2nXU243oHuIwfSwaZdAvR9cj6GfA+tfb9vxeiwtO2N09/AC61F0Elev5qgSE+mDhHHtrdnb3gnzbw+WqZ+EOsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h58kitg5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h58kitg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776963477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qivafysH/JMc0jik5Bxg0hvTDh8KUY6Wzp8+kO/FrAo=;
	b=h58kitg5gL3dyNSiGLsNckb7oqS5MZsQwTPwW+/4qP9TLGzwZ+C3PQZW9iBvNQdaYaL6DO
	osp7hR3Dbn+YbAR/IMLHI2xwMbBsfHbLUL1j0c7sy7r6Ug6BFWriHUyOUTbz8z7O7vJtsC
	K/fEeZoo480QxL7g+8k7HonVpUFGSpY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-N_c028JGP6uSxYRlZOnZrA-1; Thu,
 23 Apr 2026 12:57:55 -0400
X-MC-Unique: N_c028JGP6uSxYRlZOnZrA-1
X-Mimecast-MFC-AGG-ID: N_c028JGP6uSxYRlZOnZrA_1776963474
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 705351955DE9
	for <virtio-comment@lists.linux.dev>; Thu, 23 Apr 2026 16:57:54 +0000 (UTC)
Received: from localhost (unknown [10.44.32.119])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B1A219560B6;
	Thu, 23 Apr 2026 16:57:52 +0000 (UTC)
Date: Thu, 23 Apr 2026 12:49:56 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] content: clarify feature negotiation terminology and
 init sequence
Message-ID: <20260423164956.GB529033@fedora>
References: <bf1eadcd07bb7a72c52612f4eb175cd3c3c246d5.1776872324.git.mst@redhat.com>
 <20260422180527.GB498202@fedora>
 <20260422140834-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bSBWeFqtThup+5c5"
Content-Disposition: inline
In-Reply-To: <20260422140834-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


--bSBWeFqtThup+5c5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 02:18:01PM -0400, Michael S. Tsirkin wrote:
> On Wed, Apr 22, 2026 at 02:05:27PM -0400, Stefan Hajnoczi wrote:
> > On Wed, Apr 22, 2026 at 11:38:55AM -0400, Michael S. Tsirkin wrote:
> > > Make several clarifications to the init sequence documentation:
> > >=20
> > > The Linux virtio core (drivers/virtio/virtio.c) initializes devices
> > > as follows:
> > >   1. Intersect driver and device feature bits
> > >   2. finalize_features() - write accepted features to the device
> > >   3. drv->validate() - read config space, may clear feature bits
> > >      (e.g. virtio-net clears VIRTIO_NET_F_MTU if mtu < MIN_MTU,
> > >      balloon clears PAGE_POISON if guest does not init pages)
> > >   4. If validate changed any features, finalize_features() again
> > >   5. virtio_features_ok() - set FEATURES_OK, confirm with device
> > >=20
> > > this allows the device to know which fields will be read:
> > > recommend this in the spec.
> > >=20
> > > Legacy driver detection is specified using a mechanism that
> > > does not work on all transports. Make it clear that it's an
> > > example: what matters is that devices do detection in some way
> > > and are compatible with legacy drivers.
> > >=20
> > > Clarify the distinction between features written to the
> > > device ("accepted") and features confirmed via FEATURES_OK
> > > ("negotiated").
> > >=20
> > > "acknowledged" is used as a synonym for "accepted", but only in two
> > > places. Just use "accepted" consistently.
> > >=20
> > > Spec describes multiple moving pieces then ends with "before accepting
> > > it" - vague, and is overloading "accept". Replace with a reference to
> > > FEATURES_OK.
> > >=20
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/241
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  content.tex | 31 ++++++++++++++++++++++++-------
> > >  1 file changed, 24 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/content.tex b/content.tex
> > > index 5de811f..3dcba31 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -39,7 +39,7 @@ \section{\field{Device Status} Field}\label{sec:Bas=
ic Facilities of a Virtio Dev
> > >  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> > >    drive the device.
> > > =20
> > > -\item[FEATURES_OK (8)] Indicates that the driver has acknowledged al=
l the
> > > +\item[FEATURES_OK (8)] Indicates that the driver has accepted all the
> > >    features it understands, and feature negotiation is complete.
> > > =20
> > >  \item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates t=
hat the
> > > @@ -89,13 +89,21 @@ \section{Feature Bits}\label{sec:Basic Facilities=
 of a Virtio Device / Feature B
> > > =20
> > >  Each virtio device offers all the features it understands.  During
> > >  device initialization, the driver reads this and tells the device the
> > > -subset that it accepts.  The only way to renegotiate is to reset
> > > -the device.
> > > +subset that it accepts.  The device validates this subset and
> > > +accepts it to complete the negotiation, or rejects it, leaving
> > > +the negotiation incomplete. Once the negotiation is complete,
> > > +the only way to renegotiate is to reset the device.
> > > +
> > > +A feature bit is \emph{accepted} once the driver has written it to t=
he
> > > +device.
> >=20
> > The above paragraph says the device "accepts" features too. Therefore it
> > is confusing to define "accepted" as only require driver action in this
> > sentence. Is it implied that the driver's write only completes when the
> > device has also accepted the features? I think it would be simpler to
> > avoid using the word "accept" in two different steps of the feature bit
> > negotiation process.
>=20
> We don't really need a new verb - we have negotiated for this.
>=20
>=20
> +subset that it accepts.  The device validates this subset and
> +either completes the negotiation successfully (the last subset of featur=
es
> that the driver accepted is consider negotiated then) or fails, leaving
> +the feature negotiation incomplete. Once the negotiation is complete,
> +the only way to renegotiate is to reset the device.
>=20
> Hmm?

Sounds good.

>=20
>=20
> > > A feature bit is \emph{negotiated} once FEATURES_OK has been
> > > +set and confirmed.  Before FEATURES_OK is confirmed, features are
> > > +accepted but not yet negotiated, and the device has not confirmed th=
at it
> > > +supports the combination selected by the driver.
> > > =20
> > >  This allows for forwards and backwards compatibility: if the device =
is
> > >  enhanced with a new feature bit, older drivers will not write that
> > >  feature bit back to the device.  Similarly, if a driver is enhanced =
with a feature
> > > -that the device doesn't support, it see the new feature is not offer=
ed.
> > > +that the device doesn't support, it will see that the new feature is=
 not offered.
> > > =20
> > >  Feature bits are allocated as follows:
> > > =20
> > > @@ -189,8 +197,8 @@ \subsection{Legacy Interface: A Note on Feature
> > > =20
> > >  Transitional Drivers MUST detect Legacy Devices by detecting that
> > >  the feature bit VIRTIO_F_VERSION_1 is not offered.
> > > -Transitional devices MUST detect Legacy drivers by detecting that
> > > -VIRTIO_F_VERSION_1 has not been acknowledged by the driver.
> > > +Transitional devices MUST detect Legacy drivers, e.g. by detecting t=
hat
> > > +VIRTIO_F_VERSION_1 has not been accepted by the driver.
> > > =20
> > >  In this case device is used through the legacy interface.
> > > =20
> > > @@ -314,6 +322,11 @@ \section{Device Configuration Space}\label{sec:B=
asic Facilities of a Virtio Devi
> > >  greater than the specified 8-bit size.
> > >  \end{note}
> > > =20
> > > +\drivernormative{\subsection}{Device Configuration Space}{Basic Faci=
lities of a Virtio Device / Device Configuration Space}
> > > +Before reading a device-specific configuration field that is
> > > +conditional on a feature bit, the driver SHOULD first accept
> > > +that feature bit.
> > > +
> > >  \devicenormative{\subsection}{Device Configuration Space}{Basic Faci=
lities of a Virtio Device / Device Configuration Space}
> > >  The device MUST allow reading of any device-specific configuration
> > >  field before FEATURES_OK is set by the driver.  This includes fields=
 which are
> > > @@ -530,7 +543,11 @@ \section{Device Initialization}\label{sec:Genera=
l Initialization And Device Oper
> > >  \item\label{itm:General Initialization And Device Operation /
> > >  Device Initialization / Read feature bits} Read device feature bits,=
 and write the subset of feature bits
> > >     understood by the OS and driver to the device.  During this step =
the
> > > -   driver MAY read (but MUST NOT write) the device-specific configur=
ation fields to check that it can support the device before accepting it.
> > > +   driver MAY read (but MUST NOT write) the device-specific configur=
ation
> > > +   fields to check that it can support the device before setting FEA=
TURES_OK.
> > > +   The driver SHOULD accept feature bits before reading configuration
> > > +   fields conditional on them.  The driver MAY then clear feature bi=
ts,
> > > +   write the updated subset to the device, and repeat this process.
> >=20
> > The last sentence is a little unclear to me. I think it's saying a
> > driver can accept some feature bits, read the configuration space,
> > and then change its mind and accept a subset of the previously accepted
> > feature bits - all before setting FEATURES_OK.
> >=20
> > The part that confused me was "write the updated subset to the device".=
 Can the "accept" language be used here?
> > -> "accept this new subset of feature bits"
>=20
> Good point, but we need to also tell the device. Let's use just that?
>=20
>   The driver MAY then accept a different subset of feature bits
>   (e.g., deciding, based on the configuration fields, not to use a certai=
n feature),
>   tell the device about the updated subset, and repeat this process.

Yes.

>=20
>=20
> > > =20
> > >  \item\label{itm:General Initialization And Device Operation / Device=
 Initialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The dri=
ver MUST NOT accept
> > >     new feature bits after this step.
> > > --=20
> > > MST
> > >=20
> > >=20
>=20
>=20

--bSBWeFqtThup+5c5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmnqTbQACgkQnKSrs4Gr
c8gTsQf6Ap8bX54sNROIxker1ir/Vdyn0SALGZUhMyaGx7zrD25MZqsuJ39FpwvH
1PyMa3A9wHJAHpY0Ex9DnAcFRrUOdsXbqMIdHGZbJnoNx+7OG1PkBPO5qQE2LnKa
oaW+9XoI5VqunS9Oo75yh8k7l8xrfgYp/wCv+nCd3LtWUn2/fxMuRojCntmxSXSd
EHENvTlqBdQwyzYKVJaGYPnAKvcS259kwMK2yOz4FOFaFWuw2rv4xpnwhG3ElRnK
KFBdU5nmcoXQi2HLPzze/sBDrbBLRImV+vKK6y462lpfH2TKOmGHJ2WoT92mH7d/
YEfCgtLo6B62KVXT+LEF0gbTTzyuLg==
=DGHf
-----END PGP SIGNATURE-----

--bSBWeFqtThup+5c5--

