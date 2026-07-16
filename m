Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851E73C343F
	for <virtio-comment@lists.linux.dev>; Thu, 16 Jul 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205980; cv=none; b=NtYTN7/oCRDTiYeY0irG0eH88kVa9zhdcu8wu1cuEZpZnfHcUt0ZyqyxokzGa4wco2vRNjCGvRmjCHlydoIKyl94IoE1m3+NJhWKqLhWQSIKU1l6zjlf+kHazmGIHZcip6UPUfGQN4NIz01vzl0Q6UIPsoXNQFSqj1ht+PGgZ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205980; c=relaxed/simple;
	bh=TKGwRuS6UabsaqzGJk96kLmJRu8zBiaiZ7bqL8Ogskc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0+dfgP2sTEj2onqgjslT/u1xS7qZYBn6uJljT5oatF2B1Blk8U7gxYx4Vshms4XZfTu3n1b901TWcDBwZ94Kdxgd1OX3lXVnUT2CSjPmpVHUJA2wkvihaMiDtJQnsdP0UYvEpcF67Dgw7kOHo3QN8GN1aptAWor6ErkjzIlsRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PiA1i4Hu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PiA1i4Hu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784205978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ljzVg7xF81fBVO0UzYeEB67bBG4Cr0VEw/T/0BtN7VU=;
	b=PiA1i4Hu3H6gy0dB4NH39yCSlwKKwZHVnaLqrZSFUFLJF3uzn8J9aZu+x2O2Bhx6j9nt+t
	/sIAgljtZeQOqN7ezWF1114DoNXcE+3jXaFDbynX8VBCaGFEFl+kphQjYzjf01hgD+mSlF
	Jrj4radLyVLL7dDkwG1mQ3eT/2SNZPk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-Dap_adHSOCe4LHnVxH_Dfw-1; Thu,
 16 Jul 2026 08:46:14 -0400
X-MC-Unique: Dap_adHSOCe4LHnVxH_Dfw-1
X-Mimecast-MFC-AGG-ID: Dap_adHSOCe4LHnVxH_Dfw_1784205973
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87A211954B30;
	Thu, 16 Jul 2026 12:46:13 +0000 (UTC)
Received: from localhost (unknown [10.2.16.131])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 466D01800370;
	Thu, 16 Jul 2026 12:46:12 +0000 (UTC)
Date: Thu, 16 Jul 2026 10:50:25 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: virtio-comment@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] Add VIRTIO_F_DMB (Device Memory Buffer)
Message-ID: <20260716095025.GB741667@fedora>
References: <20260702040006.65669-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A4x0pOVuHM9U7Afj"
Content-Disposition: inline
In-Reply-To: <20260702040006.65669-1-graf@amazon.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


--A4x0pOVuHM9U7Afj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 04:00:06AM +0000, Alexander Graf wrote:
> * Shared memory region id: DMB needs a well-known shmid so the driver can
>   locate the region independent of device type. This draft reserves shmid 2
>   and adds a "Reserved Shared Memory Region IDs" registry. However shmid is
>   currently a per-device-type namespace, and at least one device type
>   (virtio-scmi) documents the entire shmid space as its own. Guidance
>   requested on the preferred mechanism: (a) a small transport-reserved shmid
>   range with device types adjusted to exclude it, or (b) identifying the DMB
>   region by a means other than a fixed shmid. The exact number is not fixed
>   pending this decision.

Hi Alex,
VIRTIO Transports could provide a way to fetch the DMB shmid. For
example, the MMIO transport would get a new read-only DMBSHMId register
that contains a valid shmid when VIRTIO_F_DMB has been negotiated.

Allowing the device to report an arbitrary shmid is flexible - it won't
interfere with device-specific Shared Memory Regions or future
Transport-specific Shared Memory Regions.

Stefan

--A4x0pOVuHM9U7Afj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmpYqWEACgkQnKSrs4Gr
c8jzlQf/VTHMCLTDFVqIGTHUNkNZ4Ew7cUqgoi3TcpDwDhSy3+rWKwHyjtpQjwsy
UTzwPw9waO6jWhdEQCQS1Dtd2IAVeiO3Of7WbLgiawnqyxXjbkp2JAzrHAezwenM
2IzyacXLPZbZl48YIFil0rldMF8Ks3YR5ESC/EnMBnHrYu+5JLylt3g69rgK1m3u
l2/JFGOfCPx7Qr3lVx3V6ReRJaYO8zYAINfGHkUgtcGUck5kfVWN5mcEZKRKONja
Kz46Dz67vGb24kNjlLXddxobxcOxTQclT3bXn1OxCzDZfQi0VThZfjWM6ggPziUO
f4k5zrI13HDsGyk5jtEyXNLDgfOh3w==
=Fvjk
-----END PGP SIGNATURE-----

--A4x0pOVuHM9U7Afj--

