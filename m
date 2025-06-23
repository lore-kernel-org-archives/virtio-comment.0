Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E0518BC3B
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693910; cv=none; b=syoy6M1/SME3vtHm1hEB5accNMLWcb9AB2o0ntSxg1tYAKrzi/SOHU0MdvCiErbkK+gt+lmksM67QnWFVIpXrkpSSBCvWmukLWzgmuCdHYYWnDxV9bc20yGNe90xCWWbJkz+RUtM1R6KXH3MJ/GCE0s9Wp37Iv7hQMBYI8gg1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693910; c=relaxed/simple;
	bh=3y6GIL6i7fGfoHSUMt0e219OY6JvkYxn1rEsj7QV2o4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k35qWELeUJK9aytI9aS6efe1VbwxOhNC89Mp76n5xExgfA82qPgJNMQn9CJdqeIIvn4YW5T4N+4WTLjJYdCYXwTfrR6gUwk2bcfCaSr2AX+tf+dDsZHab18kaztZYXjNkBfSvcCvONK3kQu8kY1iKFlwEu6YEREKLk45Vvy2jjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJQw43Nk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJQw43Nk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23649faf69fso43596015ad.0
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750693907; x=1751298707; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzWtz3KTt94w7hW+wvQ1Ox8Y0sILpDsWR5WidNTPt5s=;
        b=DJQw43NkVagzyW3DpOYetjh5zUj1LibtmMLgSgiEmirShbAdG9tIMPw9xngfQvcvpk
         yR8jRN95QYRRDl5Q7Rejd8N7GZ+N6BU/XIm87naK6mzMdmPOwTUe6U7+/5yv6Wu7zLeE
         zfdPN/AQS69j14JYGtyNanjUOwZhPqPTLsw8ig/W887yIoQB2UeAQgDBswhsG/yZ7Ex7
         BNZWL6Su+kA9qetH8qYRhfQRqs5hk9Xlrlw4+DIyuyKfTgl8LYOLOIp1ae09NkNSb1x3
         Dq/js+7eWcydnF2igFKdVzWQfTLPbN152yHHU3i4nmyJ8fUUWukSL99yMZzNFhTmcB9D
         F6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693907; x=1751298707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzWtz3KTt94w7hW+wvQ1Ox8Y0sILpDsWR5WidNTPt5s=;
        b=hm8Gkx8ROKnuVjCDT/c98TCuSqV5tfBOy9e46Vd4yO5/Y+HoeoRyg0ofX/DZSkgrOi
         ryiCuAwm78HSsF1f94fsCNGPb9w/yaBFmGPtqqfETY44hkuVnxSixy0BEdcatjmFHtEL
         eegKt85PzFoCmTRHEWUmRHbZvpchm0hX23H6ubqMaUZUBY7HixV8omX9RZ1WfXLJ4Tdu
         RVIkDee0KI145ueo+lg3yxEYUIYKwlacQPQT+MH8WQqH9Wdzb335zTdzRsiOfq6UbFVB
         vF/QHmIQEnWQu8VJzfXroC4YBlPiFwdabu2JtUgIITtEtJUJEo9AzFz3hZl095j17SMY
         ewZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJnjkG5VX7HW7Te9uUtNf1Nj25ir6t6GgMMCr49jf2mJR22dfe9orNZtUJgSecP76yrtu8ZmGKrKC3k9levg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcvfAps/skzv9dhqqjVKZHwzKNwMQDy1VrTQgN1ULUhv7CG0YD
	Crx5rdgUCoA/38v7QSBgUVAaHYCgMre64f8y3CG3MT4Bo9WifkTC2U5z+CnYHaYvKzXr55vX
X-Gm-Gg: ASbGncsnk0rNfyuCCXcHQQsiWblQKmeWklkeI670J17YMbVkrk289fVFn4Mp3EtqxLf
	LWbDImX1RfZROAM488x5nZjzGNJMA1E3s+NjbNI90+rypca9FwWswScvh5uOWV11/zPNM20FgnQ
	ICKU+OwBHaIoPSShJc1BepIOgAXPXc0Ar5jkmAU5bj07x7WXpQj/qFhItim+1oc8V6dkMWmEih0
	/f/+KxbxtGK1Hb2ObtXIxqSE7bW1kJEJjGSKvAmNmCptZ0cftrtpjbNKj1XgX3kehpKm1F1BBCR
	0VUxcR/xsohY0jgk3azExtpejIFXxA7WTomgeMmKyHC0D4xVxkDch5mXA+Qr77XVCvcgdUIXgBs
	3CsA6NGlM
X-Google-Smtp-Source: AGHT+IEpdnzokTGb9N4I4TuJrBRm7iw6SU7uX9bNrSQHImtMsxxtHojp8qcZeuO3dLAzcp8Qo7UIFQ==
X-Received: by 2002:a17:903:74b:b0:237:ec18:ead7 with SMTP id d9443c01a7336-237ec18ee6amr97463275ad.24.1750693907179;
        Mon, 23 Jun 2025 08:51:47 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839326asm86209015ad.32.2025.06.23.08.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:51:46 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Mon, 23 Jun 2025 23:51:39 +0800
Message-Id: <20250623155139.1673574-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <s6rxycmztea6cryhsxbeyljhvptduue2h67wy2vrbffseorops@ht6iocaszizf>
References: <s6rxycmztea6cryhsxbeyljhvptduue2h67wy2vrbffseorops@ht6iocaszizf>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Mon, Jun 23, 2025 at 08:14:07PM +0800, Xuewei Niu wrote:
> >> On Mon, Jun 23, 2025 at 06:35:59PM +0800, Xuewei Niu wrote:
> >> >> On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
> >> >> >> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
> >> >> >> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
> >> >> >> >> > Sent: 19 June 2025 08:57 AM
> >> >> >> >> >
> >> >> >> >> > Hi Parav,
> >> >> >> >> >
> >> >> >> >> > Could you please take a look at the diagram in [1]?
> >> >> >> >> >
> >> >> >> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
> >> >> >> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
> >> >> >> >> > at this time.
> >> >> >> >> >
> >> >> >> >> > I think the first thing is to figure out how to pick the right group.
> >> >> >> >> >
> >> >> >> >> > Standard socket doesn't provide a way to access the group information.
> >> >> >> >> >
> >> >> >> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
> >> >> >> >> > don't call `bind()`, only the destination is known.
> >> >> >> >> >
> >> >> >> >> > However, only destination is not enough to find the group. For example, the
> >> >> >> >> > well-known CIDs (e.g. 2) are valid for all groups.
> >> >> >> >> >
> >> >> >> >> > 1:
> >> >> >> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> >> >> >> >>
> >> >> >> >> Right. Sock addressing scheme is naïve presently to select the group.
> >> >> >> >> Not sure when/how you or others plan to do.
> >> >> >> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
> >> >> >>
> >> >> >>
> >> >> >> >>
> >> >> >> >> However, at device level, we should have the construct of grouping.
> >> >> >> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
> >> >> >> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
> >> >> >> >>
> >> >> >> >> So I was imagining a relatively simple scheme:
> >> >> >> >> For example, virtio device level, some kind of group id is present.
> >> >> >> >> So two devices which has same group id, are part of single group.
> >> >> >> >> An example group id format can be a UUID.
> >> >> >> >>
> >> >> >> >> And this is completely optional for devices to implement.
> >> >> >> >> Generic enough and usable beyond just vsock device in other use cases
> >> >> >> >> we discussed in past.
> >> >> >> >
> >> >> >> >Fair enough.
> >> >> >> >
> >> >> >> >@Stefano, could you please take a look at this? I'd love to have some
> >> >> >> >input
> >> >> >> >from you.
> >> >> >> >
> >> >> >> >A brief summary of the idea is: The config space will be extended to
> >> >> >> >include a group id. The devices with the same group id are considered
> >> >> >> >to be
> >> >> >> >in the same group.
> >> >> >>
> >> >> >> Thanks for the summary, but please avoid top posting, otherwise is very
> >> >> >> hard to follow the discussion :-(
> >> >> >> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
> >> >> >
> >> >> >Sorry, I'll avoid it in the future.
> >> >> >
> >> >> >> I like the idea of groups. What is not clear to me, is how groups will
> >> >> >> allow the driver to select the default output device when the source
> >> >> >> socket is not bind to any source CID.
> >> >> >
> >> >> >Well, we did discuss, but we need your input.
> >> >> >
> >> >> >I said in the thread [1] based on the standard socket API, the driver can't
> >> >> >pick a group. Parav [2] suggested that the group, as a basic concept,
> >> >> >should be present even if we are unable to use it.
> >> >> >
> >> >> >IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
> >> >> >the concept. But it is a very big change, leading to incompatibility with
> >> >> >the existing apps.
> >> >>
> >> >> I still don't understand how the group_id will work :-( and how will
> >> >> allow the driver to pick the default device.
> >> >
> >> >FYI, here is trying to explain what is group and why it is needed, but I
> >> >agree with you about the idea of "types".
> >> >
> >> >I posted a diagram in the thread [1]. I think the group is something like a
> >> >"namespace". I think it is reasonable, but my concerns are compatibility
> >> >and complexity.
> >> >
> >> >1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
> >> >
> >> >> This is the `sockaddr_vm`, so we should be careful of extending it:
> >> >>
> >> >> struct sockaddr_vm {
> >> >> 	__kernel_sa_family_t svm_family;
> >> >> 	unsigned short svm_reserved1;
> >> >> 	unsigned int svm_port;
> >> >> 	unsigned int svm_cid;
> >> >>
> >> >> #define VMADDR_FLAG_TO_HOST 0x01
> >> >>
> >> >> 	__u8 svm_flags;
> >> >> 	unsigned char svm_zero[sizeof(struct sockaddr) -
> >> >> 			       sizeof(sa_family_t) -
> >> >> 			       sizeof(unsigned short) -
> >> >> 			       sizeof(unsigned int) -
> >> >> 			       sizeof(unsigned int) -
> >> >> 			       sizeof(__u8)];
> >> >> };
> >> >>
> >> >> >I think it might be beyond the scope of this patch, and would make the
> >> >> >vsock more complex. The current conclusion is that we will keep the concept
> >> >> >of grouping as a placeholder, but we will not use it.
> >> >>
> >> >> IMO we should first clarify better what we want to support.
> >> >> As I already suggested some months ago, IMHO supporting any number of
> >> >> vsock devices for a VM it's not really needed for your goal and I can't
> >> >> see other use cases where a virtio-net device can't be use. Just a
> >> >> reminder, vsock is not a network device, is more a P2P device where we
> >> >> want to keep the configuration in the guest as simpler as possible (we
> >> >> don't want to run ARP, DHCP, etc.).
> >> >
> >> >Agree that.
> >> >
> >> >> Till now vsock was more used just for guest-host communication, but
> >> >> recently it was extended to communicate with sibling VMs.
> >> >>
> >> >> IIUC your use case, we just need to support different type of vsock
> >> >> devices attached to the VM. With "type" I mean type of address handled.
> >> >> I think we can define 3 types based on the CID we have:
> >> >> - hypervisor: VMADDR_CID_HYPERVISOR(0)
> >> >> - host: VMADDR_CID_HOST(2)
> >> >> - sibling: CID >=3
> >> >>
> >> >> The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow
> >> >> to reach from the guest any other CIDs.
> >> >> The vhost-user-vsock recently started to support sibling VMs.
> >> >> The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).
> >> >>
> >> >> So, IMHO we should define new features or config flags that a device can
> >> >> expose depending on which address is able to handle.
> >> >> Also, in order to avoid to overcomplicate vsock, we should allow only
> >> >> one device for each type (a single device should support multiple types,
> >> >> but only one device can be registered for a type).
> >> >
> >> >I think only one device can be registered for sibling and hypervisor. And
> >> >it is possible to have multiple devices for host. Otherwise, the goals of
> >> >this patch will be not achieved.
> >>
> >> Why?
> >>
> >> IMO, as I already wrote, the libkrun service should use CID=0.
> >
> >As we before discussed, if there is only one backend for the libkrun
> >service, we can use cid=0. I totally agree with you. So let us put this
> >case aside first.
> >
> >> How you will handle multiple devices for host? How can the guest know
> >> which device to use to reach HOST(2)?
> >
> >Do `bind()` explicitly, and a device with matching cid will be picked up.
> 
> Okay, but why you need 2 devices to communicate with the same CID, host 
> in this case (CID=2)?
> IMO use the source CID to multiplex a socket at destination is not 
> great. But I can be wrong.

I mean multiple sockets with multiple `bind()` calls, not multiplexing:

- socket1: bind(3, -1), connect(2, 10000);
- socket2: bind(4, -1), connect(2, 10001);
- ...

> >> IMO is easier to have the multiple device for sibling (e.g. the device
> >> can advertise which dest CID its supports), but not for host.
> >
> >I think one device for sibling is enough.
> 
> I also think one should be enough, but IMO I think it might make more 
> sense to have multiple devices in this case, where each device can 
> handle a pool of CIDs, then the hard part will be figuring out how to 
> allocate the CIDs, etc. so yes, I agree that having one device even in 
> this case is the easiest thing.

Yeah, so let us skip this for now ;)

> >For example, dev1 is enough for
> >communication with dev3 and dev4. So we don't need dev2 for sibling in the
> >first VM, right?
> 
> Just a note, vhost-vsock is not allowing any sibling communication.
> vhost-user-vsock can do it, but we don't want to bring any support in 
> vhost-vsock to not overcomplicate it (again it will become like a 
> network switch, requiring firewalls, etc.)

Even if we don't impose some complicated mechanisms, I think the
vhost-vsock should work with sibling, and I don't see any difference
between vhost-vsock and vhost-user-vsock. (I am just curious.)

> >+──kernel(vhost-vsock)──────────────────────────────────────────────+
> >│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
> >││  dev1(cid1)  │ │  dev2(cid2)  │ │  dev3(cid3)  │ │  dev4(cid4)  ││
> >│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
> >+────────▲────────────────▲────────────────▲────────────────▲───────+
> >         │                │                │                │
> >         │                │          ┌─────┘                │
> >         │                │          │                      │
> >+────────┴───────────+    │ +────────┴───────────+ +────────┴───────────+
> >│+──────────────+ VM0│    │ │+──────────────+ VM1│ │+──────────────+ VM2│
> >││dev1(cid1,def)│    │    │ ││dev3(cid3,def)│    │ ││dev4(cid4,def)│    │
> >│+──────────────+    │    │ │+──────────────+    │ │+──────────────+    │
> >│+──────────────+    │    │ │                    │ │                    │
> >││  dev2(cid2)  │────┼────┘ │                    │ │                    │
> >│+──────────────+    │      │                    │ │                    │
> >+────────────────────+      +────────────────────+ +────────────────────+
> >
> >The things go different for devices for host:
> >
> >1. For dev1, it is used for sibling (dev1 <-> dev4), and the host
> >(src_cid=cid1, dst_cid=2) means the real host (not a userapp), where
> >doesn't show in the diagram.
> 
> This is not going to happen (see above).
> 
> >2. For dev2 (src_cid=cid2), the host (dst_cid=2) is userapp1;
> >3. For dev3 (src_cid=cid3), the host (dst_cid=2) is userapp2.
> >
> >+──kernel(vhost-vsock)──────────────────────────────────────────────+
> >│+──────────────+                                   +──────────────+│
> >││  dev1(cid1)  │                                   │  dev4(cid4)  ││
> >│+──────────────+                                   +──────────────+│
> >+────────▲──────────────────────────────────────────────────▲───────+
> >         │                                                  │
> >+────────┴───────────+     +────────────────────+           │
> >│+──────────────+ VM0│     │+──────────────+    │           │
> >││dev1(cid1,def)│    │┌────▶│  dev2(cid2)  │    │  +────────┴───────────+
> >│+──────────────+    ││    │+──────────────+    │  │+──────────────+ VM2│
> >│+──────────────+    ││    │            userapp1│  ││dev4(cid4,def)│    │
> >││  dev2(cid2)  │────┼┘    +────────────────────+  │+──────────────+    │
> >│+──────────────+  vhost-user-vsock─────────────+  │                    │
> >│+──────────────+    │     │+──────────────+    │  │                    │
> >││  dev3(cid3)  │────┼─────▶│  dev3(cid3)  │    │  │                    │
> >│+──────────────+    │     │+──────────────+    │  +────────────────────+
> >+────────────────────+     │            userapp2│
> >                           +────────────────────+
> >
> 
> I'm really confused with `cid1`, `cid2`, etc. Are they any number >= 3?
> I'd suggest to use real value (e.g. cid=42).

Okay. I'll update it with real value ;)

Based on the above question, I still put the devices into the kernel.

+──kernel(vhost-vsock)──────────────────────────────────────────────────+
│+───────────────+                                  +───────────────+   │
││  dev1(cid=3)  │                                  │  dev4(cid=6)  │   │
│+───────────────+                                  +───────────────+   │
+────────▲──────────────────────────────────────────────────▲───────────+
         │                                                  │            
+────────┴───────────+     +────────────────────+           │            
│+───────────────+VM0│     │+──────────────+    │           │            
││dev1(cid=3,def)│   │┌────▶│ dev2(cid=4)  │    │  +────────┴───────────+
│+───────────────+   ││    │+──────────────+    │  │+───────────────+VM2│
│+───────────────+   ││    │            userapp1│  ││dev4(cid=6,def)│   │
││  dev2(cid=4)  │───┼┘    +────────────────────+  │+───────────────+   │
│+───────────────+ vhost-user-vsock─────────────+  │                    │
│+───────────────+   │     │+──────────────+    │  │                    │
││  dev3(cid=5)  │───┼─────▶│ dev3(cid=5)  │    │  │                    │
│+───────────────+   │     │+──────────────+    │  +────────────────────+
+────────────────────+     │            userapp2│                        
                           +────────────────────+                        

> So what dest CID the VM0 is supposed to use to talk with userapp1 and 
> userapp2? In both cases CID=2, right?

Yes. There are at least two sockets with source cid=4 and cid=5 respectively.

> Why you need 2 vhost-user-vsock devices?

The benefit of vhost-user is "shared memory", which reduces the need for
data copying. It is possible to share virtqueues to multiple user apps, for
the sake of performance.

I don't forget the "CID=0" thing. Just as an explanation, I'll use the
example of TSI.

We can treat the TSI backend as a proxy. Thanks to vhost-user-vsock, the
data will be copied once from the guest user space to the proxy. When we
have two subnets, which is a common case, we might want to have two proxies
to forward the data.

                 +────────────────+    +───────────────────────────────+
 .─────────.     │  tsi backend1  │    │+───────────────+    ┏━━━━━━━━┓│
(    NW1    )◀───│   (userapp1)   │◀───┤│  vsock dev1   ◀────┃subnet1 ┃│
 `─────────'     +────────────────+    │+───────────────+    ┗━━━━━━━━┛│
                                       │                               │
                 +────────────────+    │+───────────────+    ┏━━━━━━━━┓│
 .─────────.     │  tsi backend2  │◀───┤│  vsock dev2   ◀────┃subnet2 ┃│
(    NW2    )◀───│   (userapp2)   │    │+───────────────+    ┗━━━━━━━━┛│
 `─────────'     +────────────────+    +───────────────────────────────+

> Can you just have a single one and have the application 
> connecting/listing on different port? (which is the sense of the port, 
> multiplexing application on the destination)

In terms of functionality, I think it is possible. But it loses the benefit
of vhost-user-vsock.

Thanks,
Xuewei

> Thanks,
> Stefano
