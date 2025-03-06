Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55FB8172A
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 05:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239017; cv=none; b=PjimavYhbnaFx3pbHAfFh0mCEre/rjn+od3JAHiHxG/gvIeL/qmjty0xXWJwc9pkXtfNZs9Ek8v5EqEIb1127xDJV3JVWEhFf7MC2qeQvcQ/7FnFKtUTA1yAxeggeS/UItcvJg652zcTlyTd3ii/PB7IIsPPZPjTJzFW5idW2bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239017; c=relaxed/simple;
	bh=SZsU8KqM1oqvKN9WIJY38mG0zFC5pRSCYwMB1YmywQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g08ZyJVreKy3cqkjcGpehJgE/IaljH4dTMrRi46zBTDQAUI0Yp8x2/AWy0dYMu+vNQErxlTr5Lt7Nj9Xa/LBzNzi8VGAeum7TaZ4lDW/ePQQ4KTAZS7PyN+T3n/kcUT/sMq28jblmGmlTF85T5/HaLqQoDi0WDD6st5mi9rqkVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HSy4UYpN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HSy4UYpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741239014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tttENJ8220xUO32+bnU1oZmiSCXZ+L1qB1QVoTLPBMY=;
	b=HSy4UYpNMywWF+N9F95j5gVznbJJvFVppT2gYByLhlk/4d3Pk8jVQBq3FQxsmyR5NmaeKu
	oIu8Z1qwvm00YRt/RAhdHtHggAAMoPt8SvqAalss4DDCYndKO6jwhWXBC3yzpRLs69YI9D
	6KKWdWZ1kkbhelFkJpCJc2LWOWqFLM4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-ZFIUmrr-Nl2azQZ-c_C2ZA-1; Thu,
 06 Mar 2025 00:30:02 -0500
X-MC-Unique: ZFIUmrr-Nl2azQZ-c_C2ZA-1
X-Mimecast-MFC-AGG-ID: ZFIUmrr-Nl2azQZ-c_C2ZA_1741239002
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2886318333CB
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 05:22:36 +0000 (UTC)
Received: from localhost (unknown [10.2.16.55])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11850300019E;
	Thu,  6 Mar 2025 05:22:34 +0000 (UTC)
Date: Thu, 6 Mar 2025 13:22:31 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, aesteve@redhat.com, sgarzare@redhat.com
Subject: Re: [PATCH v3] git-publish: add profile
Message-ID: <20250306052231.GE303194@fedora>
References: <20250305164546.1484029-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="psOtBZykFsIfGBXK"
Content-Disposition: inline
In-Reply-To: <20250305164546.1484029-1-mvaralar@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4


--psOtBZykFsIfGBXK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Larsen wrote:
> Add git-publish profile and document how to use it.
>=20
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v2 -> v3:
>    * remove uppercase and the line split and use italic=20
> v1 -> v2:
>    * add link to git-publish
>    * document that the project contains a profile already
> ---
>  .gitpublish |  3 +++
>  README.md   | 15 +++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 .gitpublish
>=20
> diff --git a/.gitpublish b/.gitpublish
> new file mode 100644
> index 0000000..d412896
> --- /dev/null
> +++ b/.gitpublish
> @@ -0,0 +1,3 @@
> +[gitpublishprofile "default"]

Great, this will make it easier to send spec changes!

> +base =3D master
> +to =3D virtio-comment@lists.linux.dev

=46rom https://github.com/oasis-tcs/virtio-spec?tab=3Dreadme-ov-file:

  When not to use the virtio-comment mailing list:
    questions and change proposals for Virtio drivers and devices
    implementing the specification. (please use the virtio-dev mailing
    list for this).

This also matches what I found in my .git/config where gitpublishto was
set to virtio-dev rather than virtio-comment.

> diff --git a/README.md b/README.md
> index c06caf6..b521978 100644
> --- a/README.md
> +++ b/README.md
> @@ -110,6 +110,21 @@ git format-patch -o proposal1/ HEAD~1..<br>
>  git send-email --to=3Dvirtio-comment@lists.linux.dev proposal1/0001-*
>  </code>
> =20
> +<dl>Optionally, you can use <a
> +href=3D"https://github.com/stefanha/git-publish">git-publish</a> to subm=
it a
> +patch. This project already contains a <em>git-publish</em> profile that=
 will
> +configure some fields, e.g., <em>To</em> field with the right address. A=
fter you have
> +installed <em>git-publish</em>, the procedure is the following:
> +
> +<code>
> +<p>
> +git checkout master -b my-feature<br>
> +# work on new commits, add your 'Signed-off-by' lines to each<br>
> +git publish<br>
> +# more work, rebase on master, ...<br>
> +git publish # will send a v2<br>
> +</code>
> +</dl>
>  <dl>
>  <dt>When to use the virtio-comment mailing list:</dt>
>  <dd>
> --=20
> 2.42.0
>=20
>=20

--psOtBZykFsIfGBXK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmfJMRcACgkQnKSrs4Gr
c8jcyAf9Fkh/0sk5m5A8rZfcTonBOeBS/8o94WSRGJ5R/j4WzcU3m+hgaoi/Rbrv
fyb2/qOnSRVO+5ThNKHdGX6KtXj3JZgP+nN1UIdKXpVm9MBxmu/YWMNPe1mm0zq/
/8g7h5v7Z6hH+s+nNobQCF8G1coL+IJOmhQ2cU1PZRSLHbZzliKBdbceZTPHr1HG
Vae0/nU0QG4Epe/OaXttQvVuaJ/Bf79dmQ886DYSA8ujq3mYeLutgFJwx0BnjTWN
tMZzB+4XAnf0m1wJyD00T5TeiC/CE5b5iSViYVQUjBPmw56+lO6MpNNPHgtg/6g3
CVMSL4RkMIWsS4eFX89uezFRu9lvKg==
=gqnb
-----END PGP SIGNATURE-----

--psOtBZykFsIfGBXK--

