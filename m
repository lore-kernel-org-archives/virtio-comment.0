Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0F829ACF6
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 18:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881137; cv=none; b=i67/nOHHU8uOIPYiEInN0LKJgDq7ijeO71EjKlp2wylyB0u/YlwNq4Vbn1QDoyfpsDZf1+VfbtBKkP83NV9sXuu8O+BkTQpUkHgokE1+NRgeHnei5+wtxf7z0QyK/brOcO4Dyk4RRRGkDOTiqXb+pAo3UrSt/SngCbvKQHGxJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881137; c=relaxed/simple;
	bh=nbbIoo2FmV9dNbtpFfNAgUyB5aQWJ52mWHGwFw/tilE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jETBb0XFGLiz7HWfk0BOrGsfstyw/NHgzsnyCxMyX4VVHty+mIPcLkdY4VpqNdASKtjohdiKEp01hqo/BB4DvSRoePzh+fnxu2CUiFeuPPC3i3zY2dv0p7utoVO1BJ5jgUqtm9+/htXHmyDq7UixhDmYX3x9QOsTWJZN/lreu4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g0Xvh8xZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0Xvh8xZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776881134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BTpzYoGOfTT+ta0XB1Dg54gotDSITW8o0jtM7t5wAjw=;
	b=g0Xvh8xZ+Em0spBaWWS9H8LbOc6JhsK4sORc6aF8+AgAYdshYIEZ++rgsHOD4njxeBgWWD
	K/JRTfGtNq9tazjUHq322Aoh4RTOWojfmMKJDAHvqnIZYfnY25Bc7EkptE9byJBcCaeCh6
	A2KV12vWHm1KmGZd4o4DHlrgTzIM7V4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-lenL1O_2NcW2tnQ3BX4FIg-1; Wed,
 22 Apr 2026 14:05:32 -0400
X-MC-Unique: lenL1O_2NcW2tnQ3BX4FIg-1
X-Mimecast-MFC-AGG-ID: lenL1O_2NcW2tnQ3BX4FIg_1776881131
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 11D6E1956080
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 18:05:31 +0000 (UTC)
Received: from localhost (unknown [10.44.48.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3CBE51956095;
	Wed, 22 Apr 2026 18:05:29 +0000 (UTC)
Date: Wed, 22 Apr 2026 14:05:27 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] content: clarify feature negotiation terminology and
 init sequence
Message-ID: <20260422180527.GB498202@fedora>
References: <bf1eadcd07bb7a72c52612f4eb175cd3c3c246d5.1776872324.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+sO0LmWhIVCqAuSQ"
Content-Disposition: inline
In-Reply-To: <bf1eadcd07bb7a72c52612f4eb175cd3c3c246d5.1776872324.git.mst@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


--+sO0LmWhIVCqAuSQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 11:38:55AM -0400, Michael S. Tsirkin wrote:
> Make several clarifications to the init sequence documentation:
>=20
> The Linux virtio core (drivers/virtio/virtio.c) initializes devices
> as follows:
>   1. Intersect driver and device feature bits
>   2. finalize_features() - write accepted features to the device
>   3. drv->validate() - read config space, may clear feature bits
>      (e.g. virtio-net clears VIRTIO_NET_F_MTU if mtu < MIN_MTU,
>      balloon clears PAGE_POISON if guest does not init pages)
>   4. If validate changed any features, finalize_features() again
>   5. virtio_features_ok() - set FEATURES_OK, confirm with device
>=20
> this allows the device to know which fields will be read:
> recommend this in the spec.
>=20
> Legacy driver detection is specified using a mechanism that
> does not work on all transports. Make it clear that it's an
> example: what matters is that devices do detection in some way
> and are compatible with legacy drivers.
>=20
> Clarify the distinction between features written to the
> device ("accepted") and features confirmed via FEATURES_OK
> ("negotiated").
>=20
> "acknowledged" is used as a synonym for "accepted", but only in two
> places. Just use "accepted" consistently.
>=20
> Spec describes multiple moving pieces then ends with "before accepting
> it" - vague, and is overloading "accept". Replace with a reference to
> FEATURES_OK.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/241
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  content.tex | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 5de811f..3dcba31 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -39,7 +39,7 @@ \section{\field{Device Status} Field}\label{sec:Basic F=
acilities of a Virtio Dev
>  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>    drive the device.
> =20
> -\item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
> +\item[FEATURES_OK (8)] Indicates that the driver has accepted all the
>    features it understands, and feature negotiation is complete.
> =20
>  \item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that =
the
> @@ -89,13 +89,21 @@ \section{Feature Bits}\label{sec:Basic Facilities of =
a Virtio Device / Feature B
> =20
>  Each virtio device offers all the features it understands.  During
>  device initialization, the driver reads this and tells the device the
> -subset that it accepts.  The only way to renegotiate is to reset
> -the device.
> +subset that it accepts.  The device validates this subset and
> +accepts it to complete the negotiation, or rejects it, leaving
> +the negotiation incomplete. Once the negotiation is complete,
> +the only way to renegotiate is to reset the device.
> +
> +A feature bit is \emph{accepted} once the driver has written it to the
> +device.

The above paragraph says the device "accepts" features too. Therefore it
is confusing to define "accepted" as only require driver action in this
sentence. Is it implied that the driver's write only completes when the
device has also accepted the features? I think it would be simpler to
avoid using the word "accept" in two different steps of the feature bit
negotiation process.

> A feature bit is \emph{negotiated} once FEATURES_OK has been
> +set and confirmed.  Before FEATURES_OK is confirmed, features are
> +accepted but not yet negotiated, and the device has not confirmed that it
> +supports the combination selected by the driver.
> =20
>  This allows for forwards and backwards compatibility: if the device is
>  enhanced with a new feature bit, older drivers will not write that
>  feature bit back to the device.  Similarly, if a driver is enhanced with=
 a feature
> -that the device doesn't support, it see the new feature is not offered.
> +that the device doesn't support, it will see that the new feature is not=
 offered.
> =20
>  Feature bits are allocated as follows:
> =20
> @@ -189,8 +197,8 @@ \subsection{Legacy Interface: A Note on Feature
> =20
>  Transitional Drivers MUST detect Legacy Devices by detecting that
>  the feature bit VIRTIO_F_VERSION_1 is not offered.
> -Transitional devices MUST detect Legacy drivers by detecting that
> -VIRTIO_F_VERSION_1 has not been acknowledged by the driver.
> +Transitional devices MUST detect Legacy drivers, e.g. by detecting that
> +VIRTIO_F_VERSION_1 has not been accepted by the driver.
> =20
>  In this case device is used through the legacy interface.
> =20
> @@ -314,6 +322,11 @@ \section{Device Configuration Space}\label{sec:Basic=
 Facilities of a Virtio Devi
>  greater than the specified 8-bit size.
>  \end{note}
> =20
> +\drivernormative{\subsection}{Device Configuration Space}{Basic Faciliti=
es of a Virtio Device / Device Configuration Space}
> +Before reading a device-specific configuration field that is
> +conditional on a feature bit, the driver SHOULD first accept
> +that feature bit.
> +
>  \devicenormative{\subsection}{Device Configuration Space}{Basic Faciliti=
es of a Virtio Device / Device Configuration Space}
>  The device MUST allow reading of any device-specific configuration
>  field before FEATURES_OK is set by the driver.  This includes fields whi=
ch are
> @@ -530,7 +543,11 @@ \section{Device Initialization}\label{sec:General In=
itialization And Device Oper
>  \item\label{itm:General Initialization And Device Operation /
>  Device Initialization / Read feature bits} Read device feature bits, and=
 write the subset of feature bits
>     understood by the OS and driver to the device.  During this step the
> -   driver MAY read (but MUST NOT write) the device-specific configuratio=
n fields to check that it can support the device before accepting it.
> +   driver MAY read (but MUST NOT write) the device-specific configuration
> +   fields to check that it can support the device before setting FEATURE=
S_OK.
> +   The driver SHOULD accept feature bits before reading configuration
> +   fields conditional on them.  The driver MAY then clear feature bits,
> +   write the updated subset to the device, and repeat this process.

The last sentence is a little unclear to me. I think it's saying a
driver can accept some feature bits, read the configuration space,
and then change its mind and accept a subset of the previously accepted
feature bits - all before setting FEATURES_OK.

The part that confused me was "write the updated subset to the device". Can=
 the "accept" language be used here?
-> "accept this new subset of feature bits"

> =20
>  \item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver =
MUST NOT accept
>     new feature bits after this step.
> --=20
> MST
>=20
>=20

--+sO0LmWhIVCqAuSQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmnpDecACgkQnKSrs4Gr
c8h87ggApnyuJZY/XWvvFjLS79ukN+QHT1GvuMGJoWq110emoG4yy4HaqYRmgit4
TIadduuTFh5i5/cdn//S8VYz0RCjxc+Oc80ekdhg6se7oJYEU39tfp4+ckJdmV2C
2jMR97wE7tMtFGj6tPCKU9kd3mGZFVDIjfLJYVzFTQeAK5O2+YYUq0mLkLXPbye6
AWH3I4DErduPuUbevgbcpEbw6yEfYpETOicmOoARmUVU+c8oBPI3GpW7tcQFXvth
So2CPCCcNba6NE6rPtcdkv8I5jJ/FqfKWDvuhiD1Ne77Y0brrwDO6/6e/R1pxmMv
TqxB90sN1NsIbE/KDdUyp1R1waFaow==
=kKVZ
-----END PGP SIGNATURE-----

--+sO0LmWhIVCqAuSQ--

