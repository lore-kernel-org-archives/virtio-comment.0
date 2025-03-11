Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF691E522
	for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 02:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659445; cv=none; b=MUqHjg+ujVVTowrwHGzTsvHMENy/42feyBYMDiNTDdxOYEM3EM2utLzFsGlV3tp2g8A1ZM0PiPuY0IZz7GCIXzPzxExxq+NkngWKzWi1AsFDp5TcFEKCxkScpbJDAb6RGC/1Coza2d/AWfmLAOwzFYKj4yu9sbFhQXWgB5JhDvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659445; c=relaxed/simple;
	bh=zGynTdxAoXF5XXEbmcBxV2ttV4P32lZQGETQ1eEgiY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyVkxwZGoICRcXtLYLCxjXQY8k5BIitCHVBS+sYRAhcuoSrzhh8XOSg37b+8+cqI512swLZ9ROOhGkzIchN+2p7eDGFwaG/CdR7kXJ0fR4b/n+gGQSgoYVNydWomkiHTSwRCoyFimUIU1ytcO4WrawU+70lLBLb4Ct1yLA7DDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJRi4G8P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJRi4G8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741659442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKDGoUWCGwRJZbdBQ+DIO2utfH5Eqo/yZq6oUnq9AzU=;
	b=VJRi4G8Pca082TyDpNOBVKFwEvRFCTuJQIJPcAge3FPLZC4ZcB2zSpVV316WRVET5Rduuz
	KGWeNSKyjFMjzojCnd91p7Lizx/cXAgcDfoThVwlFcamrK/FinidfnxMgwwWxaie0Bjnyv
	UH5LAuGkQ5Z/O46k/H0pftj2ZYaqSRY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-75-OUrX-mtxOQmBq-Wju4yVag-1; Mon,
 10 Mar 2025 22:17:20 -0400
X-MC-Unique: OUrX-mtxOQmBq-Wju4yVag-1
X-Mimecast-MFC-AGG-ID: OUrX-mtxOQmBq-Wju4yVag_1741659439
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94B2D1800349
	for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 02:17:19 +0000 (UTC)
Received: from localhost (unknown [10.2.16.75])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 710591800944;
	Tue, 11 Mar 2025 02:17:18 +0000 (UTC)
Date: Tue, 11 Mar 2025 10:17:15 +0800
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3] git-publish: add profile
Message-ID: <20250311021715.GB487512@fedora>
References: <20250305164546.1484029-1-mvaralar@redhat.com>
 <20250306052231.GE303194@fedora>
 <CAGxU2F6DBhLhEGmABm6RrR=mXh9iwScWoqWeV0BxejH97Yik1w@mail.gmail.com>
 <CADSE00J+NDzOLx6yYsM1BcfCpwDa=BL22sYLG9A-RFww_aNEMw@mail.gmail.com>
 <CAGxU2F7SzkDsouz06p3hRmLBq6XA658moLS0mfbAwQq6Ei6_Nw@mail.gmail.com>
 <CADSE00JWMNa5ruFn8Q99P_nvZ9pMCwTeCWPRXScYnqHPATKNNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VIFhRz62k+mIaryj"
Content-Disposition: inline
In-Reply-To: <CADSE00JWMNa5ruFn8Q99P_nvZ9pMCwTeCWPRXScYnqHPATKNNw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111


--VIFhRz62k+mIaryj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 05:13:20PM +0100, Albert Esteve wrote:
> On Thu, Mar 6, 2025 at 11:51=E2=80=AFAM Stefano Garzarella <sgarzare@redh=
at.com> wrote:
> >
> > On Thu, 6 Mar 2025 at 11:44, Albert Esteve <aesteve@redhat.com> wrote:
> > >
> > > On Thu, Mar 6, 2025 at 10:58=E2=80=AFAM Stefano Garzarella <sgarzare@=
redhat.com> wrote:
> > > >
> > > > On Thu, 6 Mar 2025 at 06:24, Stefan Hajnoczi <stefanha@redhat.com> =
wrote:
> > > > >
> > > > > On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara La=
rsen wrote:
> > > > > > Add git-publish profile and document how to use it.
> > > > > >
> > > > > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > > > ---
> > > > > > v2 -> v3:
> > > > > >    * remove uppercase and the line split and use italic
> > > > > > v1 -> v2:
> > > > > >    * add link to git-publish
> > > > > >    * document that the project contains a profile already
> > > > > > ---
> > > > > >  .gitpublish |  3 +++
> > > > > >  README.md   | 15 +++++++++++++++
> > > > > >  2 files changed, 18 insertions(+)
> > > > > >  create mode 100644 .gitpublish
> > > > > >
> > > > > > diff --git a/.gitpublish b/.gitpublish
> > > > > > new file mode 100644
> > > > > > index 0000000..d412896
> > > > > > --- /dev/null
> > > > > > +++ b/.gitpublish
> > > > > > @@ -0,0 +1,3 @@
> > > > > > +[gitpublishprofile "default"]
> > > > >
> > > > > Great, this will make it easier to send spec changes!
> > > > >
> > > > > > +base =3D master
> > > > > > +to =3D virtio-comment@lists.linux.dev
> > > > >
> > > > > From https://github.com/oasis-tcs/virtio-spec?tab=3Dreadme-ov-fil=
e:
> > > > >
> > > > >   When not to use the virtio-comment mailing list:
> > > > >     questions and change proposals for Virtio drivers and devices
> > > > >     implementing the specification. (please use the virtio-dev ma=
iling
> > > > >     list for this).
> > > >
> > > > That statement talks about the driver and device "implementing" the
> > > > spec, not the spec itself, indeed there is another statement:
> > > >
> > > >   When to use the virtio-comment mailing list:
> > > >      questions and change proposals for the Virtio specification,
> > > >      including the specification of basic functionality, transports=
 and
> > > >      devices.
> > > >
> > > > So I guess this patch is right, since here we are talking about spec
> > > > changes.
> > > >
> > > > BTW I'm honest, I'm always confused about virtio-comment and virtio=
-dev
> > > > xD, so another "Thank you" to Matias for this patch!
> > >
> > > I'm in that club too :D I had to fail once to get it right.
> >
> > :D
> >
> > >
> > > The problem with hardcoding the gitpublishto setting to the default
> > > profile is that users need to be aware that if they need to send it to
> > > virtio-dev, they need to manually remove virtio-comment and add
> > > virtio-dev to the command line. I mean, the patch is good because in
> > > most cases it will be the right mailing list to use. But perhaps it
> > > would be nice to mention it in the README (at least, mention what is
> > > the default), instead of relying on them going to .gitpublish file and
> > > check?
> >
> > I see, but do we really have a case where changes to the spec need to
> > be sent to virtio-dev?
>=20
> Judging by the README I'd say probably not? But looking at the
> messages in the list, I found one example of a spec change in
> virtio-dev [1]. Although that is not a good reason per se, as it may
> just be using the wrong list.
>=20
> [1] https://lore.kernel.org/virtio-dev/20241107105103.19152-1-mgurtovoy@n=
vidia.com/T/#u
>=20
> >
> > If not, I'd avoid to mention to increase confusion.
>=20
> Yeah, let's do that then.

I read the README.md more carefully and I think Stefano is right:
patches should be sent to virtio-comment.

There's no need to mention virtio-dev.

I was just doing it wrong all along :D.

Stefan

--VIFhRz62k+mIaryj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmfPnSsACgkQnKSrs4Gr
c8g/lAgAlD2dh9N0/eAnpleEHyqUKKCrq2ZrdsUdbbcDljTOurZVoIfVOPnI2lYQ
VhfXj9eO4icqsp9g4rEOcVN3K9g5Gu1OyBWokZ8pLo61GCORIOM+Wp8O+fOIPyfx
VQRMB0QCGpwo3lFTeLnNnecK5Ar1WOUwzHJgMaOFVSoD9YEjni8EE6zHRr/JrUB/
GF5IgGFu2hVZSMOQ7sPyTolYmMz53SDTt75ig+bWWsE6PCzIYKQaWW6Ugm/fap5K
skRpcHIAw3Htt/oMt63tDSbZTDvG86dhlLKHeQn4MvIiNBF37sZK4K2piSYjZ41O
GjpSMlun32Q8x11QNUb43LvTvd+g3w==
=XvNc
-----END PGP SIGNATURE-----

--VIFhRz62k+mIaryj--

