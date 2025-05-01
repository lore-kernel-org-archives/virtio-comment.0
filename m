Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A7126BFF
	for <virtio-comment@lists.linux.dev>; Thu,  1 May 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746106978; cv=none; b=mMnnsNuKSfQAmH9cLrPYy2Ov5a06e1tP7QE5GR66zItS5+Ob9gl5pUcTcT/z0ghQbotpsLg81+2aHHYq/sLEY2kKkbClK+ngDHZy2qgzLID78ccK2NfH8JuiKAevXFAK7zQ1WuKGPghDPa/pvbDadUhtPz8oBLvRYk3HLN5fD2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746106978; c=relaxed/simple;
	bh=eciHu5Yb2Q19teDR7wl62tCL/3hfj2T6nf4Vix6rP9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FGd06pE54JkG6LdZ6UWpdQtkqECW9NoN7wfNXfI5rf7dH696tPUqilYoMrxP7aanp0fbiPLYpI+E5Zf1LDicg16WCwCRxxIvhVf92RNhtdjnEQRC67jvEqZO8uD0YglkGQr0HdimEOIEXGRaAklhjbKrWKfVtKpbrUkmUuK9Ji0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q3nK/foc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3nK/foc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746106975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZ2aAXPewrBHAlyJ8v3vmxIkTI/vSn3I2Gq5QmZZGLk=;
	b=Q3nK/focmUDOVtzvNnJWWTU2Rz4gSdZidM6bLmupIhDzFOW3n3KSFah/TcdZuyq6CmGVA+
	gLUX7o5L44ilgnlFUph29u0lGT14AmOerXftDgqArQvvYsTpfCyIFQvMhNvq6HMMqWSxg7
	3MdNjSNfshLDWIqraiH/16QQyOJhOCU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-kYVFKNffO7e-1nXd7WQ_Wg-1; Thu, 01 May 2025 09:42:52 -0400
X-MC-Unique: kYVFKNffO7e-1nXd7WQ_Wg-1
X-Mimecast-MFC-AGG-ID: kYVFKNffO7e-1nXd7WQ_Wg_1746106971
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912a0439afso251862f8f.3
        for <virtio-comment@lists.linux.dev>; Thu, 01 May 2025 06:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746106971; x=1746711771;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZ2aAXPewrBHAlyJ8v3vmxIkTI/vSn3I2Gq5QmZZGLk=;
        b=QZsv6vUZIof1EF9BN766+/52tyxcRq+ITbcXx4EBSbAmnFTUyrLR6cXM5n1wr/QnPz
         BunZwaOSiWzzMFiavM/Y3uMg4G12LKYJXVDuT7O8uxCVfbkQO9m79IOrvfBF50O4eNZR
         Jx576YM8XtJmNkbUZHKoGN/KSSSf8uZy9XBrM9E5KhHvbdjB6zxOstfcvI8vrywsF1Vk
         wmpT5TDcF0kSzuLXA6Mxwvc2UTD9dQTrsKZYdpWInvGdGqwjYkMCl80h2VCOuny4xv5y
         SiDh03zjUu5aDLdV29ywld6EXqWP3HBDFrRv+KI2xz4rSdKzq6br0zWznpP+OPFI3A9o
         7O3A==
X-Forwarded-Encrypted: i=1; AJvYcCUqbEasCA7/ILhMefT9GWQoxgM+JeokO6WHTmRU8Gk8oIobhPuE+QWf7xrQ/BAusGPqFmKNX7M6SdrsfWVnDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxY8uxRmrTFeDjmArsSf93W0IS4rqBEukaqmWwBZLeGVpgSjKvW
	VYhvh78+Uitn/S1VCVfJQSULEGHqCCr8bR3SyoHTSxFtKRSIZuBQpIqEkI2kSHI/Wvr5Z2DuNE8
	ThEzixEMcOyQO2ClpNZyrEwJS03ZwMdDW6AJawF83FZwnZ63XMMw+N6NrI+9yg9/j
X-Gm-Gg: ASbGncuuasRPArq2yFgY4UmkdoQKyD0iyOQhVnm3OjEfTfWxOvA4loHKd7PpF7XNA6E
	jiKQGanZoAybzo+NjaZaIBgXEf0OT7I2q8+8Nt8wxrsrmSJ3ahTzeC56hIgGq1qdqKo8BLtP3N1
	sNkrzWSrsLz4H2nRV0o4EWbfmWLXbmE4HScUeE99JAsYQ9sLUkuvGaStYdAmBaaPBvBthNTW0lf
	Op6KU4XcwFyOlB/eO8zIhF/jvG6bCNtemt7NDfMEzMoKi+suDrxVau5JouPW8adIca+1A+vr7Pn
	W+6BPQ==
X-Received: by 2002:a5d:5f8a:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-3a093035823mr2192662f8f.15.1746106971228;
        Thu, 01 May 2025 06:42:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrIunJCyZIJpaWJRWPmreixKiTF3IReAJlcQZNOEeddCfXIIWCsv5fIpEqfzf8L12fIKdNYw==
X-Received: by 2002:a5d:5f8a:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-3a093035823mr2192638f8f.15.1746106970856;
        Thu, 01 May 2025 06:42:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28045sm57946395e9.35.2025.05.01.06.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:42:50 -0700 (PDT)
Date: Thu, 1 May 2025 09:42:47 -0400
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
Message-ID: <20250501093933-mutt-send-email-mst@kernel.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com>
 <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bw1sPK0ZpmMch1BAhkOCpGEryR4riF0m4IMuMcVJPu4_1746106971
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 30, 2025 at 10:54:12AM +0000, Parav Pandit wrote:
> 
> 
> > From: Paolo Abeni <pabeni@redhat.com>
> > Sent: Wednesday, April 30, 2025 3:42 PM
> > 
> > On 4/30/25 6:44 AM, Parav Pandit wrote:
> > >> From: Michael S. Tsirkin <mst@redhat.com>
> > >> Sent: Wednesday, April 30, 2025 2:14 AM
> > >>
> > >> On Mon, Apr 28, 2025 at 10:39:59AM +0200, Paolo Abeni wrote:
> > >>> On 4/23/25 8:07 PM, Michael S. Tsirkin wrote:
> > >>>> On Wed, Apr 23, 2025 at 09:29:11AM -0700, Daniel Verkamp wrote:
> > >>>>> On Tue, Apr 22, 2025 at 10:46 PM Michael S. Tsirkin
> > >>>>> <mst@redhat.com>
> > >> wrote:
> > >>>>>> I'm afraid we'll have to bite the bullet.
> > >>>>>
> > >>>>> One other issue with bits > 63 is that the vhost-user protocol
> > >>>>> VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES
> > >> messages use
> > >>>>> u64 to represent the features, so vhost-user-net devices can't
> > >>>>> query or enable these features. vhost-user is outside the scope of
> > >>>>> the virtio spec, though, and I think it's reasonable to extend the
> > >>>>> protocol to enable high feature bits rather than avoiding them forever.
> > >>>>
> > >>>> Yes you would use VHOST_USER_SET_PROTOCOL_FEATURES to make
> > >>>> VHOST_USER_GET_FEATURES return two u64s, or even a new message
> > >> returning an array.
> > >>>
> > >>> I think that additionally the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
> > >>> command will need some clarification, as in the current text looks a
> > >>> bit
> > >>> inconsistent:
> > >>>
> > >>> """
> > >>> // in Offloads State Configuration / Setting Offloads State:
> > >>>
> > >>> #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
> > >>>
> > >>> // ...
> > >>>
> > >>> The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:
> > >>> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads
> > >> configuration.
> > >>>
> > >>> le64 value passed as command data is a bitmask, bits set define
> > >>> offloads to be enabled, bits cleared - offloads to be disabled.
> > >>>
> > >>> There is a corresponding device feature for each offload. Upon
> > >>> feature negotiation corresponding offload gets enabled to preserve
> > >>> backward compatibility """
> > >>>
> > >>> The "corresponding device feature" has the same numerical value of
> > >>> the selected offloads, except for UDP tunnels related one (which are
> > >>> mapped to bits corresponding to reserved features).
> > >>>
> > >>> It's unclear to me which should be the better way to address this
> > >>> inconsistency.
> > >>>
> > >>> /P
> > >>
> > >>
> > >> Parav, what's your take here? Given your change broke
> > >> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET, do you want to revert it?
> > >
> > > I see two options.
> > > Opt_1:
> > > Open source Linux kernel driver and DPDK PMD has not used RSS_CONTEXT
> > yet.
> > > If Heng from Alibaba acks that they do not have any internal
> > implementation either, it may be safe to shift _all_ feature > 63 to lower
> > position.
> > > We can get Yuri's feedback, if at all windows driver has used RSS context.
> > >
> > > And once for all we mark it that feature bits are limited to 0-63.
> > > There is enough infrastructure in place in virtio spec to not try to squeeze
> > things in feature bits.
> > > And these 4 bits are good example of it already, which could have been
> > negotiated/communicated at later phase of driver at runtime.
> > > Only bit required was a bit to expand vnet header size at early stage.
> > >
> > > Advantage: brings the good practice to adapt to the modern and efficient
> > driver->device interface.
> > > Risk: May break RSS_CONTEXT (risk looks low)
> > >
> > > Opt_2. VIRTIO_NET_CTRL_GUEST_OFFLOADS command text to be updated
> > to
> > > indicate that,
> > >
> > > Below defines corresponds to respective feature bits 65 to 68. There is still
> > one to one mapping, its just position is different inside the class.
> > > This is clarification text to be added and sw can adjust for it.
> > >
> > > #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO 46 #define
> > > VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47 #define
> > > VIRTIO_NET_F_GUEST_USO4 54 #define VIRTIO_NET_F_GUEST_USO6 55
> > >
> > > Advantages of 2nd option are:
> > > a. featuring bits remain open upto 127.
> > > b. Does not break RSS_CONTEXT.
> > >
> > > Both options are practical to me.
> > > I prefer #1, if Heng acks it, but also ok for #2.
> > 
> > I spent quite of bit of time trying to evaluate the scope of features bit
> > expansion (implied by the option 2 above).
> > 
> > While strictly speaking I haven't hit yet a complete blocker, implementation-
> > wise it's going to be huge and error prone, as great deal of both the kernel
> > and the user-space/qemu infrastructure hard-codes the
> > 64 bit limit.
> > 
> > Even exposing the feature extensions only the the virtio-net device (AFAICS it
> > will "minimize" the code churn) a lot of code and devices implementations are
> > going to be impacted.
> > 
> > I expect a far away in time timeline for implementations based on option 2.
> > 
> > /P
> Given that its painful enough, we can update the virtio spec to limit to 64-bit features as option_1.
> 
> A virtio spec diff like below,
> - 0 to 23, and 50 to 127 Feature bits for the specific device type
> + 0 to 23, and 50 to 63 Feature bits for the specific device type
> 
> Otherwise, we are delaying the problem to next feature, which is not good.
> 
> Heng,
> Yuri already acked, so we are good from Windows side.
> With that Windows, Linux kernel, DPDK PMD are safe.
> 
> Can you also please confirm that there are no users within Alibaba relying on RSS_CONTEXT, so that shifting the feature bit will not break any existing functionality?
> I think it will not break, because we can update the non-open-source software to detect RSS_CONTEXT on a new bit.
> 
> For example, driver can do,
> Enable_rss_context if bit X OR Bit 64 is set.


sorry if I am unclear, I think it's too late to move RSS really. It has
been out there for two years. The reason we can be reasonably sure no
one implemented the offloads so far is because the set offloads command
is broken and no one complained.  We need to fix them in the spec,
current one is broken. So the tunnel offloads can move if
it's convenient.

-- 
MST

