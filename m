Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C41DFF8
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718114675; cv=none; b=d3GyAiTZBEmGWvSSRtIh/lc9H+JB2qJ/WiZOr29kOijKTYsIaioH8SYu311E5Qb8NkIoz076WvdjJCGfgmdOCd9ZGdbrN8jT4ie13wSRnopb1jQC7gREY1i2Z0hZcMMMiTVA5S0Cyif8ZM4VsHnAUlNI3roRRN6M2CzKqScQ5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718114675; c=relaxed/simple;
	bh=X7X96Nx9N6d260TKkxYf/Z0u+Z/FPFQI5k44SA0e6Nw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cqARJ4dUwsCriayF0RSTwh4QqxAYvXHcGy560RMGbT4E7F6AEigOqpdmmgwr3xANpx8pbzeOYl68pu1XTcUXAUrl3NIBQ14EhcPehEr+HPmEQVa5K94dbUbIT/HlTfNjklQHcZbm1Hi+CUUcKrrFmJ9t0UsbmTr0I4I1eVGJPFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PDYpKU2s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PDYpKU2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718114671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KzxCzQevN4MRti8nvvEERfxIeUqsF/8VWC55ou8HoBQ=;
	b=PDYpKU2sHeBk2Rqe09u2zG0OqgSdaBGZuCklX/IlHCBnZdXHjxW9bDtx8H/pqYaXFi85Fx
	Vw2ua3eEzzbK/L5sJVx4WbFlAvCvg5G3H1OVepmTVpB/+y0IO6plmr6ggr16fhZhwoqagL
	8UhA+iCqgHA78kX0JolwSq47Ymdol9M=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-JRSC4W4WMIOEOgy6fFIUvA-1; Tue,
 11 Jun 2024 10:04:27 -0400
X-MC-Unique: JRSC4W4WMIOEOgy6fFIUvA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A66121954208;
	Tue, 11 Jun 2024 14:04:19 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCD661955F05;
	Tue, 11 Jun 2024 14:04:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, virtio-comment@lists.linux.dev, Jason
 Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
In-Reply-To: <20240610104618-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240528044702.50603-1-hengqi@linux.alibaba.com>
 <20240607220246.3213607c.pasic@linux.ibm.com>
 <1717814062.4461155-1-hengqi@linux.alibaba.com>
 <20240610144602.57a04723.pasic@linux.ibm.com>
 <1718026545.7557275-2-hengqi@linux.alibaba.com>
 <20240610104618-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 11 Jun 2024 16:04:01 +0200
Message-ID: <87tthzk23y.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Mon, Jun 10 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Jun 10, 2024 at 09:35:45PM +0800, Heng Qi wrote:
>> On Mon, 10 Jun 2024 14:46:02 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
>> > On Sat, 8 Jun 2024 10:34:22 +0800
>> > Heng Qi <hengqi@linux.alibaba.com> wrote:
>> > 
>> > > On Fri, 7 Jun 2024 22:02:46 +0200, Halil Pasic <pasic@linux.ibm.com> wrote:
>> > > > On Tue, 28 May 2024 12:47:02 +0800
>> > > > Heng Qi <hengqi@linux.alibaba.com> wrote:
>> > > >   
>> > > > > The device can set any initial coalescing parameters (0 or non-zero)
>> > > > > for the receive/send queue before the setting command is executed,
>> > > > > not just 0, enhancing device performance even without DIM enabled.
>> > > > > 
>> > > > > So we need to clarify descriptions that don't fit the behavior.  
>> > > > 
>> > > > Sorry I'm late to the party -- again! Just for my understanding: how/why
>> > > > is this a clarification and not just a (basically incompatible) change?  
>> > > 
>> > > In my opinion, "clarification" means that something may have been described
>> > > incorrectly before, and we now need to discuss, explain clearly, and correct
>> > > the possibly incorrect description.
>> > > 
>> > 
>> > I figure the difference in perceived semantics of the word
>> > "clarification" is at the root of my confusion. Let us have a look at
>> > https://dictionary.cambridge.org/de/worterbuch/englisch/clarification
>> > 
>> > According to my understanding a "clarification", while an improvement in
>> > ease of understanding and/or decrease of ambiguity (possibly to no
>> > ambiguity at all) implies that what receiving a clarification is not
>> > outright wrong.
>> > 
>> > When rectifying something that is outright incorrect or wrong, I would
>> > refer to that with words like "correction", "fix", "erratum" or
>> > "corrigendum".
>> > 
>> > > > 
>> > > > I mean if I read this correctly, before the driver had the guaranty
>> > > > that if the parameters are not set by the driver, negotiating the
>> > > > feature does not introduce any coalescing. After this in theory
>> > > > the device could just pick some max value and potentially introduce
>> > > > maximal latency in certain scenarios.  
>> > > 
>> > > "maximum latency" also means "throughput improvement".
>> > > 
>> > 
>> > Under certain assumptions. But not necessarily. Again my concern is
>> > mostly the type of change. The virtio standard maintain a revision
>> > history appendix, and I would like to avoid the nature of this change
>> > being misrepresented there. If Connie and/or Michael think it is worth
>> > fixing, I believe it can be fixed with an editorial change.
>> > 
>> > AFAIU VIRTIO_NET_F_NOTF_COAL and VIRTIO_NET_F_VQ_NOTF_COAL are about to
>> > land with virtio-1.3, i.e. there is no released/standardized virtio
>> > version where the "initialize to 0" is released. In that sense it looks
>> > like we are still on time to change this. But I am not 100% certain. In
>> > any case I don't think this as a huge impact and I'm fine going ahead
>> > with the change.
>> 
>> Sorry for the late reply, I'm on vacation.
>> 
>> I agree with this, and I prefer to release this patch as a correction for
>> virtio1.3 instead of a new patch for virtio1.4, because if devices support moderation coalescing based on virtio1.3,
>> and after virtio1.4 is released, these devices need to be updated again for a
>> more reasonable coalescing parameters.
>> 
>> Cornelia and Michael, what do you think?
>
> The TC is just voting to start the public review process.
> We can defer that by a couple more weeks if there is
> a known issue to address.
>
> For that I expect we want a final patch  and a couple of acks
> on list from TC members by end of the ballot, June 13.

FTR, I'd be fine with that if there's a consensus, but I'll not be
around to handle this personally. I also have no objection to proceeding
with the process.

