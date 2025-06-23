Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB813FD86
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670196; cv=none; b=mA9Kvsd1vfNqYH/KtH3aLLwVh2wxxvIdlvU+Nd38jSa3Cvf6PGSU7KDqp+XvPpWhFJe2upoaWcsL8jYSIl7BE01X8uDYDhxJBD5iLqGOBhBnrP0mX4/u81hYfDTe4n1NsXFM28zqRP9436DppqhCowIyYiiqLIaQDXc0iVc5JEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670196; c=relaxed/simple;
	bh=Bmv9XMxq0SuN6YQR+BrnmFtA0nrkdwNe6bw9ewDvMaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qglurm9W/GVzn/pEH8L7mZ6hG/nLgG9pFqpzDnEl2kp1NZtgsdx/bDqOjaF1mEe2VkOdO3krFdQlLY203vc6REnlT/hyFoFz656UENnI2iDXJBNDUflNV4ccjH5P78b/DwAnXiseo4Aco9eibD13MgbZ1TXdlSLT17F9U8tY5pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hydBv0x7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hydBv0x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750670192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oFMEqh4v4YoaGYqyGW/25e1GIxAvRVqDlWRY5qWqo4=;
	b=hydBv0x79BgBbDRwzKjjlmE7SoSjbJWGk6HpR3r/hveCrj10NMAmQhZsWbI34v0TpHJqEc
	7vWQ6ps/QPGO2wcZxkioTnLponwEV0ZkNe7nhVsWm/urdpMPu0VG2kuowylmVwZwp6ZO3N
	ZbtxtEeuj7aZK3uhKthnu3Q4faM/ZVc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-Q7rYjvUSPN6ivoNXrbpK9g-1; Mon, 23 Jun 2025 05:16:30 -0400
X-MC-Unique: Q7rYjvUSPN6ivoNXrbpK9g-1
X-Mimecast-MFC-AGG-ID: Q7rYjvUSPN6ivoNXrbpK9g_1750670190
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399070cecso751687085a.3
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 02:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670190; x=1751274990;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9oFMEqh4v4YoaGYqyGW/25e1GIxAvRVqDlWRY5qWqo4=;
        b=wwFvaDeosGn3tcJ3Y8DEayHwn2pHEzzN2+PzphdLVm5NRrCqj/oZC/pjmugldOfpJY
         RaypqBWtkGFX/BWDLmeohZsE+62fUa8rAGd9lVSHSWc0fMCeRB5UO0zsPdDzi/3UwLcK
         Dv+/lrOW/2BM3WJaK27TITVRd9Q5lHUePo53mNACuPa6w4QsIDjOfm8AQ8J1ZPS3o2kU
         gzqcNJhQ0RgCzLfGBzUxiA2re/Wy2dQER0s5OGD3mv5JVzjGkOiAwIP+H3A2sFBK6WUi
         RcC4pTNWWUsCc3kq82i7CUwVnnmHxR8QhPwV2LBYrAP4XLDd93h46rpc8lnBNtNf3OVP
         XMsg==
X-Forwarded-Encrypted: i=1; AJvYcCUQXo2LDumpF7VVfqDDnsvpsMiGgdIvnt9Pv38ISvB3Jk7zGnobRAuLV0MVwdB2Lq5yUMi13g5nX64G2/P9WQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdmWjnbCU9C9wMpp1AJPi8836JZybEPV89+t/fF/veEVzvzoVv
	Qckvx63oQHolTyZwNTzmkhtY2YdJ/d8md5Mx+FeH+II/1waTUcwmCX3pxVi/GfiyCnVJ1qVoiC6
	hflBu/BadFKm+4UexIPheMbRDf+rgK2TurbBDaIUAOceSNB+UG5V0M+2tZsNxvv9MYzIz
X-Gm-Gg: ASbGncvr0r8BQOovrjHcbVPZRalavYuFFiA8LXORYGWC7IPcK9Rqj35lH2JN0JiTGLR
	wW1TeHcI2meeYJIDn+dwRea+wgBYX+OPO36ITV8VEpkmNlsXJ4CUHMiifUzJFXdewBqYzwuQoBL
	HRKl6uWfW7kpnY1Y11HHvg/8xT0dF7nLw7W2yB8MJ4TT9FuBlMkvZ1gsKcU5SnekTudTN5aby+Z
	vXezNNjVCNU4jr7DcVR2srI0jU22KePGd/C79nlOadoBgRhND3kHRG+2iny2xyh9C1WEPIKt41c
	84jwKMXqqpzwzUJpzpyRKI4XQDM=
X-Received: by 2002:a05:620a:488d:b0:7d3:eb70:6d99 with SMTP id af79cd13be357-7d3f9932c12mr1991030085a.36.1750670190214;
        Mon, 23 Jun 2025 02:16:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3AaIA9mjA8yGXOd98BBaZUWasoFK+jyOn73pF3/+8OvqKiGyqLYV3qCBdixG9p11pPGb9/Q==
X-Received: by 2002:a05:620a:488d:b0:7d3:eb70:6d99 with SMTP id af79cd13be357-7d3f9932c12mr1991026885a.36.1750670189679;
        Mon, 23 Jun 2025 02:16:29 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.87])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99fbe06sm365609285a.94.2025.06.23.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:16:29 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:16:22 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Message-ID: <ncciiv3udhy6mylzobtt5jnp3xwthtfvuwonb7i5c5hkpcyfc2@utxcie3jxof2>
References: <ntpwwmwwaow4lfdjubgdwsvvpzpkuc52iz3vjztbx4iphvpnem@gmd2bsqckonm>
 <20250623084833.1647215-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250623084833.1647215-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sjJpsiCk9uJn596xnZD5LsbPw2arY6FiNo53_kTEp-U_1750670190
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
>> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
>> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
>> >> > Sent: 19 June 2025 08:57 AM
>> >> >
>> >> > Hi Parav,
>> >> >
>> >> > Could you please take a look at the diagram in [1]?
>> >> >
>> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
>> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
>> >> > at this time.
>> >> >
>> >> > I think the first thing is to figure out how to pick the right group.
>> >> >
>> >> > Standard socket doesn't provide a way to access the group information.
>> >> >
>> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
>> >> > don't call `bind()`, only the destination is known.
>> >> >
>> >> > However, only destination is not enough to find the group. For example, the
>> >> > well-known CIDs (e.g. 2) are valid for all groups.
>> >> >
>> >> > 1:
>> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
>> >>
>> >> Right. Sock addressing scheme is naïve presently to select the group.
>> >> Not sure when/how you or others plan to do.
>> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
>>
>>
>> >>
>> >> However, at device level, we should have the construct of grouping.
>> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
>> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
>> >>
>> >> So I was imagining a relatively simple scheme:
>> >> For example, virtio device level, some kind of group id is present.
>> >> So two devices which has same group id, are part of single group.
>> >> An example group id format can be a UUID.
>> >>
>> >> And this is completely optional for devices to implement.
>> >> Generic enough and usable beyond just vsock device in other use cases
>> >> we discussed in past.
>> >
>> >Fair enough.
>> >
>> >@Stefano, could you please take a look at this? I'd love to have some
>> >input
>> >from you.
>> >
>> >A brief summary of the idea is: The config space will be extended to
>> >include a group id. The devices with the same group id are considered
>> >to be
>> >in the same group.
>>
>> Thanks for the summary, but please avoid top posting, otherwise is very
>> hard to follow the discussion :-(
>> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
>
>Sorry, I'll avoid it in the future.
>
>> I like the idea of groups. What is not clear to me, is how groups will
>> allow the driver to select the default output device when the source
>> socket is not bind to any source CID.
>
>Well, we did discuss, but we need your input.
>
>I said in the thread [1] based on the standard socket API, the driver can't
>pick a group. Parav [2] suggested that the group, as a basic concept,
>should be present even if we are unable to use it.
>
>IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
>the concept. But it is a very big change, leading to incompatibility with
>the existing apps.

I still don't understand how the group_id will work :-( and how will 
allow the driver to pick the default device.

This is the `sockaddr_vm`, so we should be careful of extending it:

struct sockaddr_vm {
	__kernel_sa_family_t svm_family;
	unsigned short svm_reserved1;
	unsigned int svm_port;
	unsigned int svm_cid;

#define VMADDR_FLAG_TO_HOST 0x01

	__u8 svm_flags;
	unsigned char svm_zero[sizeof(struct sockaddr) -
			       sizeof(sa_family_t) -
			       sizeof(unsigned short) -
			       sizeof(unsigned int) -
			       sizeof(unsigned int) -
			       sizeof(__u8)];
};


>
>I think it might be beyond the scope of this patch, and would make the
>vsock more complex. The current conclusion is that we will keep the concept
>of grouping as a placeholder, but we will not use it.

IMO we should first clarify better what we want to support.
As I already suggested some months ago, IMHO supporting any number of 
vsock devices for a VM it's not really needed for your goal and I can't 
see other use cases where a virtio-net device can't be use. Just a 
reminder, vsock is not a network device, is more a P2P device where we 
want to keep the configuration in the guest as simpler as possible (we 
don't want to run ARP, DHCP, etc.).
Till now vsock was more used just for guest-host communication, but 
recently it was extended to communicate with sibling VMs.

IIUC your use case, we just need to support different type of vsock 
devices attached to the VM. With "type" I mean type of address handled.
I think we can define 3 types based on the CID we have:
- hypervisor: VMADDR_CID_HYPERVISOR(0)
- host: VMADDR_CID_HOST(2)
- sibling: CID >=3

The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow 
to reach from the guest any other CIDs.
The vhost-user-vsock recently started to support sibling VMs.
The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).

So, IMHO we should define new features or config flags that a device can 
expose depending on which address is able to handle.
Also, in order to avoid to overcomplicate vsock, we should allow only 
one device for each type (a single device should support multiple types, 
but only one device can be registered for a type).

If we don't want this limitation, I think we need to overcomplicate 
vsock and define some kind of discovery algorithm that the guest driver 
should run to understand which CIDs are reachable for each device.
But I'm not sure we really want this; if this is a use case, the guest 
should use a virtio-net device that already support this pretty well, so 
before going on this direction, we should define better why we want to 
complicate vsock, instead of using a net device.

Thanks,
Stefano

