Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A64B1E65
	for <virtio-comment@lists.linux.dev>; Tue,  6 May 2025 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518178; cv=none; b=sibEVW/XmqF4ZKgHIK8hPDqVJHAFJ4fUxgkcdSqpK14w9l5XZGzoWuuKqMj3f74AdZrP3l0NbkxtNO1cm3uDuRUlojJ0mnZjag96At2qo7dBURklt+657AFDVSWKNevOi8PX3uF3YsJcAQ8ONUXwQeihWFvLBtXf2ecWzckXK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518178; c=relaxed/simple;
	bh=uOoFYf3h0xFRwhtLw/8ezlO9uIpm0/52c+rlvaBODTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PaNomxzDOWiW3bL0E3nVmZlsE+/+JRYa2cSXsfKZeCB03abpEgyL8pf1U974Npw6OPAPcTVx5w3PHJieAWfKVpqXTEMgoZbuSU3Qde0O+1HiIrhblnAO+glPp9PJ6NQQl4Y2SKum2amkrz7stUTqikSrTwTatG/FikOG9LATcKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UHQwll0b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UHQwll0b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746518174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vJqKefusqEm9y4IXnREe036xPL7KUvPhL/FqTguUc8=;
	b=UHQwll0bbfYJuIHw2bi+bQlmuEXoARdrddqOfqbL8Ef3KYU8W/e/LfD+32emttimoQeo/u
	zDv/0bEllFJ812GQuFgkfP1dbuhoyDvLhRh3iYEKt5qbAxOAcvCUxggato2nZmHAaa8a48
	Qd/m8ERWBzvdjRzgKlcAqMi0uX9eXig=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-FOHRJmcUOYmJ6tD5jlqHIQ-1; Tue, 06 May 2025 03:56:11 -0400
X-MC-Unique: FOHRJmcUOYmJ6tD5jlqHIQ-1
X-Mimecast-MFC-AGG-ID: FOHRJmcUOYmJ6tD5jlqHIQ_1746518170
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c2da64df9so2349142f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 06 May 2025 00:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518170; x=1747122970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vJqKefusqEm9y4IXnREe036xPL7KUvPhL/FqTguUc8=;
        b=Ar2Mqb94838w6Wym9bYGj+HwEDTc6EIXXfukcsxdtdYlxxj4smBVs5dS9E8I4bNxUc
         HWNqUcYL0maIB/Br09whpRf5b1W5iCMYA6F+xncp+SvLkRSIEhy18YSsHAlZS6FOXSP+
         pODu69jzH3xM37YT+eRjP+eMd9hzZnu9EhoLx3I5XT9mUMSvaC7Kt9snBMljILMgYj6g
         edKb4ulogwedyxq2BW1+VOmoveO9x/EgzDdew8w+sz1wZX3LMi63phzpkgD1ulBfq1sr
         7eJUPGPelNYNLGG7IOEkNVjKoD9PNeiAXBZfZn64xCgFXGAKwFOftzz0ewT/yQXKrzNC
         jlmg==
X-Forwarded-Encrypted: i=1; AJvYcCVlV2vP3QbR/6VMmePnmpWbcYjsQdbsDu187fRoBKbjIJFyQ0vZkAtPd+45PTzEoUiSoqkvi5JiAs/6o372ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YykRgplcG78/IAkUNLMYsgCGauHcfE/B5FKDzOZkcDk/badfc9v
	GpgY3Xte/oWSpSnQbSn4uOeM1sjnyHav9ll2gJRhKBX0LJTnEq8rvFcFMysjCKg+myTLp30RKzp
	bSUA7jWImEZZ0yUZ/GBuXXm0AqyR3HqkpjajDQWF+1POorBu+ONUt3uIinnHhwMYY
X-Gm-Gg: ASbGnct0cDyND9SIv8uQHVxh9Sk6hVt1RFFrNh5ZxXf1KK3cDvvVuaFZzoIT0VWa3DO
	SzUJFHesLbGF5Ts3M+OA972F/NgGVm79mIBguKrqe9qprxDGOVHfGP2abEQ1oCg0+NhcsS8l3op
	AbDv5akq8DvCzMFof/S9/tAsJzyOUahoUYigdb7x1IpK4NGVej+msB9kvPcn3i1rx2TPf73e2bo
	lMw9mq3VZHcNm/RVbux8bICJYMQnOysYH6yfyvc4JivE+nYKg/00n6Ao6mD9ohyfORIap3h4ryL
	gOkvhg==
X-Received: by 2002:a5d:5848:0:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a0ac0cb001mr1565112f8f.9.1746518169931;
        Tue, 06 May 2025 00:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwFb1seeeT31tmKqb3uuDDG3tZ5PJLafbLlikNOwjNJ+f8jta5vt9BfDRIJDKscrY2FI88zQ==
X-Received: by 2002:a5d:5848:0:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a0ac0cb001mr1565083f8f.9.1746518169503;
        Tue, 06 May 2025 00:56:09 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae34e2sm12526808f8f.24.2025.05.06.00.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 00:56:08 -0700 (PDT)
Date: Tue, 6 May 2025 03:56:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Paolo Abeni <pabeni@redhat.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Verkamp <dverkamp@chromium.org>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250506035434-mutt-send-email-mst@kernel.org>
References: <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com>
 <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250501093933-mutt-send-email-mst@kernel.org>
 <PH8PR12MB7208BA2F9A48EEBF42B15AE0DC892@PH8PR12MB7208.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH8PR12MB7208BA2F9A48EEBF42B15AE0DC892@PH8PR12MB7208.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: awyELxbZizePsnI3iB3lLHcs_5y6EE-eE0HHyOUnZrI_1746518170
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 06, 2025 at 06:15:41AM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, May 1, 2025 7:13 PM
> > To: Parav Pandit <parav@nvidia.com>
> > Cc: Paolo Abeni <pabeni@redhat.com>; hengqi@linux.alibaba.com; virtio-
> > comment@lists.linux.dev; cohuck@redhat.com; mvaralar@redhat.com; Jason
> > Wang <jasowang@redhat.com>; Shahaf Shuler <shahafs@nvidia.com>;
> > Willem de Bruijn <willemb@google.com>; Daniel Verkamp
> > <dverkamp@chromium.org>
> > Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
> > 
> > On Wed, Apr 30, 2025 at 10:54:12AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Paolo Abeni <pabeni@redhat.com>
> > > > Sent: Wednesday, April 30, 2025 3:42 PM
> > > >
> > > > On 4/30/25 6:44 AM, Parav Pandit wrote:
> > > > >> From: Michael S. Tsirkin <mst@redhat.com>
> > > > >> Sent: Wednesday, April 30, 2025 2:14 AM
> > > > >>
> > > > >> On Mon, Apr 28, 2025 at 10:39:59AM +0200, Paolo Abeni wrote:
> > > > >>> On 4/23/25 8:07 PM, Michael S. Tsirkin wrote:
> > > > >>>> On Wed, Apr 23, 2025 at 09:29:11AM -0700, Daniel Verkamp wrote:
> > > > >>>>> On Tue, Apr 22, 2025 at 10:46 PM Michael S. Tsirkin
> > > > >>>>> <mst@redhat.com>
> > > > >> wrote:
> > > > >>>>>> I'm afraid we'll have to bite the bullet.
> > > > >>>>>
> > > > >>>>> One other issue with bits > 63 is that the vhost-user protocol
> > > > >>>>> VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES
> > > > >> messages use
> > > > >>>>> u64 to represent the features, so vhost-user-net devices can't
> > > > >>>>> query or enable these features. vhost-user is outside the
> > > > >>>>> scope of the virtio spec, though, and I think it's reasonable
> > > > >>>>> to extend the protocol to enable high feature bits rather than
> > avoiding them forever.
> > > > >>>>
> > > > >>>> Yes you would use VHOST_USER_SET_PROTOCOL_FEATURES to make
> > > > >>>> VHOST_USER_GET_FEATURES return two u64s, or even a new
> > message
> > > > >> returning an array.
> > > > >>>
> > > > >>> I think that additionally the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
> > > > >>> command will need some clarification, as in the current text
> > > > >>> looks a bit
> > > > >>> inconsistent:
> > > > >>>
> > > > >>> """
> > > > >>> // in Offloads State Configuration / Setting Offloads State:
> > > > >>>
> > > > >>> #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
> > > > >>>
> > > > >>> // ...
> > > > >>>
> > > > >>> The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:
> > > > >>> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads
> > > > >> configuration.
> > > > >>>
> > > > >>> le64 value passed as command data is a bitmask, bits set define
> > > > >>> offloads to be enabled, bits cleared - offloads to be disabled.
> > > > >>>
> > > > >>> There is a corresponding device feature for each offload. Upon
> > > > >>> feature negotiation corresponding offload gets enabled to
> > > > >>> preserve backward compatibility """
> > > > >>>
> > > > >>> The "corresponding device feature" has the same numerical value
> > > > >>> of the selected offloads, except for UDP tunnels related one
> > > > >>> (which are mapped to bits corresponding to reserved features).
> > > > >>>
> > > > >>> It's unclear to me which should be the better way to address
> > > > >>> this inconsistency.
> > > > >>>
> > > > >>> /P
> > > > >>
> > > > >>
> > > > >> Parav, what's your take here? Given your change broke
> > > > >> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET, do you want to revert it?
> > > > >
> > > > > I see two options.
> > > > > Opt_1:
> > > > > Open source Linux kernel driver and DPDK PMD has not used
> > > > > RSS_CONTEXT
> > > > yet.
> > > > > If Heng from Alibaba acks that they do not have any internal
> > > > implementation either, it may be safe to shift _all_ feature > 63 to
> > > > lower position.
> > > > > We can get Yuri's feedback, if at all windows driver has used RSS
> > context.
> > > > >
> > > > > And once for all we mark it that feature bits are limited to 0-63.
> > > > > There is enough infrastructure in place in virtio spec to not try
> > > > > to squeeze
> > > > things in feature bits.
> > > > > And these 4 bits are good example of it already, which could have
> > > > > been
> > > > negotiated/communicated at later phase of driver at runtime.
> > > > > Only bit required was a bit to expand vnet header size at early stage.
> > > > >
> > > > > Advantage: brings the good practice to adapt to the modern and
> > > > > efficient
> > > > driver->device interface.
> > > > > Risk: May break RSS_CONTEXT (risk looks low)
> > > > >
> > > > > Opt_2. VIRTIO_NET_CTRL_GUEST_OFFLOADS command text to be
> > updated
> > > > to
> > > > > indicate that,
> > > > >
> > > > > Below defines corresponds to respective feature bits 65 to 68.
> > > > > There is still
> > > > one to one mapping, its just position is different inside the class.
> > > > > This is clarification text to be added and sw can adjust for it.
> > > > >
> > > > > #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO 46 #define
> > > > > VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47 #define
> > > > > VIRTIO_NET_F_GUEST_USO4 54 #define VIRTIO_NET_F_GUEST_USO6 55
> > > > >
> > > > > Advantages of 2nd option are:
> > > > > a. featuring bits remain open upto 127.
> > > > > b. Does not break RSS_CONTEXT.
> > > > >
> > > > > Both options are practical to me.
> > > > > I prefer #1, if Heng acks it, but also ok for #2.
> > > >
> > > > I spent quite of bit of time trying to evaluate the scope of
> > > > features bit expansion (implied by the option 2 above).
> > > >
> > > > While strictly speaking I haven't hit yet a complete blocker,
> > > > implementation- wise it's going to be huge and error prone, as great
> > > > deal of both the kernel and the user-space/qemu infrastructure
> > > > hard-codes the
> > > > 64 bit limit.
> > > >
> > > > Even exposing the feature extensions only the the virtio-net device
> > > > (AFAICS it will "minimize" the code churn) a lot of code and devices
> > > > implementations are going to be impacted.
> > > >
> > > > I expect a far away in time timeline for implementations based on option
> > 2.
> > > >
> > > > /P
> > > Given that its painful enough, we can update the virtio spec to limit to 64-bit
> > features as option_1.
> > >
> > > A virtio spec diff like below,
> > > - 0 to 23, and 50 to 127 Feature bits for the specific device type
> > > + 0 to 23, and 50 to 63 Feature bits for the specific device type
> > >
> > > Otherwise, we are delaying the problem to next feature, which is not good.
> > >
> > > Heng,
> > > Yuri already acked, so we are good from Windows side.
> > > With that Windows, Linux kernel, DPDK PMD are safe.
> > >
> > > Can you also please confirm that there are no users within Alibaba relying
> > on RSS_CONTEXT, so that shifting the feature bit will not break any existing
> > functionality?
> > > I think it will not break, because we can update the non-open-source
> > software to detect RSS_CONTEXT on a new bit.
> > >
> > > For example, driver can do,
> > > Enable_rss_context if bit X OR Bit 64 is set.
> > 
> > 
> > sorry if I am unclear, I think it's too late to move RSS really. It has been out
> > there for two years. The reason we can be reasonably sure no one
> > implemented the offloads so far is because the set offloads command is
> > broken and no one complained.  We need to fix them in the spec, current one
> > is broken. So the tunnel offloads can move if it's convenient.
> 
> There are few proposals on table.
> 
> 1. From Paolo,
> - 0 to 23, and 50 to 127 Feature bits for the specific device type
> + 0 to 23, and 46 to 127 Feature bits for the specific device type
> 
> This does not have good reason of why it should still be 127.
> 
> 2. From me:
> - 0 to 23, and 50 to 127 Feature bits for the specific device type
> + 0 to 23, and 45 to 64 Feature bits for the specific device type
> 
> This is an extension of Paolo, to justify that implementing feature bits is extremely hard even for experts as pointed by Paolo.
> It is worth to not extend it further.
> RSS can be negotiated via new bit 44 in future bit as OR of 44 and 64 so that more wider users (Linux, freebsd, qnx, Windows, dpdk pmd) can pick 44.
> 
> 3. From me:
> Keep the feature bits encoding as is up to 127 bits, because may be there is (unknown and weird) value in having 127 feature bits.
> (unknown because the reasoning of #1 and #3 mismatch).
> In that case,
> VIRTIO_NET_CTRL_GUEST_OFFLOADS command text to be updated to indicate feature fits A to D map to 
> VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.offloads bits A' to D'.
> 
> I am fine with option #2 and #3.
> Doing #1 for sure is wrong.
> Wrong because it delays the problem of #1 from this to another feature [A] who's voting already completed.
> 
> [A] https://lore.kernel.org/virtio-comment/DM4PR18MB4269F73B786E83EF68A70F37DFB82@DM4PR18MB4269.namprd18.prod.outlook.com/T/#t


#3 seems more conservate.

-- 
MST

