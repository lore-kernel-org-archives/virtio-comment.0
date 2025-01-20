Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02C1E379B
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384469; cv=none; b=jtzCY29oWTNhRQi/elQPcgTFnMZqJQqbHDhXXoWx/ilQMrTlvs7XPbUI8zat12WfRYMw+iNFS80R2EVeNdz6C6Gw5caK1cFRMYqFO2JD2GjDYv9JPmosj79uPJ13pZVhOnAJx06JYSXPQS7KN3TBYMOiSJHd46XaAF6sr5mEt1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384469; c=relaxed/simple;
	bh=8mNd0wVSQk7926fB6MSnatkHSbhWSuVSZyymX1Xyfuw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nY7WHISPt6iRbtim6SQFS3YC/XaWzer5Lst667rfLZdmoHOR98BBsgHmeerBeiTO0g15ojf+hzf+rDv1WG2uFKRD65btvvVmJIaAI9T66FqMbvFeFEJzZeySLDmdv0lWWfUZ0kMETb1bCpHDYDLHEZeWcGGM1foJIXrsqE/xTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MUPngOJQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MUPngOJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737384466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cpJyA1zut6i+XFOIdLziZi374zVr3kHLYR9BGKY1GUY=;
	b=MUPngOJQSzv0OFhp93V1FRC5yiRFBgY9bf38QvsKdP98cVwAH4YqlX1NlJT7VHlizflKZC
	LjcRzEK4MN5YdqXr1QJ2tqGbU8anIe0pjc24JIOBS1iEL+bWvX9iDkB3FpJ1T+1+E3BFfj
	3/lnWx2Xny34/5153HOXM0ZdmOkWKVM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-lzdnM9-WNi2eiDdhqsqEkQ-1; Mon,
 20 Jan 2025 09:47:45 -0500
X-MC-Unique: lzdnM9-WNi2eiDdhqsqEkQ-1
X-Mimecast-MFC-AGG-ID: lzdnM9-WNi2eiDdhqsqEkQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D9041955DDD;
	Mon, 20 Jan 2025 14:47:44 +0000 (UTC)
Received: from localhost (unknown [10.67.24.38])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6604419560A3;
	Mon, 20 Jan 2025 14:47:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
 mst@redhat.com, mvaralar@redhat.com
Cc: shahafs@nvidia.com, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] virtio-net: Fix to avoid using reserved feature bits
In-Reply-To: <20250120141052.877355-1-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250120141052.877355-1-parav@nvidia.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 20 Jan 2025 15:47:36 +0100
Message-ID: <87frld8ruf.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1cYK5qjZg2o9cyMaZd0ob4RtCcf58i_l2pmNWqSZHFw_1737384464
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Mon, Jan 20 2025, Parav Pandit <parav@nvidia.com> wrote:

> Listed patches in the fixes tag, incorrectly used the reserved feature bits.
> Fix them to use the well defined device specific range.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212
> Fixes: 8cd457d8aa82 ("virtio-net: define UDP tunnel segmentation offload feature")
> Fixes: 3fea589bd7c6 ("virtio-net: define UDP tunnel checksum offload feature")

I guess these commit ids need to be updated with whatever the final ones
will be?

> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

