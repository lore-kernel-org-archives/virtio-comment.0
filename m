Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC111993A3
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737375612; cv=none; b=c2litYG4d448ItGs9L6n8fe75EnS4IramM2cOprIBmkyOUgd/4yMXfrV07o4LS9ox2WcAVejzvQvDNLZ/nACt/yyHDguBXUM8I24XHreIMUDEEB00eE+wrQjprd+MyYAfaPlmEWD5f1jiaFp7FA6DTWjzSSdDeMMJ3Z+BLQQJ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737375612; c=relaxed/simple;
	bh=VVW4+eJuax8t12reLuAAWpUFf2QtYnUM1tQI9frC9Zc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g4aYUU34Fl5m9wDvNQzZyocW2vfVLvUByYFDfGNLEl1vWFmZS9073Xy0dBPfQLIC3AlaoqcSIHgHW3RZAu0u1w8kooobMM/lNm/+Cs7wHuD4HkP0m1AaM9ZFeZfVsSB6SIoPXJt17pmeP7jb4CVOeGdWtqyzt0rZoZT4dZJ76QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aRBfkcKE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aRBfkcKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737375610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=46AIetcoMEjr9tgBioAJ8cqaKNZpAF8F4L8G9niiAJo=;
	b=aRBfkcKECCUtK3dSBZX8QfjYgCSR6KaTnII99IDH3ru86FTQZ1hYMFCV4BrhCQjLbmIdpy
	hEnsg3Q/yaud/t/neCq+vIYF/c//LMUsQWCQbDqYnzCplr2m/6S3AQXbmVAesVKMJYPa4f
	FPAoaffWrHSXK+AUIkPge0ayz/V92Nc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-Mzzc6pfRPUSP9rlNt3NbmA-1; Mon,
 20 Jan 2025 07:20:06 -0500
X-MC-Unique: Mzzc6pfRPUSP9rlNt3NbmA-1
X-Mimecast-MFC-AGG-ID: Mzzc6pfRPUSP9rlNt3NbmA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67E32195608D;
	Mon, 20 Jan 2025 12:20:05 +0000 (UTC)
Received: from localhost (dhcp-192-197.str.redhat.com [10.33.192.197])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DB043003FD2;
	Mon, 20 Jan 2025 12:20:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco
 Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
In-Reply-To: <CY8PR12MB719550ABC66CDDF8D71E2F7DDCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
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
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 20 Jan 2025 13:20:02 +0100
Message-ID: <87ikq98yod.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5L4sOZc8btQGG5Zyd8Mmz2CIctAqLnLavH10KmsvU-0_1737375605
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Mon, Jan 20 2025, Parav Pandit <parav@nvidia.com> wrote:

>> From: Cornelia Huck <cohuck@redhat.com>
>> Sent: Monday, January 20, 2025 2:34 PM
>> 
>> On Sun, Jan 19 2025, Parav Pandit <parav@nvidia.com> wrote:
>> 
>> > Hi Paolo, Michael,
>> >
>> >> From: Paolo Abeni <pabeni@redhat.com>
>> >> Sent: Wednesday, November 27, 2024 3:07 PM
>> >>
>> >>
>> >> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive
>> >> GSO
>> >> +packets
>> >> +  carried by a UDP tunnel.
>> >> +
>> >> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive
>> >> GSO
>> >> +packets
>> >> +  carried by a UDP tunnel.
>> >
>> > Feature bits 42 to 49 are not applicable to device specific type. They are
>> reserved.
>> > Please see the note.
>> >
>> > Current spec description is:
>> >
>> > 0 to 23, and 50 to 127 Feature bits for the specific device type
>> > 24 to 41 Feature bits reserved for extensions to the queue and feature
>> > negotiation mechanisms, see 6
>> > 42 to 49, and 128 and above Feature bits reserved for future extensions.
>> >
>> > So 2 bits of these patch and of patch 4, 46 to 49 to be shifted to bits 65 to
>> 68.
>> >
>> > Or an alternative would be to amend,
>> >
>> > Bits 46 to 127 for specific device type, And 42 to 45 and 128 reserved
>> > for future extensions.
>> >
>> > Michael,
>> > Please let me know so that I can have the follow up patch to this one as
>> voting is started.
>> > And the fix is required for it.
>> >
>> > Is there any historic reason for 42-49 as reserved, or it can be used as
>> proposed in this patch?
>> > If it was only kept as elastic buffer for device generic, and device type to
>> grow it is probably ok.
>> > Using 46 to 49 has small advantage to reuse in the offloads bit as below.
>> > Please confirm.
>> 
>> See the reasoning given in 88895f56e642 ("Reserve more feature bits for
>> device type usage") -- the idea was to push out the point in time when
>> generic feature bits will have to be in the bit area beyond 63. Given that we
>> only used one of those generic bits in the meantime, I assume it will still be
>> some time before we run out of bits, even if we let the net driver grab some
>> bits there. Still, I'd probably prefer that the net device used different bits.
>> [And issues like this are easy to miss during review unfortunately.]
>> 
> I made assumption that one would have picked the device specific rage.
> I missed to detect this early enough, my bad. :(
>
> Given that we are only left with 4 bits in range 42 to 45, at generic level, it seems wise for device-type to consume feature bits in its defined range.
> For virtio-net, bits 65 and higher are preferred.
>
>> However, if the device was to use different bits, the clean solution would be
>> to withdraw, respin, and revote. If we only changed the reserved ranges,
>> we'd be fine with a change on top, so that would be less hassle in the short
>> team. If we decide that we can live with the smaller feature bit space below
>> 63, I'd be fine with that solution.
>>
>
> I am fine either way to merge this and fix immediately for using bits 65 and higher.
> My preference is to use bits 65 and higher.
>
> Or as you suggested to respin and revote right away to forward with bit 65.
>
> Please let me know.

Personally, I'd prefer to handle this in an "atomic" manner, i.e. making
sure that no version ever has the wrong bit numbers... maybe if you did a
fixup patch that changes the numbers, and commit these patches + the
fixup all at once? Less churn than doing the respin and revote dance.

>  
>> >
>> >
>> >> @@ -1862,6 +2068,7 @@ \subsubsection{Control
>> >> Virtqueue}\label{sec:Device Types / Network Device / Devi
>> >>  #define VIRTIO_NET_F_GUEST_TSO6       8
>> >>  #define VIRTIO_NET_F_GUEST_ECN        9
>> >>  #define VIRTIO_NET_F_GUEST_UFO        10
>> >> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
>> >>  #define VIRTIO_NET_F_GUEST_USO4       54
>> >>  #define VIRTIO_NET_F_GUEST_USO6       55

