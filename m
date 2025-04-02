Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED65233D8E
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585759; cv=none; b=C7JgoryBUzwdE0eajy7Wkdycyx3sLNdbT486XewdjcT3WmbERmHUfrMGCOWNjSvslpuocCjPGcJU1Yv1TiZYEuTP8/T4p0lpnl7Q3y1ri8KU1N6rOqyyDDpQDrsriKbct3+jlW4aFWBWGxR7l059NUhm2w1fS8n2ov/F/rPVmqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585759; c=relaxed/simple;
	bh=7TnpfSG0EWSZo2dTHWd50+sWr+XfalqMaDVL5Zz28KE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rj1bI8cEF8c4wSldG128NxmXXOHObUFvFE4uF4wisJXbqTqEty+4D1jQHK1oEWvwdFcvEviZ4IpMNsWtQjv2tolncZ6kxia4OOgIF3T67zgdti3H96TjjgSHJVg/a/Z6LQToYmtPwktjjfjpXq4Z1mZz0j/QEXJWR2B62DzUUZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DrgfblXd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DrgfblXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743585756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdmzuIvFY6JB3eD4NXXUi+IkMMXlzJdI26SII35n0PA=;
	b=DrgfblXdkb2u47xEtSxCz0SbuHFxkJNgiWPhQYi6THYyJ5BI1UotmfFA1bNUfaqb/S/mLs
	xB9v6WgR9AIua27cIc/e66tgdrqL9qolr7MfxI9N7pmfB4jTDTAbF5BljtGScY6MlFnTMW
	f4+EPMQPQ1Sh8XBZzd9h/cm4NC1g2EA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-7Zr9wS0pPGiQ0lfhmrbFIA-1; Wed,
 02 Apr 2025 05:22:35 -0400
X-MC-Unique: 7Zr9wS0pPGiQ0lfhmrbFIA-1
X-Mimecast-MFC-AGG-ID: 7Zr9wS0pPGiQ0lfhmrbFIA_1743585754
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C95419560AD;
	Wed,  2 Apr 2025 09:22:34 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39DAD180B487;
	Wed,  2 Apr 2025 09:22:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtio-comment@lists.linux.dev
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, mst@redhat.com,
 parav@nvidia.com
Subject: Re: [PATCH 00/13] Backport 1.4 fixes to 1.3
In-Reply-To: <20250401133543.801184-1-mvaralar@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250401133543.801184-1-mvaralar@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 02 Apr 2025 11:22:30 +0200
Message-ID: <87y0wiapex.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z_CHiH244HPV-3svuVsoRYeT9GKdG4R_Wqwbc2gRj6g_1743585754
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01 2025, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wrot=
e:

> Backport commits from 1.4 branch into 1.3 in preparation for releasing
> v1.3.
>
> Haixu Cui (1):
>   content: Rename SPI master to SPI controller
>
> Martin Kr=C3=B6ning (1):
>   virtio_pci_cap64: specify offset_hi, length_hi endianness
>
> Paolo Abeni (2):
>   virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
>   virtio-net: clarify DATA_VALID semantic for encap protos.
>
> Parav Pandit (8):
>   conformance: Add missing virtqueue reset conformance references
>   packed-ring: Change host,guest to device,driver
>   description: Avoid splitting the word virtqueue
>   virtio-blk: Fix data type of num_queues field
>   virtio-net: Fix receive buffer size calculation text
>   virtio-net: Clarify the size of the struct virtio_net_hdr for tx
>   virtio-net: Annotate virtio_net_hdr as field
>   gpu: editorial: Fix spelling errors
>
> Steffen Trumtrar (1):
>   virtio-net: Fix receive buffer size typo
>
>  conformance.tex                  |  2 ++
>  content.tex                      |  2 +-
>  device-types/blk/description.tex |  2 +-
>  device-types/gpu/description.tex |  6 ++--
>  device-types/net/description.tex | 52 +++++++++++++++++++++++---------
>  packed-ring.tex                  |  4 +--
>  transport-pci.tex                |  4 +--
>  7 files changed, 49 insertions(+), 23 deletions(-)
>
>
> base-commit: b495841a8e80d12c1130f8868f4128866291142d

Looks good to me.

