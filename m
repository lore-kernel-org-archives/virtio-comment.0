Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571D2F60BC
	for <virtio-comment@lists.linux.dev>; Thu, 13 Nov 2025 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048495; cv=none; b=phBWGomRibHDmo1pTjmJZqNJndGd1SYgArPShGSIwbuJHrIi4rJAlSRNFpZv6P6izGjnFMNM7xrGmt4ljjZZbXarpFW9TBQ+zwGriPh5/tU/6hdPKs8WA36pjLed/ayidrQY6Hsv/nfv/h/caMlCzs/dtYssSK021EH/QsejJ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048495; c=relaxed/simple;
	bh=PjKNm+fLX8zokK6PmrVjtHgmW64UkvkPoNJPv47YUaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTJlXSBorAfKtcMommul32Jg8MXKoMPg8PFrPqt7q8092CocQdewO0g0E8ymauiCi4lQ9lOGbUgGNEI9P0a2xzd26JyqG3IyfGeBjN9oVowUegu7lZiHZXIMQcrrz9phXx7sfFitxnL7OJiZqKNqa/jSqlT5zwagM4pPBJUo09Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3YSzAEW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3YSzAEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763048492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4rWKf7/Aym+mqvexAKgmUtC0OgKlnn9DufPfz7TPxU=;
	b=I3YSzAEWdv2NbQsLJSn7QNZGiugE99XiVP9XbUTE05Dp+7KSu31NcwoyBRX5hb2fVBu0gB
	UQPka1NzTBC3gbB1aQDWY+/F/udNadREnvBvVdNSIgZSUoVajM1b/F3OMwBS5DNSJI/teW
	i3UcB11g3vCrMMj+Mzo+UzE/a8RLIL4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-6btBs8X8NoealGsoYa61UA-1; Thu,
 13 Nov 2025 10:41:30 -0500
X-MC-Unique: 6btBs8X8NoealGsoYa61UA-1
X-Mimecast-MFC-AGG-ID: 6btBs8X8NoealGsoYa61UA_1763048489
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BFC918002CE;
	Thu, 13 Nov 2025 15:41:29 +0000 (UTC)
Received: from localhost (unknown [10.2.16.177])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4C081956046;
	Thu, 13 Nov 2025 15:41:28 +0000 (UTC)
Date: Thu, 13 Nov 2025 10:41:27 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: dverkamp@chromium.org, mst@redhat.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3] virtio-blk: Add support for "Force Unit Access" writes
Message-ID: <20251113154127.GC189474@fedora>
References: <20250917071249.1689417-1-afaria@redhat.com>
 <20250917192622.GC172838@fedora>
 <CAELaAXyuqgwD9z8PQtXfO+hBxjp_Gthm+qpo14pi=q7S+71cLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkOCAbFSlvDK0B27"
Content-Disposition: inline
In-Reply-To: <CAELaAXyuqgwD9z8PQtXfO+hBxjp_Gthm+qpo14pi=q7S+71cLg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12


--gkOCAbFSlvDK0B27
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 05:30:40AM +0000, Alberto Faria wrote:
> On Thu, Sep 18, 2025 at 2:38=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.=
com> wrote:
> > On Wed, Sep 17, 2025 at 08:12:49AM +0100, Alberto Faria wrote:
> > > @@ -1000,14 +1030,20 @@ \subsection{Device Operation}\label{sec:Devic=
e Types / Block Device / Device Ope
> > >    \field{writeback} field in configuration space was 0 \textbf{all t=
he time between
> > >    the submission of the write and its completion};
> > >
> > > -\item\label{item:flush3} a VIRTIO_BLK_T_FLUSH request is sent \textb=
f{after the write is
> > > +\item\label{item:flush3} the VIRTIO_BLK_F_REQ_FLAGS_FUA feature was =
negotiated
> > > +  and the \field{fua} bit in \field{flags} was set in the write requ=
est
> > > +  (regardless of whether the VIRTIO_BLK_F_FLUSH or VIRTIO_BLK_F_CONF=
IG_WCE
> > > +  features were negotiated, and regardless of the current cache mode=
 as
> > > +  expressed by the value of the \field{writeback} field in configura=
tion space).
> >
> > Missing "and the write request is completed"?
>=20
> This should be implied by the paragraph above the itemize.

You are right, write completion is already mentioned:

  A write becomes stable once it is completed and one or more of the
  following conditions is true:
  - ...

Stefan

--gkOCAbFSlvDK0B27
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmkV/CcACgkQnKSrs4Gr
c8it6Af/Q81y9utOeaR8NuCl7OiioqTBn7u7D6UBNxMnhilW3QdaOQGxryZVsXg2
XNAi/w6iZxFKpu0cj16mkmAP8xAlL3gM3TzHbnatgqCnfGzcTQGgERuBlBySdhbQ
KJypHalsHqLchxi9sGqgZUJ5RQ09A0igvZSvETVb7qj2bwkhAWeB3IELbQ4kUusu
sXRIS4OMpaNPXVLvRr9Fnbt+HDOmO/WVlaXILTh2eMmWCSkt3vTKmr348HqWe+Y5
O1gK0ZW6en4N0VTzYeDkFUlPwxmJAmM8q9xj/g3W6iOSAZZvlE2Exi9Yj0LqEFhL
+23nM66+wwuda6RBVfii2+20KPFYkg==
=5X0p
-----END PGP SIGNATURE-----

--gkOCAbFSlvDK0B27--

