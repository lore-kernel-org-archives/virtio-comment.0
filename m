Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBEA28B7C6
	for <virtio-comment@lists.linux.dev>; Thu, 10 Jul 2025 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142759; cv=none; b=EvxtyDDpcxtNdrjcQk56Sa0WH8ewP74jJTE02fJ2m90BWlKyXpK+qPHWWfvhIjMaVqa8hWLHy0VG1g+io09X3BlaIxyJK3RZ/vZlPbiPNhlH3v1EyVeH4VRhiSEsPaXGttaje6wushyGaFUlf40eZ67TbNw3KGaKqY6RQ6yXdiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142759; c=relaxed/simple;
	bh=G48kkQ6vFaLsGt29D/6lxV+NphQ0mMPC6b7MMDtT2Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RyHtGqbfF9vme586zhROIMmAzJ48uM13V8Q+H0uQCLiNQdw0DlItVo6FrFUFT0xltnjBQ3CNtagZ9aX34w6OydX0nEkOT/CIbf01aPGpKpMUhV5DReqU0k2kdo4JDxN18+6613Hvl031h64QBl4ZHmFSa6Xc+Hai+AYfAEwPvEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sd2fPsoN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sd2fPsoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752142755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pTZbY6VpUKDDfBKUJHsUQ/QtVnIRIuh3kLrrrMC+f3Q=;
	b=Sd2fPsoNbzYq80enctrre9hyGAMDj8FWKqHKGBTDbw4r3L91P+9dgyIV5InHPTrEqRwCNM
	n2iAlpwNW+CzC273DwNHtN762s4kXOGIMDlOj4r4f4PLS0VMWu4mIPOVV6QqcK3RPvVTTr
	Rqy6ndzUhTL+p72EDntyn3OfXfETtZE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-C-avkwuGMzSS3HYAYsz1pQ-1; Thu, 10 Jul 2025 06:19:14 -0400
X-MC-Unique: C-avkwuGMzSS3HYAYsz1pQ-1
X-Mimecast-MFC-AGG-ID: C-avkwuGMzSS3HYAYsz1pQ_1752142754
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31220ecc586so931669a91.2
        for <virtio-comment@lists.linux.dev>; Thu, 10 Jul 2025 03:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752142753; x=1752747553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTZbY6VpUKDDfBKUJHsUQ/QtVnIRIuh3kLrrrMC+f3Q=;
        b=ghvhst1sl2+DAA9tgfoFkGu6Lc88BWApsL/bDHGubAlPNNvcP1Jd3l8XE+/2LrK33F
         eE/8zZmlow35EYWE4y7tfg8S7TxK1v4UGLFlJjWAHjOrNAlWLjL06TZPr+jluFN/dOeU
         a2P/Ah2mty2aWQFXLpaA5zVdBY2++LI0rzeWU3WVVKV4GBlIiZjRUAYE3onrZ/CLoGzW
         EryG/Ix1VVyO6ljiUFdtwaBtav/3jnB+Jn1fx+ntzOFXzlyLTt/Q1hh4lIc+ELxNsnLq
         9lqHfpDayL4pvaEEXnQi8CXDqfujRXSeS0ieervt94oTl/RGAq80CLNoODrBhNcdPPmN
         FiZw==
X-Forwarded-Encrypted: i=1; AJvYcCWlVkwsW5WJFn0Rf6tpHY4h8aIX0aChRJkuSNV6e+Rf0moSSBXh/n3eT/z9le8SBnRjmIpwtylt5fhdYyp4Kg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfry3nnTJVMxNdyqgz4/9NOc0ik3dhdDLMFUlbcyrTbFIdE0Au
	7uUrq0OM2g6/2t0FeYwMoTt9mAs/W9r8jxsWmfCUyNZesSEnUCHZBuzEL7H+oZhavHRho+qqoZ2
	/R/h8LKkteN7q0fdpF9WVgcmM7wbfWb13tfUyKRfQNmlDIOIWFjXD45bYr66a1fAoP0i8
X-Gm-Gg: ASbGncu7eMI4Huwmc0U7ASZDpMWw6tPpylBNmuZE04gth7s9fGeX0Topcnsz/y5ZPYS
	DcUP+OvuFlNOMwQ55x5CcmFA9ZOOiM0/4tTLPc3307UmHB+TN9pHkvxDbZISv9Iyp/OX/Zcys4O
	wQ8pR0C6qZNRQSsWr/RaujQntQnsXalqwzEkpdmjFvYaAfFC2O/7IX2UMc89lpePyIKLxXU0fw5
	Jt/q0gtB92Zq52hu9izv8v5qgkQsrbY42i1JmlX/f+4K8a4dTwlE4bqVkDVyCrAFEYRPE+pQsXD
	FXyRlGAeojwaX+tj6zY7ygtbpSU=
X-Received: by 2002:a17:90a:c7ce:b0:31c:15d9:8ae with SMTP id 98e67ed59e1d1-31c2fe158d6mr7846229a91.33.1752142753393;
        Thu, 10 Jul 2025 03:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv3hiotUoHZkqRgzP7Atd/7ETibp6XSdOqeKTU+WhUdKOxAzqsb24qihXy06RyXmoKGawhsg==
X-Received: by 2002:a17:90a:c7ce:b0:31c:15d9:8ae with SMTP id 98e67ed59e1d1-31c2fe158d6mr7846192a91.33.1752142752812;
        Thu, 10 Jul 2025 03:19:12 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.221.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c301ceacbsm4768660a91.42.2025.07.10.03.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 03:19:12 -0700 (PDT)
Date: Thu, 10 Jul 2025 12:19:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Message-ID: <meqdvtktodz3jt6mtpppwfsyrxobqtyh777b7qzeoi4cmpo6m4@vno4cxr27asm>
References: <w7oaipcnfmjikd3ob7mh3bkxgxbtgfqzrmf6upay2vqmpgniei@cpbnm63fj5th>
 <20250702060516.682183-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250702060516.682183-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z0wMSZE3Sq0XsAKkmOprJuZ1YD6dNqWKcOV-BYpookE_1752142754
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 02, 2025 at 02:05:16PM +0800, Xuewei Niu wrote:

[...]

>> >> >>
>> >> >> Why?
>> >> >>
>> >> >> IMO, as I already wrote, the libkrun service should use CID=0.
>> >> >
>> >> >As we before discussed, if there is only one backend for the libkrun
>> >> >service, we can use cid=0. I totally agree with you. So let us put this
>> >> >case aside first.
>> >> >
>> >> >> How you will handle multiple devices for host? How can the guest know
>> >> >> which device to use to reach HOST(2)?
>> >> >
>> >> >Do `bind()` explicitly, and a device with matching cid will be picked up.
>> >>
>> >> Okay, but why you need 2 devices to communicate with the same CID, host
>> >> in this case (CID=2)?
>> >> IMO use the source CID to multiplex a socket at destination is not
>> >> great. But I can be wrong.
>> >
>> >I mean multiple sockets with multiple `bind()` calls, not multiplexing:
>> >
>> >- socket1: bind(3, -1), connect(2, 10000);
>> >- socket2: bind(4, -1), connect(2, 10001);
>> >- ...
>>
>> Yep, of course, I meant exactly that.
>> In this case we are doing multiplexing based on the source address,
>> which IMHO is odd.
>
>Please see below.
>
>> >> >> IMO is easier to have the multiple device for sibling (e.g. the device
>> >> >> can advertise which dest CID its supports), but not for host.
>> >> >
>> >> >I think one device for sibling is enough.
>> >>
>> >> I also think one should be enough, but IMO I think it might make more
>> >> sense to have multiple devices in this case, where each device can
>> >> handle a pool of CIDs, then the hard part will be figuring out how to
>> >> allocate the CIDs, etc. so yes, I agree that having one device even in
>> >> this case is the easiest thing.
>> >
>> >Yeah, so let us skip this for now ;)
>>
>> Agree.
>>
>> > >
>> >> >For example, dev1 is enough for
>> >> >communication with dev3 and dev4. So we don't need dev2 for sibling in the
>> >> >first VM, right?
>> >>
>> >> Just a note, vhost-vsock is not allowing any sibling communication.
>> >> vhost-user-vsock can do it, but we don't want to bring any support in
>> >> vhost-vsock to not overcomplicate it (again it will become like a
>> >> network switch, requiring firewalls, etc.)
>> >
>> >Even if we don't impose some complicated mechanisms, I think the
>> >vhost-vsock should work with sibling, and I don't see any difference
>> >between vhost-vsock and vhost-user-vsock. (I am just curious.)
>>
>> THe difference is how to prevent a communication between VMs of
>> different users.
>>
>> With vhost-user-vsock, you can decide which VMs to connect to the
>> vhost-user backend, in vhost-vsock all of them will be attached to the
>> host net stack, so we need to add some kind of firewall, etc. and it
>> will complicate a lot our simple stack. So I'm not sure we want that.
>
>I see it. The vhost-user-vsock provides kind of "namespace" capability, am
>I right?

yep, kind of.

>
>> >> >+──kernel(vhost-vsock)──────────────────────────────────────────────+
>> >> >│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
>> >> >││  dev1(cid1)  │ │  dev2(cid2)  │ │  dev3(cid3)  │ │  dev4(cid4)  ││
>> >> >│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
>> >> >+────────▲────────────────▲────────────────▲────────────────▲───────+
>> >> >         │                │                │                │
>> >> >         │                │          ┌─────┘                │
>> >> >         │                │          │                      │
>> >> >+────────┴───────────+    │ +────────┴───────────+ +────────┴───────────+
>> >> >│+──────────────+ VM0│    │ │+──────────────+ VM1│ │+──────────────+ VM2│
>> >> >││dev1(cid1,def)│    │    │ ││dev3(cid3,def)│    │ ││dev4(cid4,def)│    │
>> >> >│+──────────────+    │    │ │+──────────────+    │ │+──────────────+    │
>> >> >│+──────────────+    │    │ │                    │ │                    │
>> >> >││  dev2(cid2)  │────┼────┘ │                    │ │                    │
>> >> >│+──────────────+    │      │                    │ │                    │
>> >> >+────────────────────+      +────────────────────+ +────────────────────+
>> >> >
>> >> >The things go different for devices for host:
>> >> >
>> >> >1. For dev1, it is used for sibling (dev1 <-> dev4), and the host
>> >> >(src_cid=cid1, dst_cid=2) means the real host (not a userapp), where
>> >> >doesn't show in the diagram.
>> >>
>> >> This is not going to happen (see above).
>> >>
>> >> >2. For dev2 (src_cid=cid2), the host (dst_cid=2) is userapp1;
>> >> >3. For dev3 (src_cid=cid3), the host (dst_cid=2) is userapp2.
>> >> >
>> >> >+──kernel(vhost-vsock)──────────────────────────────────────────────+
>> >> >│+──────────────+                                   +──────────────+│
>> >> >││  dev1(cid1)  │                                   │  dev4(cid4)  ││
>> >> >│+──────────────+                                   +──────────────+│
>> >> >+────────▲──────────────────────────────────────────────────▲───────+
>> >> >         │                                                  │
>> >> >+────────┴───────────+     +────────────────────+           │
>> >> >│+──────────────+ VM0│     │+──────────────+    │           │
>> >> >││dev1(cid1,def)│    │┌────▶│  dev2(cid2)  │    │  +────────┴───────────+
>> >> >│+──────────────+    ││    │+──────────────+    │  │+──────────────+ VM2│
>> >> >│+──────────────+    ││    │            userapp1│  ││dev4(cid4,def)│    │
>> >> >││  dev2(cid2)  │────┼┘    +────────────────────+  │+──────────────+    │
>> >> >│+──────────────+  vhost-user-vsock─────────────+  │                    │
>> >> >│+──────────────+    │     │+──────────────+    │  │                    │
>> >> >││  dev3(cid3)  │────┼─────▶│  dev3(cid3)  │    │  │                    │
>> >> >│+──────────────+    │     │+──────────────+    │  +────────────────────+
>> >> >+────────────────────+     │            userapp2│
>> >> >                           +────────────────────+
>> >> >
>> >>
>> >> I'm really confused with `cid1`, `cid2`, etc. Are they any number >= 3?
>> >> I'd suggest to use real value (e.g. cid=42).
>> >
>> >Okay. I'll update it with real value ;)
>> >
>> >Based on the above question, I still put the devices into the kernel.
>> >
>> >+──kernel(vhost-vsock)──────────────────────────────────────────────────+
>> >│+───────────────+                                  +───────────────+   │
>> >││  dev1(cid=3)  │                                  │  dev4(cid=6)  │   │
>> >│+───────────────+                                  +───────────────+   │
>> >+────────▲──────────────────────────────────────────────────▲───────────+
>> >         │                                                  │
>> >+────────┴───────────+     +────────────────────+           │
>> >│+───────────────+VM0│     │+──────────────+    │           │
>> >││dev1(cid=3,def)│   │┌────▶│ dev2(cid=4)  │    │  +────────┴───────────+
>> >│+───────────────+   ││    │+──────────────+    │  │+───────────────+VM2│
>> >│+───────────────+   ││    │            userapp1│  ││dev4(cid=6,def)│   │
>> >││  dev2(cid=4)  │───┼┘    +────────────────────+  │+───────────────+   │
>> >│+───────────────+ vhost-user-vsock─────────────+  │                    │
>> >│+───────────────+   │     │+──────────────+    │  │                    │
>> >││  dev3(cid=5)  │───┼─────▶│ dev3(cid=5)  │    │  │                    │
>> >│+───────────────+   │     │+──────────────+    │  +────────────────────+
>> >+────────────────────+     │            userapp2│
>> >                           +────────────────────+
>> >
>> >> So what dest CID the VM0 is supposed to use to talk with userapp1 and
>> >> userapp2? In both cases CID=2, right?
>> >
>> >Yes. There are at least two sockets with source cid=4 and cid=5
>> >respectively.
>>
>> As I said, this is odd IMHO.
>> We are using the source address to multiplex the destination app.
>> We should use the destination address for that, no?
>
>Well. In my design, we use one device mainly for the host, so that we can
>do multiplexing as we ususally do. Other devices are dedicated for specific
>uses, for example, I want to use a dedicated vsock for TSI backend as I
>mentioned before. In this case, we can't do multiplexing.

I meant multiplexing in the VM. Why we can't do that?

>
>IMHO, our systems are functional without the support of multiple devices,
>right? So I introduce the default device to make sure that we don't break
>the current usage after adding the support.
>
>At the same time, we really want to have more devices for specific use
>cases, where we have to deal with the more complicated usage and config.
>
>To recap: I think the case I mentioned here is one of specific use 
>cases.
>For most cases, we can do multiplexing based on the destination address.
>
>Looks good to you?

Yep, in order to not over-complicate vsock, I think the "default" device 
is the simplest way.

>
>> >> Why you need 2 vhost-user-vsock devices?
>> >
>> >The benefit of vhost-user is "shared memory", which reduces the need
>> >for
>> >data copying. It is possible to share virtqueues to multiple user apps, for
>> >the sake of performance.
>> >
>> >I don't forget the "CID=0" thing. Just as an explanation, I'll use the
>> >example of TSI.
>> >
>> >We can treat the TSI backend as a proxy. Thanks to vhost-user-vsock, the
>> >data will be copied once from the guest user space to the proxy. When we
>> >have two subnets, which is a common case, we might want to have two
>> >proxies
>> >to forward the data.
>>
>> Okay, I see it now, but it's really the use case of vsock?
>
>We are using Kata Containers to launch a pod. Thanks to Istio Ambient [1]
>service mesh, which is available now, we don't need to set network rules in
>the pod. Networking inside the VM is pretty simple, we don't need to
>network stack, all we need to do is to forward the data to the Istio
>Ambient host daemonset. In this case, vsock and TSI are the best choices.
>
>If use network, we have to do a lot of copy to achieve that:
>
>guest userspace
>    -> guest network stack
>        -> pod net namespace network stack
>            -> host network stack
>                -> host userspace (Istio Ambient proxy)
>
>If use TSI, the things are:
>
>guest userspace
>    -> guest vsock
>        -> host tsi backend (Istio Ambient proxy)
>
>We are trying to enable vsock to function as a data plane, instead of only
>doing control stuff (control plane).
>
>Of course, we also expect that the vsock keeps as simple as possible, and
>try to not bother users who don't need these advanced features.
>
>1: https://istio.io/latest/blog/2022/introducing-ambient-mesh/
>
>> In this way the destination address (CID, port) is completely useless,
>> since it's never used, so why using vsock for this use case?
>
>What if the userapp provides two services on different ports, so port is
>needed?

I see.

>
>> I have an idea, but I don't know if it is feasible.
>> CID=0 is pretty much unsupported for now by virtio-vsock, but maybe we
>> could leverage it for this use case.
>>
>> If we have multiple devices, but each practically allows only one
>> application to be reached,
>
>See above.
>
>> then these devices can be reached by CID=0
>
>Why CID=0 only?
>
>> and port=x, where each device exposes in its configuration space the
>> port to which it responds.
>>
>> Thus, in the guest, connect(0, 10001) will go to the device that exposes
>> port 10001, and so on.
>
>Your proposal
>
>pro:
>
>1) all cases don't need to call `bind()`.
>
>cons:
>
>1) since the config space will not be read after the device is set up, the
>driver can't update the exposed port dynamically.
>2) the driver has to maintain the mapping between the port and the 
>device.
>3) the guest apps still have to know the mapping to get the right port.

Yep, I wrote that I don't like it too ;-)

>
>===
>
>My proposal
>
>pro:
>
>1) it is transparent to the driver.

The driver needs to be updated to support these changes, no?

>2) most cases (expected 95%) don't need to make a change (they don't 
>have
>to know the mapping, and don't need to call `bind()`).
>
>cons:
>
>1) specific cases (expected 5%) need to know which device to use, and do
>`bind()` call.
>
>===
>
>I update some limitations, and try to make things clearer:
>
>1) the default device is allowed to communicate with host and sibling (just
>like with a single device now).
>2) other devices are allowed to communicate with host (CID=2) only.
>
>> I don't know if I really like that proposal honestly, anyway, if we go
>> back with yours instead, where the guest has to do the bind to choose
>> the device to use, that's fine, but the one thing we have to have IMO is
>> a way to set the default device, as we were doing.
>
>Exactly!

BTW, yep let's do the default approach for now if others are fine, also 
because I'm a bit lost xD

>
>> >
>> >                 +────────────────+    +───────────────────────────────+
>> > .─────────.     │  tsi backend1  │    │+───────────────+    ┏━━━━━━━━┓│
>> >(    NW1    )◀───│   (userapp1)   │◀───┤│  vsock dev1   ◀────┃subnet1 ┃│
>> > `─────────'     +────────────────+    │+───────────────+    ┗━━━━━━━━┛│
>> >                                       │                               │
>> >                 +────────────────+    │+───────────────+
>> >                 ┏━━━━━━━━┓│
>> > .─────────.     │  tsi backend2  │◀───┤│  vsock dev2   ◀────┃subnet2 ┃│
>> >(    NW2    )◀───│   (userapp2)   │    │+───────────────+    ┗━━━━━━━━┛│
>> > `─────────'     +────────────────+    +───────────────────────────────+
>> >
>> >> Can you just have a single one and have the application
>> >> connecting/listing on different port? (which is the sense of the port,
>> >> multiplexing application on the destination)
>> >
>> >In terms of functionality, I think it is possible. But it loses the benefit
>> >of vhost-user-vsock.
>>
>> Can you elaborate a bit?
>
>In this case, we can have one TSI backend with multiple ports. Then, the
>backend forwards data to different proxies, which means we actually copy
>the data an additional time between the backend and the proxy.
>
>guest userspace
>    -> guest vsock
>        -> host tsi backend
>            -> host proxy (Istio Ambient proxy)
>
>If we can combine TSI backend and proxy, we can reduce the data copying.

Okay, my suggestion for next version is to explain very well (in the 
commit description I guess) why we decided to go in this way (e.g. not 
overcomplicate vsock, backward compatibility, limitations, etc.), but 
yeah, it seems the less complicated approach that should work for you 
and keep vsock simple.

The main thing we should explain well, is that vsock is not a net 
device, so if the host attach 3 devices, they have all the same 
destination address from the guest point of view (CID=2), for that 
reason we can only use the source address to mulitplex them.
(e.g. for net, if you attached 3 devices, they will have 3 different 
dest MAC/IP address to reach the host).

Thanks,
Stefano

