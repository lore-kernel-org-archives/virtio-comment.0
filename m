Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1E74D131
	for <virtio-comment@lists.linux.dev>; Fri, 31 May 2024 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148360; cv=none; b=cH0wmeiqc2BsFCLi4t2rFK8/Egr6IL7CjJ9UIrg91HWLWunq+0heaKn5hhYmAddZrfQsxoueqbIZRDmOyusGB/KVDCGfyrcU083RbPyQsd1BlpehuN5ubBilgNvRCPwwwtlhrvQbBCdO8xX0MELMQ2hqHLzl8Zs3EDHQrbLhKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148360; c=relaxed/simple;
	bh=MBtnF3SDzkfU/9DIiqh+HwrfEZxszrxiEEkAOqJx+1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eiMaqWkOOxlBpaF+vvSTqh6p9bbAWkdTsLSxoAvaDjicjbPWrRQUdTXSNFSguKiK+sBGMUENPh64O8K/cnzfTy8jBDoqNNfu+gnoA4XDA1ytdYrdw+xHdyRAbrP+jIVZ1tR3rFJAVBMhxbxO+dBtwgz6bRl6OXjq/xr5vnJWRI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y+mEAv6H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y+mEAv6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717148357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w78usuyZSx6MhyM7yxgSMpnMlkNXqBi4AW4Uie2Au/c=;
	b=Y+mEAv6HpJvrQcqPSSOkTxQSGJK/mylBObHdB8FbxrNF2cTxhDGry5LAEdW9L6SGC5u+C0
	rHoQJmIricetnwFiVNqRzz60FqiCcNPTr1pLbg1jvQNeMhVUdn1gZWwImy74N226QK0uKC
	f9CKENpdIBaBcaIue2rHlDR4Y9orkV4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-HNv-FT5WM6OhI_XdQCyCKw-1; Fri, 31 May 2024 05:39:13 -0400
X-MC-Unique: HNv-FT5WM6OhI_XdQCyCKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19273800169;
	Fri, 31 May 2024 09:39:13 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F5B52026D68;
	Fri, 31 May 2024 09:39:12 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Parav Pandit <parav@nvidia.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
In-Reply-To: <1717137374.7931259-3-hengqi@linux.alibaba.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <1716871834.4226007-3-hengqi@linux.alibaba.com>
 <1717137374.7931259-3-hengqi@linux.alibaba.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 31 May 2024 11:39:11 +0200
Message-ID: <87le3qmibk.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Fri, May 31 2024, Heng Qi <hengqi@linux.alibaba.com> wrote:

> On Tue, 28 May 2024 12:50:34 +0800, Heng Qi <hengqi@linux.alibaba.com> wrote:
>> On Tue, 28 May 2024 12:47:02 +0800, Heng Qi <hengqi@linux.alibaba.com> wrote:
>> > The device can set any initial coalescing parameters (0 or non-zero)
>> > for the receive/send queue before the setting command is executed,
>> > not just 0, enhancing device performance even without DIM enabled.
>> > 
>> > So we need to clarify descriptions that don't fit the behavior.
>> > 
>> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/194
>> > Suggested-by: Jason Wang <jasowang@redhat.com>
>> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>> > Reviewed-by: Parav Pandit <parav@nvidia.com>
>> > Reviewed-by: Jason Wang <jasowang@redhat.com>
>> 
>> Hi, Cornelia!
>> 
>> I'm wondering if our voting infrastructure is already working properly, and if
>> so, can we turn on voting for this update patch?

Oh, seems I forgot to send that mail out -- platform still has issues :(

>
> Do I need to repost a patch with the subject prefix [Request for vote]?

This one is already sitting on my list, no need to do so (and we haven't
actually finalized what it should look like, I'm still waiting for more
feedback before proposing a patch.)

