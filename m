Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD414265F
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720780607; cv=none; b=cEfTaOygUbbKYtnQjQBdPzx/OFdOvsyj/tP4DGCJXakB3JMII5cungM9S2/lNbr7INiEkwlUWxAfLLTXULt1QGPOOdU8dza5/4DCuZvb+tuJw2cRlJd/C+h9XKKiVFn7LcujNft5FTsa6lg0J1HcW1OvFLqZDAgJ52QOjIX8Fz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720780607; c=relaxed/simple;
	bh=7qPf3XcyIOA95GiBUEmTzlxbXmgyxE0z4X5lYaIqsrY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r1sopO3hlCnA2SBtEnLY8uzjWYW6AFwlO80Ce6vNhr04x4PophNal28i4m1O5kQdfOdUO8E2vzHecj5f5ePzOjp4l0QLOR6DH3nfThEpvmahAAmuMdcl0g5fvRaHJyOgYGJNZhYsKAT0/yZnWPzN7XSrtvW6R94k6aOY0C91Rto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQny4+pe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQny4+pe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720780603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=maNsSxuSKfYhtNiLbDnymZ94aFwaPGk/uvolFTz8ql0=;
	b=SQny4+peAhxhXa1D/vun9x/a94oefAFrDqkqLD7R0C6Nx2JdDjjTc35uwdp7UwLKDKRtdK
	q7Li+Q4Vpp119hvSd3ckiRvwhULDnFVuhIvEMFDGfzmL91ZXpSDveYDuA4AX0rjY5Jiqrj
	gGiSCiJdL+InM8T278sD2mKlwNmXZio=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-ELTJQTtTNbiV3DC6jMzwJQ-1; Fri,
 12 Jul 2024 06:36:39 -0400
X-MC-Unique: ELTJQTtTNbiV3DC6jMzwJQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B2B9196CDF1;
	Fri, 12 Jul 2024 10:36:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.17])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 395581955E70;
	Fri, 12 Jul 2024 10:36:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <pandit.parav@gmail.com>, virtio-comment@lists.linux.dev,
 mst@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: Re: [GIT PULL virtio 00/40] virtio master branch with fixes and
 admin commands
In-Reply-To: <20240711202352.3228345-1-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240711202352.3228345-1-parav@nvidia.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 12 Jul 2024 12:36:34 +0200
Message-ID: <87o772c2x9.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11 2024, Parav Pandit <pandit.parav@gmail.com> wrote:

> Hi Michael, Cornelia,
>
> The following changes since commit 37c6a406678a5ee891fdf5671298cb4fcfa517=
f2:
>
>   sound: add sampling rates 12000Hz and 24000Hz (2024-02-16 11:55:25 +010=
0)
>
> are available in the Git repository at:
>
>   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4
>
> for you to fetch changes up to 74bf759aef3bf10447aadcb841c66dc5e6a578d6:
>
>   virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-11 2=
0:54:20 +0300)
>
> ----------------------------------------------------------------
> This tag contains virtio master branch and set of patches of administrati=
on commands, pci fix, blk config fix, and net description fixes
>
> - editorial changes froom master branch
> - virtio blk and pci capabilities data type fixes
> - virtio net header description update
> - adminstration commands for flow filters
> - administration commands for device parts
>
> Generated PDF and also the diff pdf were verified using makepdf.sh, maked=
iffall.sh and makediffpdf.sh.
>
> ----------------------------------------------------------------
> Cornelia Huck (12):
>       edit: remove old changelog
>       edit: add changelog for 1.3
>       acknowledgements: update for 1.3
>       editorial: update copyright date in PDF footer to 2023
>       change revisions: diff from v1.2, current v1.3
>       title: note that 1.3 supercedes 1.2
>       revision: update date
>       remove enumerate usage that makes the tool unhappy
>       Revert "remove enumerate usage that makes the tool unhappy"
>       editorial: various fixes for 1.3-csd01
>       editorial: update "Computer Language Definitions" URL
>       makediff: update list of cherry-picks
>
> Kr=C3=B6ning (1):
>       virtio_pci_cap64: specify offset_hi, length_hi endianness

Hm, something bad happened to the author field here (script confused?)
Not fixable without a force push, though :(

