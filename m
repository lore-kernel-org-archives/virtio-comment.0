Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFFD4F55A2
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 18:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806231; cv=none; b=lNVktLAEqYe2fjGHLHkvN0wx9Qcerd58rpfMuyrV1SCEP+gZRjDbtD/P/KrBXdvV9juCkYvs5UDC1Ori49mSus7p35v2K3WESo2lqrnaNNIliWSslVRtbvvvh0cC/iQJEshUj8F/lgzo39JorNEaRcCUbXx0LEEU/pgVzjurKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806231; c=relaxed/simple;
	bh=lBmonTQyWvxsuAzYGiPOQyfIrH6Ucuq+0v2ajgusGqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Q37m3oIaTE+Z57+E+5fuJnt5ZoJDdEJzmYW61CgNZKqkev7ZUgu7STlcUH/6XIEuIzHEhnd9RPr9cFOjeanyXa3JPk0/n6qtKPiWsok5YylGx29tUWf6PJPV0DbFpbaTH/BpTxJVJLfLGdfqpzMKQmRAeydKBqwLqD96nAXJjtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5yhUSfH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5yhUSfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788806228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ljfIgZh3PT4st9HVrxIPh9M9DDa/6iHRnTwgyzv4r0=;
	b=S5yhUSfH96ZZQ0ClKOn0gaZirl6HL7sUahSePmZzQ2haizbxiNTfrq0Iz7KaaYVq6af93w
	VRtI1vyzycfyZQAEdgPBf18RR/wz3ZmZI4IF5thbk3SaJfiqhPbQb0h0zIA063ZcwzF6q9
	j0c1b2bWL4tveT0ISrLs6lPbEQ2B/CY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-qPqE4YjfPkK272WzWpruEw-1; Mon,
 07 Sep 2026 14:37:07 -0400
X-MC-Unique: qPqE4YjfPkK272WzWpruEw-1
X-Mimecast-MFC-AGG-ID: qPqE4YjfPkK272WzWpruEw_1788806226
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71CE61954112
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 18:37:06 +0000 (UTC)
Received: from localhost (unknown [10.44.32.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BD3831955F06;
	Mon,  7 Sep 2026 18:37:05 +0000 (UTC)
Date: Mon, 7 Sep 2026 19:37:04 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] device-types/blk/description.tex: Allow longer device
 IDs to be returned
Message-ID: <20260907183704.GA4240@redhat.com>
References: <20260907140208.626488-1-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260907140208.626488-1-rjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fPz2MWlUdeisnx198kp9fjmmr6kDKkzrzBzL8j-ZZzE_1788806226
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I just noticed that my cover message _didn't_ get sent this time, so
I'll have to reconstruct it ...

In v2:

- Added the feature bit indicating presence of long IDs.

- Define the length of the data field for VIRTIO_BLK_T_GET_LONG_ID.

- Dropped the whole paragraph about compatibility, but added a new
  paragraph about suggested length of device IDs.

- Other issues raised by mst in the review should be addressed.

A working implementation of this is here:

https://github.com/rwmjones/virtio-spec/commits/2026-virtio-blk-long-id/
https://gitlab.com/rwmjones/qemu/-/commits/2026-virtio-blk-long-id?ref_type=heads
https://github.com/rwmjones/linux/commits/2026-virtio-blk-long-id/

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

