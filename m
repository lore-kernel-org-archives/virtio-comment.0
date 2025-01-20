Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2DF195FE5
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363833; cv=none; b=ePcWqUFguFkDIMqWRm0S6VLddLrsRJru8CQ/G3MA2Y+GeJ/FScqESQ5fJV/YVGf3K5YKgAj9/V2o1PKaq6ukgN3Vf+5two9Gjlw+Jad4JTdeybwdOjwQMP73UQOs74m7KQmoJln3kTeT/kUIWzTv1Lj90UvIHQn0eTuYe7OyAlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363833; c=relaxed/simple;
	bh=34thzL/HPrDn5af/FWPbfgmhgSK1HuXa8iou1NSSTaM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UBwz8P0aJpxDBbIBCBVsoBOE8sxKUT7+s+FteJuGkLsV4S9n8QfmtpjS8P8rfXu/j3Pwl3OjOu+pqAfsPAfIXMq4yf4yzXN9oDbgkuYtylC1eZlca1B8vdYU594zLPPn+oupcF2PoQxi4PyOUGFNg3T9aypRlvvdU/byp/uQSO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H6mM7X2+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H6mM7X2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737363830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zPb7TQYViDWUz0l1Q3A39i/ECNeqW0sdu7h8iNpRgzA=;
	b=H6mM7X2+QQFZP6ETyRAugWPazViH/qzXD/j4zjGKIonzHAbZPEWVOu52v+9g8EyzOSH92V
	2Qo7Cl907C7mM8c8QSpDTmDcuw/0EG41cNOIl//kZP6KWxEtOAwrQn8+fWYh4yCWmeac9e
	4Z3IIMLwaHGxITvlkKCURVxio7GdBpE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-eopfU5r_NjibY4wuBquFAA-1; Mon,
 20 Jan 2025 04:03:47 -0500
X-MC-Unique: eopfU5r_NjibY4wuBquFAA-1
X-Mimecast-MFC-AGG-ID: eopfU5r_NjibY4wuBquFAA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BADA61955D6D;
	Mon, 20 Jan 2025 09:03:45 +0000 (UTC)
Received: from localhost (dhcp-192-197.str.redhat.com [10.33.192.197])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E323A19560A3;
	Mon, 20 Jan 2025 09:03:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco
 Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
In-Reply-To: <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 20 Jan 2025 10:03:42 +0100
Message-ID: <87ldv597rl.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F_uOphX5EseVIuVWcbtDnfGE0wIiUGs9pWxbcAzVBq0_1737363825
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Sun, Jan 19 2025, Parav Pandit <parav@nvidia.com> wrote:

> Hi Paolo, Michael,
>
>> From: Paolo Abeni <pabeni@redhat.com>
>> Sent: Wednesday, November 27, 2024 3:07 PM
>> 
>> 
>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive
>> GSO
>> +packets
>> +  carried by a UDP tunnel.
>> +
>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive
>> GSO
>> +packets
>> +  carried by a UDP tunnel.
>
> Feature bits 42 to 49 are not applicable to device specific type. They are reserved.
> Please see the note. 
>
> Current spec description is:
>
> 0 to 23, and 50 to 127 Feature bits for the specific device type
> 24 to 41 Feature bits reserved for extensions to the queue and feature negotiation mechanisms, see 6
> 42 to 49, and 128 and above Feature bits reserved for future extensions.
>
> So 2 bits of these patch and of patch 4, 46 to 49 to be shifted to bits 65 to 68.
>
> Or an alternative would be to amend,
>
> Bits 46 to 127 for specific device type,
> And 42 to 45 and 128 reserved for future extensions.
>
> Michael,
> Please let me know so that I can have the follow up patch to this one as voting is started.
> And the fix is required for it.
>
> Is there any historic reason for 42-49 as reserved, or it can be used as proposed in this patch?
> If it was only kept as elastic buffer for device generic, and device type to grow it is probably ok.
> Using 46 to 49 has small advantage to reuse in the offloads bit as below.
> Please confirm.

See the reasoning given in 88895f56e642 ("Reserve more feature bits for
device type usage") -- the idea was to push out the point in time when
generic feature bits will have to be in the bit area beyond 63. Given
that we only used one of those generic bits in the meantime, I assume it
will still be some time before we run out of bits, even if we let the
net driver grab some bits there. Still, I'd probably prefer that the net
device used different bits. [And issues like this are easy to miss
during review unfortunately.]

However, if the device was to use different bits, the clean solution
would be to withdraw, respin, and revote. If we only changed the
reserved ranges, we'd be fine with a change on top, so that would be
less hassle in the short team. If we decide that we can live with the
smaller feature bit space below 63, I'd be fine with that solution.

>
>
>> @@ -1862,6 +2068,7 @@ \subsubsection{Control
>> Virtqueue}\label{sec:Device Types / Network Device / Devi
>>  #define VIRTIO_NET_F_GUEST_TSO6       8
>>  #define VIRTIO_NET_F_GUEST_ECN        9
>>  #define VIRTIO_NET_F_GUEST_UFO        10
>> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
>>  #define VIRTIO_NET_F_GUEST_USO4       54
>>  #define VIRTIO_NET_F_GUEST_USO6       55

