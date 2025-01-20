Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37F1E3DD8
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384637; cv=none; b=aF6TP4lDGDkEuBCFR4xITIPRa1m8qVlx3yhZxVTfY7KHcR1s8rOSTuQVSNQf92HFFRJJNIdFmC2BohVay8IfK9lW6lST/PlnU3xidzrvt9zV98JdaP6wkwEreTbt0/tB9NBQi227wO8SMwzJxyflRVlawS+XobW76ccnU3lA4y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384637; c=relaxed/simple;
	bh=1GZakQDi1wNdVKDdRJyahWz0F3WaPzsf8ayY/VQe88I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qdR81A28JCGA/2f3w2xhhWj7BaLyvuhgQqRLmBu/sAwS+/GO1DLoVoH8r0okMqpCE/W1aG7QcD2W/8odtcE6MYgZre1KvbHW0Yk2KhqKZ+ijrrkG7AArjMr1AtiyLYLG5b4u6g2Ih58dymWo/g5mCgQaAzVsEa8Cq9H2+DtocHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UAIcNhUU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UAIcNhUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737384634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=loIpuWdALnsTFMwodQ9vdnoeCh+SOFmkbSJWezwWt+c=;
	b=UAIcNhUUWebY0QBkONBYTmwAq2dpnHGBE6EyemE8e0Zt4nWRahGAwCWDpkkJBUpnpLX4NG
	vhYGPGHpZ0SsAFabT+t2qrV6UDFdPpJCP7jKpWd8V/beLJzqr8ijTdhcEr/lPvJya5/Dh6
	LgsaxbXVXcDt33AIo+fBs5VzfGEsQP8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-3GEkecXqPxGXvJF1ayzPdQ-1; Mon,
 20 Jan 2025 09:50:31 -0500
X-MC-Unique: 3GEkecXqPxGXvJF1ayzPdQ-1
X-Mimecast-MFC-AGG-ID: 3GEkecXqPxGXvJF1ayzPdQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E08AF1955DA0;
	Mon, 20 Jan 2025 14:50:29 +0000 (UTC)
Received: from localhost (unknown [10.67.24.38])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23C4F1956053;
	Mon, 20 Jan 2025 14:50:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco
 Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
In-Reply-To: <PH8PR12MB7208F319B0C0380FAD5DA45DDCE72@PH8PR12MB7208.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ldv597rl.fsf@redhat.com>
 <CY8PR12MB719550ABC66CDDF8D71E2F7DDCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ikq98yod.fsf@redhat.com>
 <PH8PR12MB7208F319B0C0380FAD5DA45DDCE72@PH8PR12MB7208.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 20 Jan 2025 15:50:21 +0100
Message-ID: <87cygh8rpu.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pgzAlGXlKaSJfKRQMpuDQAxjCCFMLnSJtghlb5ilexs_1737384630
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Mon, Jan 20 2025, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Monday, January 20, 2025 5:50 PM
>> Personally, I'd prefer to handle this in an "atomic" manner, i.e. making sure
>> that no version ever has the wrong bit numbers... maybe if you did a fixup
>> patch that changes the numbers, and commit these patches + the fixup all at
>> once? Less churn than doing the respin and revote dance.
>> 
> Here it is.
> https://lore.kernel.org/virtio-comment/20250120141052.877355-1-parav@nvidia.com/T/#u
>
> Do we need to open a new voting request for it? yes?

I guess if you get an ack by the patchset author you could do it as an
editorial update? Michael?

