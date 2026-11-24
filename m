Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552517;
	b=09tDLPXPvGSuwqgTJDmHMV1poELTtiL0rsCMyLtM8GjmB7RFj38qJWuZqk3TjM/toiVB
	 DI8d5z0CmdRi+GL/n+P6X6XgvxW3r6SG30+nMR8bex9IRJDyOodcHTwgkUie2WZbPRnMp
	 zWaKJvamkeNuHI+g61HK3GBOjmS2hvzwovLyLdzVLmiPxu3c+L4/t8hytB1b1p9rUa9PO
	 SlcfpxGrN0XuWbdJAgiezuYrwIFClkUe3ivSzOLiR0bCtysULfVlWelna/jwpjly+pu8/
	 tfviBuFIkeiRvEwR4iuvhDdPmfMkz6PB5FlJvP5LNa1z1ylJYA6fzv49sSBKDLydukw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552517;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=bmKp4b/mcXOnroyt7RnaWHCHD8Bil2G8g0yn8wBpOQI=;
	b=hHxy7rj3AZ8RAXdIbTQwflCqH4Z7ze78nrpl/HbZtkFkH7MKOX/uaDZ57YkBeuochtM4
	 y7ngWksd5nRllQmFPwClDWPZCrpygnm/ys1iriv0bG55kXjVY43qztOkSQyBcN0MqGvaU
	 lg1gqvBsx9le9hrn+FgSPrKMz1+5g45PaFbWjxw/xLlFFuJx4aCgAXAsSrHiIlR5Q0vxJ
	 VmmB9TUi5F7jt+uR9PT4i4IEYKJGoKijs+fi+QnRNYumf9Cj1GcJQoUWKzWX/GT/1dSqo
	 0/IWpuCqsmuKVcVOr47Rt6uDQTm5KCA1erFk4WN4Ud3l8RIUL0qpPjRxuEvD6gdZVIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MI69a90E;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88E8606A31E
	for <virtio-comment@lists.linux.dev>; Tue, 24 Nov 2026 20:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88E8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MI69a90E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795552515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bmKp4b/mcXOnroyt7RnaWHCHD8Bil2G8g0yn8wBpOQI=;
	b=MI69a90EZbAABVgheDaaaLvCOg2v/JbHM9MTCjMwyEEvegg5uVshIGFGRx4WnkAJ7lK6Wq
	B2XRT+WFbDWNgzaR8zxAJ0u6ixLclRbcF+bG5xq2DGOzlq400GuanrRINTZGjiJ4njpcMI
	OtMId0ey1F6muU2Hcg/Oc8k38uD04Fs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-255-z8FZZYlYMHuB-k5-orPR6g-1; Tue,
 24 Nov 2026 20:35:13 +0000
X-MC-Unique: z8FZZYlYMHuB-k5-orPR6g-1
X-Mimecast-MFC-AGG-ID: z8FZZYlYMHuB-k5-orPR6g_1795552512
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66F5E1944A9A;
	Tue, 24 Nov 2026 20:35:12 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0CF3218011D4;
	Tue, 24 Nov 2026 20:35:11 +0000 (UTC)
Date: Tue, 24 Nov 2026 15:35:11 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Keiichi Watanabe <keiichiw@google.com>
Cc: virtio-comment@lists.linux.dev, hattorij@google.com
Subject: Re: [PATCH] split-ring: fix inverted empty-ring checks in receiving
 used buffers note
Message-ID: <20261124203511.GC1934447@shajnocz.csb>
References: <20261120192838.1171099-1-keiichiw@google.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261120192838.1171099-1-keiichiw@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5G3wVTdZWAO2JQLjREmSzeYccrL90zuae4fyEUhl7XU_1795552512
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2026 at 01:28:38PM -0600, Keiichi Watanabe wrote:
> In the Receiving Used Buffers From The Device polling example, both
> comparisons check `vq->last_seen_used != le16_to_cpu(virtq->used.idx)`
> instead of `==`. When unconsumed used buffers are present
> (`last_seen_used != used->idx`), the loop immediately enables
> notifications and breaks without processing any buffer; when the used
> ring is empty (`last_seen_used == used->idx`), the loop skips the
> re-enable/break block and reads past `used->idx`. The snippet also
> mixes `virtq->used.idx` with `virtq.used->ring[...]` and omits the `&`
> address-of operator when initializing `struct virtq_used_elem *e`.
> 
> Replace both `!=` checks with `==`, use consistent `virtq->used->`
> member access, and take the address `&virtq->used->ring[...]`.
> 
> Signed-off-by: Keiichi Watanabe <keiichiw@google.com>
> ---
>  split-ring.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

