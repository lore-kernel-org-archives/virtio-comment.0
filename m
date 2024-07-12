Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E987914EC7F
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794734; cv=none; b=PK/QMZA/9b8W+lX5d6/c6mc/1MaKejpbT9j3/3CkEDvEuWUJZ7nCgQLBPZb6VcmI2zvo0QGS/R0KJ7jR97Hzh3HBPt53o4bfAYqUXNCncCGmVsct6ChKDi+lfsAPqMMXfgf3vhB23klHVhR7daRGWNfGlhSxohsl85D1rTBnECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794734; c=relaxed/simple;
	bh=GqynIP2KHrrYxCFXv7as4Hj3ddCKcQvyYDpeV4nTFvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pypq1wdCg/3ytBrrHM/qwAGTatNabTq5KpxbC4DY1McGksy3Zq7Hv3R10w2+c7iewOxHOCWJU9dsEvVeH+WU6aX1yMHAU5tsM1f6VF+RYs8KYpU59t5Y2RMWIx18/ravGXWRKNk5WJcDlalVw5KwgH2FTEr++k3UMm/XeVca1tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ihJbMLaC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ihJbMLaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720794731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/JiVxPbaxzOQAt44YKToHoLqNOWcsyjvtwejXVurCs=;
	b=ihJbMLaC7VaTWKFgTJ9H8QzCd9rQCw6DGE2ntPlMXL/kgizuux6Xwmu5ZU8biHh7QKQ2/+
	fOfxZ3evq0dIxfShKDQIwKdJvUWDyk8G7UYoAsiaGs3VIy59maloLj97wAmDI97qDt50AQ
	AaAyLHs+IVJkfbqRsLjlUx+BluayvKw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-M62pewEpNoOBSiDXDALh4w-1; Fri,
 12 Jul 2024 10:32:08 -0400
X-MC-Unique: M62pewEpNoOBSiDXDALh4w-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D705196CE1D;
	Fri, 12 Jul 2024 14:32:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.17])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1D6519560AE;
	Fri, 12 Jul 2024 14:32:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <pandit.parav@gmail.com>, virtio-comment@lists.linux.dev,
 mst@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: Re: [PULL v2] administration commands for device parts
In-Reply-To: <20240712133550.3271761-1-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240712133550.3271761-1-parav@nvidia.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 12 Jul 2024 16:32:02 +0200
Message-ID: <87cynibs0t.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Fri, Jul 12 2024, Parav Pandit <pandit.parav@gmail.com> wrote:

> Hi Michael, Cornelia,
>
> The following changes since commit 9b3129fe72360a78e76b6dd890d3abc5a45fa915:
>
>   virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-12 06:43:53 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v2
>
> for you to fetch changes up to 5b1ed863cf9701e110042e9e85d69acd06cd33c5:
>
>   editorial: replace hyperref with ref (2024-07-12 16:08:59 +0300)
>
> ----------------------------------------------------------------
> This tag contains administration commands for device parts
>
> changelog:
> v1->v2:
> - fixed hyper reference to name reference
> - fixed typo in commit log
> - reduced the patches of pull request due to rebase of virtio-1.4 branch
> v0->v1:
> - resolved merge conflict for an empty line in newdevice.tex
> ----------------------------------------------------------------
> Parav Pandit (6):
>       admin: Add theory of operation for device parts
>       admin: Extend resource objects for sr-iov group type
>       admin: Add admin commands for device parts
>       admin: Define common device parts
>       admin: Add requirements of device parts commands
>       editorial: replace hyperref with ref

The last patch does not have the changelog cut off from the patch
description (not sure why.) Also, shouldn't it have the message id of
the mail you sent to the ML?

>
>  admin-cmds-capabilities.tex     |  16 ++
>  admin-cmds-device-parts.tex     | 469 ++++++++++++++++++++++++++++++++++++++++
>  admin-cmds-resource-objects.tex |  29 ++-
>  admin.tex                       |  12 +-
>  conformance.tex                 |   2 +
>  content.tex                     |   1 +
>  device-parts.tex                | 232 ++++++++++++++++++++
>  newdevice.tex                   |  24 +-
>  8 files changed, 778 insertions(+), 7 deletions(-)
>  create mode 100644 admin-cmds-device-parts.tex
>  create mode 100644 device-parts.tex

