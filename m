Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DDE1BD01D
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829609; cv=none; b=TfH+kti9x0dcp/fZ52CVg+KOG3166majBLHLabvM8bBW37RFq28qMTVASHwk8KDTHMqGxDIR6kCVTyVsZYcez2u+stHKGKm0qOsctb6YOd6Kd0yuiK5XHQ+JwtYwypQ6ZmpCswhRpFh4VcYhvni+Shk5ctQQxxaIxm9oyrMPsDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829609; c=relaxed/simple;
	bh=50tV3EUQJQJiqNYsEHjCf3d4dGFouH8tLprrim32SeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdrtPUvIFt5aZFExR500cX6is/q5tZp+0Nbs35jYKHu1YxztdKUdL1+V0CdWnBNOY+cO5THDOAQYBJ6w31h+7OaxQy37PlYkgRPBGKq9U6VgT9VjKUJh6euxolNa/wtwTsa5+ZrbgJ5xt9iOwZLQeQymhqPUwZXBCzEeJhs6Evk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dycWWMIa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dycWWMIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745829606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuhfDLOQDCinap6QdSYjAqhPflsMcL0A7i5GbmcZcRc=;
	b=dycWWMIaS9L53MsHnyjpJnaA5DJ0iwhQ6DpejJQRic/Kpv+WRsZrJUtXf1Qt4QTRQ6xZmN
	qfMmm0CGBzRwgBtlpturl7v1/QCsqFyFiN9lHNv65IFRyUkbdmrVCEaVc8UGUIzogoJrzi
	/AGx7WrIgqhqmuuJA58cfEl22uPo/eA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-RyXBKRvLMzOihU6ojvcPwA-1; Mon, 28 Apr 2025 04:40:04 -0400
X-MC-Unique: RyXBKRvLMzOihU6ojvcPwA-1
X-Mimecast-MFC-AGG-ID: RyXBKRvLMzOihU6ojvcPwA_1745829603
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so17507735e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 01:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745829603; x=1746434403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuhfDLOQDCinap6QdSYjAqhPflsMcL0A7i5GbmcZcRc=;
        b=llwcseYN/2JGn9CtsAMMEscvxmstWh2l/h2e0GTatXcfW85VjK7DQ//W6Gbdy574k7
         OC7g3MVICKlwanlpblXBBWG4zz9Ta7Int88UHEcGxNEe1beVulE6N48o1RivcSdvF+J+
         tO3sLEWS5LgKyT36PFz662Cy1vhVezCWYx+X7EDT+WjN3iGAFNV74h7G/tiv0pS4guwe
         zLebA/tQDl4HZf9QcpRT1sy5p0GDxDfP1nFh0zVEeroU+6E2aRsemNyDZGtnmkdB5267
         UuG2I3VW8ygaq6plKta4suaelCKKXoL14LPVPXFIITDyTr4yXyPsroIRv2aEsya6Iydg
         JvCA==
X-Forwarded-Encrypted: i=1; AJvYcCWcVJsq9O1RE5fuYFEmfoM97USQhLXOeL0Jh0u41vwnlZlCcrartf/2J5oAIFYumqChZV+5bhpbIrOE2ryxgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyHxNiN+fELGg4SNVc24MZAxM24tUkF241jhxl6aPLvvn0hfNu
	iK/uPlRbmOrKUdg2SjwXbHUwVjXpxZ2mdzfvlMf2tHrvopRG1SfDPaGqWLdshXHFgL/5h5ChPuP
	bsZJUepTCvcGUFz7+hQjg6wdaIuVYZN9Lb/ZY/01oOSMEbzdw3VxqKUOdCJL0FzmO
X-Gm-Gg: ASbGncsVzclN5G/LLkAkU+U50TdB0gY1SU3Chp6CYcoZcDeisLI0c2R8lfx4iRdidE0
	t0u+oKQSHNHdm22JmZtHTaILhDL1993Zcbs3i/QdEga1LaaGPeF3RVH24drKukUj9J8/q3kbDHq
	Pnpa+nNmhOr97xCnMGqv3lV4zhiRFQJPOmAJZ44unT609RqFBq7LcrwcpkDfDjTmFKBcTbjjnol
	cq9RT5HgGtcWGiPo3m8F55fU+N4eWol4HCZKIddSTodrTXHGMk8QKWJpet7KPCTDab8mC4b8Cry
	h9go+GoIgP1yRFJnPlQ=
X-Received: by 2002:a05:600c:3b92:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-440a65ba1fdmr106244305e9.3.1745829603269;
        Mon, 28 Apr 2025 01:40:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUK05w5eO9hLRF7IES1pBlBkCVuK0+vTK35v9b4Ok3Wk7bPZaOaxE6/G/in4ngaWirioUnAQ==
X-Received: by 2002:a05:600c:3b92:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-440a65ba1fdmr106244045e9.3.1745829602869;
        Mon, 28 Apr 2025 01:40:02 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910::f39? ([2a0d:3344:2726:1910::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1e8sm117723895e9.28.2025.04.28.01.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:40:02 -0700 (PDT)
Message-ID: <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
Date: Mon, 28 Apr 2025 10:39:59 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
 cohuck@redhat.com, mvaralar@redhat.com, Jason Wang <jasowang@redhat.com>,
 shahafs@nvidia.com, Willem de Bruijn <willemb@google.com>,
 Daniel Verkamp <dverkamp@chromium.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250423140404-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a8Tgf37__gw79Id4nLE9VJ_oa95epZmKaQ65BI9SYR0_1745829603
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/23/25 8:07 PM, Michael S. Tsirkin wrote:
> On Wed, Apr 23, 2025 at 09:29:11AM -0700, Daniel Verkamp wrote:
>> On Tue, Apr 22, 2025 at 10:46 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>> I'm afraid we'll have to bite the bullet.
>>
>> One other issue with bits > 63 is that the vhost-user protocol
>> VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES messages use u64
>> to represent the features, so vhost-user-net devices can't query or
>> enable these features. vhost-user is outside the scope of the virtio
>> spec, though, and I think it's reasonable to extend the protocol to
>> enable high feature bits rather than avoiding them forever.
> 
> Yes you would use VHOST_USER_SET_PROTOCOL_FEATURES to make VHOST_USER_GET_FEATURES
> return two u64s, or even a new message returning an array.

I think that additionally the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command
will need some clarification, as in the current text looks a bit
inconsistent:

"""
// in Offloads State Configuration / Setting Offloads State:

#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46

// ...

The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:
VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads configuration.

le64 value passed as command data is a bitmask, bits set define
offloads to be enabled, bits cleared - offloads to be disabled.

There is a corresponding device feature for each offload. Upon feature
negotiation corresponding offload gets enabled to preserve backward
compatibility
"""

The "corresponding device feature" has the same numerical value of the
selected offloads, except for UDP tunnels related one (which are mapped
to bits corresponding to reserved features).

It's unclear to me which should be the better way to address this
inconsistency.

/P

