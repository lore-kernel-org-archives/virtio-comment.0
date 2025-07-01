Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3715E96
	for <virtio-comment@lists.linux.dev>; Tue,  1 Jul 2025 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365895; cv=none; b=bWSVMiZjnSXc97oKlNfAZ1ROD6jU97H7CE9mSDgSsQUBW8xk/QXPy70mURcDEZy3cHFs5XzmQ13zAI524KYIRRx4xsjORPr/loL8zT4DiH+riNyO0ptP8n0xUN77MaDva0h94BwywhXBqUJPGUxYJ4y504SmMBfCAcs15LBqS0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365895; c=relaxed/simple;
	bh=xahvbSluIguSZ5Y7HTRpa35Q8JPDTvJ4nQFETtolMps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fTg8+yXxXiGSPtUerNSH5VK0aF1ueWg9/3ZJX/QmSejVRPVfxzMUWP7iQ9WKJUMAbnVRybZ3CXNulM6kRsGBn6wsh2G05ivH3AFy73JzerHT3pq3ooYn7lmt9t4VGfXDXi1KLoQdO1YdJY4XBjGXHGbwETVl5BzyAo0VYXvi9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FBjWmziO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FBjWmziO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751365891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/X9Swmv3GmeRX91qWBmPid+ZkdP4E419PjeZiKfOGE=;
	b=FBjWmziOdaRRpIvPSU72EZrtZBBJ1CL3pkUdBGCAHwGxhyQLnZX09MZ59T5g2bZUB39gkp
	A1kCVu7YMpWulzH58s4jO2XEQ3GuzgJ6+Cw9y8fScotWoTTlUVU2m3vTLCUXQuUVAWSI/6
	YiL2cy85CKGmeN0B5IXIpOQfJNqZiQM=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-Ze2hHXaUNe-yn4fxuxWnZg-1; Tue, 01 Jul 2025 06:31:30 -0400
X-MC-Unique: Ze2hHXaUNe-yn4fxuxWnZg-1
X-Mimecast-MFC-AGG-ID: Ze2hHXaUNe-yn4fxuxWnZg_1751365890
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-611d5826d59so1393771eaf.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Jul 2025 03:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365890; x=1751970690;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/X9Swmv3GmeRX91qWBmPid+ZkdP4E419PjeZiKfOGE=;
        b=GCYnczQTjLE7QlviBuEAfa7vtoNqWdrcZFZWQJvZDx8TdKI5ig3E95wgaUYKlKjk+X
         Fyww9bq2Rccg6UP1zprXt6gjsT8DzeVOr1NXyxYARzq9vOiZYmsaSVtYuYzMNNZWnHcZ
         37zuLG6RxDMpF6tlPfkZ8/Uv4TXDvhfiz55WTmewQKeuL0+ZRRXGiKwyP7YXrIbCP6Oj
         NcI4c04F1T8PiFCoi0ByA78XGwvcxWHYm3IsC/rDsVt7JbDXrVBmdV5RBuEzd2GOrsFf
         IEFXvSn0jYx4etj4u61v4yRacToC5zepEJu5mn4IgbvyGonyPIIqOsV3MYWryUBuNlV7
         z8Ow==
X-Forwarded-Encrypted: i=1; AJvYcCW6aqk0dE7tslFBU/ikdg1YxssehQKtAPLWJ1PHH/vHI9QsgpyqYXj4g1odSnyyZQi10uHIiuJQ1X9Cnr+KNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV979nU1YFSVRlIURqaI+tz9qFoWXjZ7q9PY26Sp6RzdnsJsLJ
	Tu1ptfWfgDi2IQpR7X94M+1/PB6eVHjrzzwqXkjQcXDaAkasv0ln+LD83x5g8PNMPI0W4rU2GDJ
	n/PPrfvEi3HKdQjZh+W5yZW3qE3jc0EjtFrbwFv5cfoXCRB/pSDeraI43DM0hH6Qj8IBZ
X-Gm-Gg: ASbGncsB+32ucP3pkoQwhI9YaiWaiASJJT83Wi9kZbu8xVv2n1wvYL96gLyo6xBx/5I
	fFtxdPaslSWgFNXgLaG215XOxx7Vkcllo8ntkNCY+lLpxRAdYHUAJHcitnrcDiizi+GaR23eloy
	wxBDtpY85ooWdwf4PkpJ1ds0Kxeuqit9jux+2wo/SzeooAQmLZvschTQeO1JWoZNdvDXxhirbc0
	3LOO8l1/sAOtUUORbb3iQsyZx5iptMIDH1Dt2rDsma//+qJvknN4ITcxTO2r9tIjN2fzAEUJd9h
	wYmNEIrrdc3PZx7Q6Ipku7ZM3f/d
X-Received: by 2002:a05:6871:5b1e:b0:2bc:7007:5145 with SMTP id 586e51a60fabf-2efed4868dcmr12722814fac.9.1751365889638;
        Tue, 01 Jul 2025 03:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlcdFUcAOAUj9SVwzqDRO5yw47iKBnEqTAuyDq2PeLkcWSl3l6NIQHxz/3xraOTzfCSBboYQ==
X-Received: by 2002:a05:6871:5b1e:b0:2bc:7007:5145 with SMTP id 586e51a60fabf-2efed4868dcmr12722719fac.9.1751365888147;
        Tue, 01 Jul 2025 03:31:28 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.144.202])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea6b86sm3272771fac.1.2025.07.01.03.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:31:27 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:31:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Message-ID: <w7oaipcnfmjikd3ob7mh3bkxgxbtgfqzrmf6upay2vqmpgniei@cpbnm63fj5th>
References: <s6rxycmztea6cryhsxbeyljhvptduue2h67wy2vrbffseorops@ht6iocaszizf>
 <20250623155139.1673574-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250623155139.1673574-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Wb8hJo5qkZrDlD2F-jSMuKa-EIQ4qgJjIvXUsskvj_4_1751365890
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 23, 2025 at 11:51:39PM +0800, Xuewei Niu wrote:
>> On Mon, Jun 23, 2025 at 08:14:07PM +0800, Xuewei Niu wrote:
>> >> On Mon, Jun 23, 2025 at 06:35:59PM +0800, Xuewei Niu wrote:
>> >> >> On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
>> >> >> >> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
>> >> >> >> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
>> >> >> >> >> > Sent: 19 June 2025 08:57 AM
>> >> >> >> >> >
>> >> >> >> >> > Hi Parav,
>> >> >> >> >> >
>> >> >> >> >> > Could you please take a look at the diagram in [1]?
>> >> >> >> >> >
>> >> >> >> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
>> >> >> >> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
>> >> >> >> >> > at this time.
>> >> >> >> >> >
>> >> >> >> >> > I think the first thing is to figure out how to pick the right group.
>> >> >> >> >> >
>> >> >> >> >> > Standard socket doesn't provide a way to access the group information.
>> >> >> >> >> >
>> >> >> >> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
>> >> >> >> >> > don't call `bind()`, only the destination is known.
>> >> >> >> >> >
>> >> >> >> >> > However, only destination is not enough to find the group. For example, the
>> >> >> >> >> > well-known CIDs (e.g. 2) are valid for all groups.
>> >> >> >> >> >
>> >> >> >> >> > 1:
>> >> >> >> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
>> >> >> >> >>
>> >> >> >> >> Right. Sock addressing scheme is naïve presently to select the group.
>> >> >> >> >> Not sure when/how you or others plan to do.
>> >> >> >> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
>> >> >> >>
>> >> >> >>
>> >> >> >> >>
>> >> >> >> >> However, at device level, we should have the construct of grouping.
>> >> >> >> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
>> >> >> >> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
>> >> >> >> >>
>> >> >> >> >> So I was imagining a relatively simple scheme:
>> >> >> >> >> For example, virtio device level, some kind of group id is present.
>> >> >> >> >> So two devices which has same group id, are part of single group.
>> >> >> >> >> An example group id format can be a UUID.
>> >> >> >> >>
>> >> >> >> >> And this is completely optional for devices to implement.
>> >> >> >> >> Generic enough and usable beyond just vsock device in other use cases
>> >> >> >> >> we discussed in past.
>> >> >> >> >
>> >> >> >> >Fair enough.
>> >> >> >> >
>> >> >> >> >@Stefano, could you please take a look at this? I'd love to have some
>> >> >> >> >input
>> >> >> >> >from you.
>> >> >> >> >
>> >> >> >> >A brief summary of the idea is: The config space will be extended to
>> >> >> >> >include a group id. The devices with the same group id are considered
>> >> >> >> >to be
>> >> >> >> >in the same group.
>> >> >> >>
>> >> >> >> Thanks for the summary, but please avoid top posting, otherwise is very
>> >> >> >> hard to follow the discussion :-(
>> >> >> >> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
>> >> >> >
>> >> >> >Sorry, I'll avoid it in the future.
>> >> >> >
>> >> >> >> I like the idea of groups. What is not clear to me, is how groups will
>> >> >> >> allow the driver to select the default output device when the source
>> >> >> >> socket is not bind to any source CID.
>> >> >> >
>> >> >> >Well, we did discuss, but we need your input.
>> >> >> >
>> >> >> >I said in the thread [1] based on the standard socket API, the driver can't
>> >> >> >pick a group. Parav [2] suggested that the group, as a basic concept,
>> >> >> >should be present even if we are unable to use it.
>> >> >> >
>> >> >> >IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
>> >> >> >the concept. But it is a very big change, leading to incompatibility with
>> >> >> >the existing apps.
>> >> >>
>> >> >> I still don't understand how the group_id will work :-( and how will
>> >> >> allow the driver to pick the default device.
>> >> >
>> >> >FYI, here is trying to explain what is group and why it is needed, but I
>> >> >agree with you about the idea of "types".
>> >> >
>> >> >I posted a diagram in the thread [1]. I think the group is something like a
>> >> >"namespace". I think it is reasonable, but my concerns are compatibility
>> >> >and complexity.
>> >> >
>> >> >1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
>> >> >
>> >> >> This is the `sockaddr_vm`, so we should be careful of extending it:
>> >> >>
>> >> >> struct sockaddr_vm {
>> >> >> 	__kernel_sa_family_t svm_family;
>> >> >> 	unsigned short svm_reserved1;
>> >> >> 	unsigned int svm_port;
>> >> >> 	unsigned int svm_cid;
>> >> >>
>> >> >> #define VMADDR_FLAG_TO_HOST 0x01
>> >> >>
>> >> >> 	__u8 svm_flags;
>> >> >> 	unsigned char svm_zero[sizeof(struct sockaddr) -
>> >> >> 			       sizeof(sa_family_t) -
>> >> >> 			       sizeof(unsigned short) -
>> >> >> 			       sizeof(unsigned int) -
>> >> >> 			       sizeof(unsigned int) -
>> >> >> 			       sizeof(__u8)];
>> >> >> };
>> >> >>
>> >> >> >I think it might be beyond the scope of this patch, and would make the
>> >> >> >vsock more complex. The current conclusion is that we will keep the concept
>> >> >> >of grouping as a placeholder, but we will not use it.
>> >> >>
>> >> >> IMO we should first clarify better what we want to support.
>> >> >> As I already suggested some months ago, IMHO supporting any number of
>> >> >> vsock devices for a VM it's not really needed for your goal and I can't
>> >> >> see other use cases where a virtio-net device can't be use. Just a
>> >> >> reminder, vsock is not a network device, is more a P2P device where we
>> >> >> want to keep the configuration in the guest as simpler as possible (we
>> >> >> don't want to run ARP, DHCP, etc.).
>> >> >
>> >> >Agree that.
>> >> >
>> >> >> Till now vsock was more used just for guest-host communication, but
>> >> >> recently it was extended to communicate with sibling VMs.
>> >> >>
>> >> >> IIUC your use case, we just need to support different type of vsock
>> >> >> devices attached to the VM. With "type" I mean type of address handled.
>> >> >> I think we can define 3 types based on the CID we have:
>> >> >> - hypervisor: VMADDR_CID_HYPERVISOR(0)
>> >> >> - host: VMADDR_CID_HOST(2)
>> >> >> - sibling: CID >=3
>> >> >>
>> >> >> The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow
>> >> >> to reach from the guest any other CIDs.
>> >> >> The vhost-user-vsock recently started to support sibling VMs.
>> >> >> The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).
>> >> >>
>> >> >> So, IMHO we should define new features or config flags that a device can
>> >> >> expose depending on which address is able to handle.
>> >> >> Also, in order to avoid to overcomplicate vsock, we should allow only
>> >> >> one device for each type (a single device should support multiple types,
>> >> >> but only one device can be registered for a type).
>> >> >
>> >> >I think only one device can be registered for sibling and hypervisor. And
>> >> >it is possible to have multiple devices for host. Otherwise, the goals of
>> >> >this patch will be not achieved.
>> >>
>> >> Why?
>> >>
>> >> IMO, as I already wrote, the libkrun service should use CID=0.
>> >
>> >As we before discussed, if there is only one backend for the libkrun
>> >service, we can use cid=0. I totally agree with you. So let us put this
>> >case aside first.
>> >
>> >> How you will handle multiple devices for host? How can the guest know
>> >> which device to use to reach HOST(2)?
>> >
>> >Do `bind()` explicitly, and a device with matching cid will be picked up.
>>
>> Okay, but why you need 2 devices to communicate with the same CID, host
>> in this case (CID=2)?
>> IMO use the source CID to multiplex a socket at destination is not
>> great. But I can be wrong.
>
>I mean multiple sockets with multiple `bind()` calls, not multiplexing:
>
>- socket1: bind(3, -1), connect(2, 10000);
>- socket2: bind(4, -1), connect(2, 10001);
>- ...

Yep, of course, I meant exactly that.
In this case we are doing multiplexing based on the source address, 
which IMHO is odd.

>
>> >> IMO is easier to have the multiple device for sibling (e.g. the device
>> >> can advertise which dest CID its supports), but not for host.
>> >
>> >I think one device for sibling is enough.
>>
>> I also think one should be enough, but IMO I think it might make more
>> sense to have multiple devices in this case, where each device can
>> handle a pool of CIDs, then the hard part will be figuring out how to
>> allocate the CIDs, etc. so yes, I agree that having one device even in
>> this case is the easiest thing.
>
>Yeah, so let us skip this for now ;)

Agree.

>
>> >For example, dev1 is enough for
>> >communication with dev3 and dev4. So we don't need dev2 for sibling in the
>> >first VM, right?
>>
>> Just a note, vhost-vsock is not allowing any sibling communication.
>> vhost-user-vsock can do it, but we don't want to bring any support in
>> vhost-vsock to not overcomplicate it (again it will become like a
>> network switch, requiring firewalls, etc.)
>
>Even if we don't impose some complicated mechanisms, I think the
>vhost-vsock should work with sibling, and I don't see any difference
>between vhost-vsock and vhost-user-vsock. (I am just curious.)

THe difference is how to prevent a communication between VMs of 
different users.

With vhost-user-vsock, you can decide which VMs to connect to the 
vhost-user backend, in vhost-vsock all of them will be attached to the 
host net stack, so we need to add some kind of firewall, etc. and it 
will complicate a lot our simple stack. So I'm not sure we want that.

>
>> >+──kernel(vhost-vsock)──────────────────────────────────────────────+
>> >│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
>> >││  dev1(cid1)  │ │  dev2(cid2)  │ │  dev3(cid3)  │ │  dev4(cid4)  ││
>> >│+──────────────+ +──────────────+ +──────────────+ +──────────────+│
>> >+────────▲────────────────▲────────────────▲────────────────▲───────+
>> >         │                │                │                │
>> >         │                │          ┌─────┘                │
>> >         │                │          │                      │
>> >+────────┴───────────+    │ +────────┴───────────+ +────────┴───────────+
>> >│+──────────────+ VM0│    │ │+──────────────+ VM1│ │+──────────────+ VM2│
>> >││dev1(cid1,def)│    │    │ ││dev3(cid3,def)│    │ ││dev4(cid4,def)│    │
>> >│+──────────────+    │    │ │+──────────────+    │ │+──────────────+    │
>> >│+──────────────+    │    │ │                    │ │                    │
>> >││  dev2(cid2)  │────┼────┘ │                    │ │                    │
>> >│+──────────────+    │      │                    │ │                    │
>> >+────────────────────+      +────────────────────+ +────────────────────+
>> >
>> >The things go different for devices for host:
>> >
>> >1. For dev1, it is used for sibling (dev1 <-> dev4), and the host
>> >(src_cid=cid1, dst_cid=2) means the real host (not a userapp), where
>> >doesn't show in the diagram.
>>
>> This is not going to happen (see above).
>>
>> >2. For dev2 (src_cid=cid2), the host (dst_cid=2) is userapp1;
>> >3. For dev3 (src_cid=cid3), the host (dst_cid=2) is userapp2.
>> >
>> >+──kernel(vhost-vsock)──────────────────────────────────────────────+
>> >│+──────────────+                                   +──────────────+│
>> >││  dev1(cid1)  │                                   │  dev4(cid4)  ││
>> >│+──────────────+                                   +──────────────+│
>> >+────────▲──────────────────────────────────────────────────▲───────+
>> >         │                                                  │
>> >+────────┴───────────+     +────────────────────+           │
>> >│+──────────────+ VM0│     │+──────────────+    │           │
>> >││dev1(cid1,def)│    │┌────▶│  dev2(cid2)  │    │  +────────┴───────────+
>> >│+──────────────+    ││    │+──────────────+    │  │+──────────────+ VM2│
>> >│+──────────────+    ││    │            userapp1│  ││dev4(cid4,def)│    │
>> >││  dev2(cid2)  │────┼┘    +────────────────────+  │+──────────────+    │
>> >│+──────────────+  vhost-user-vsock─────────────+  │                    │
>> >│+──────────────+    │     │+──────────────+    │  │                    │
>> >││  dev3(cid3)  │────┼─────▶│  dev3(cid3)  │    │  │                    │
>> >│+──────────────+    │     │+──────────────+    │  +────────────────────+
>> >+────────────────────+     │            userapp2│
>> >                           +────────────────────+
>> >
>>
>> I'm really confused with `cid1`, `cid2`, etc. Are they any number >= 3?
>> I'd suggest to use real value (e.g. cid=42).
>
>Okay. I'll update it with real value ;)
>
>Based on the above question, I still put the devices into the kernel.
>
>+──kernel(vhost-vsock)──────────────────────────────────────────────────+
>│+───────────────+                                  +───────────────+   │
>││  dev1(cid=3)  │                                  │  dev4(cid=6)  │   │
>│+───────────────+                                  +───────────────+   │
>+────────▲──────────────────────────────────────────────────▲───────────+
>         │                                                  │
>+────────┴───────────+     +────────────────────+           │
>│+───────────────+VM0│     │+──────────────+    │           │
>││dev1(cid=3,def)│   │┌────▶│ dev2(cid=4)  │    │  +────────┴───────────+
>│+───────────────+   ││    │+──────────────+    │  │+───────────────+VM2│
>│+───────────────+   ││    │            userapp1│  ││dev4(cid=6,def)│   │
>││  dev2(cid=4)  │───┼┘    +────────────────────+  │+───────────────+   │
>│+───────────────+ vhost-user-vsock─────────────+  │                    │
>│+───────────────+   │     │+──────────────+    │  │                    │
>││  dev3(cid=5)  │───┼─────▶│ dev3(cid=5)  │    │  │                    │
>│+───────────────+   │     │+──────────────+    │  +────────────────────+
>+────────────────────+     │            userapp2│
>                           +────────────────────+
>
>> So what dest CID the VM0 is supposed to use to talk with userapp1 and
>> userapp2? In both cases CID=2, right?
>
>Yes. There are at least two sockets with source cid=4 and cid=5 
>respectively.

As I said, this is odd IMHO.
We are using the source address to multiplex the destination app.
We should use the destination address for that, no?

>
>> Why you need 2 vhost-user-vsock devices?
>
>The benefit of vhost-user is "shared memory", which reduces the need 
>for
>data copying. It is possible to share virtqueues to multiple user apps, for
>the sake of performance.
>
>I don't forget the "CID=0" thing. Just as an explanation, I'll use the
>example of TSI.
>
>We can treat the TSI backend as a proxy. Thanks to vhost-user-vsock, the
>data will be copied once from the guest user space to the proxy. When we
>have two subnets, which is a common case, we might want to have two 
>proxies
>to forward the data.

Okay, I see it now, but it's really the use case of vsock?
In this way the destination address (CID, port) is completely useless, 
since it's never used, so why using vsock for this use case?

I have an idea, but I don't know if it is feasible.
CID=0 is pretty much unsupported for now by virtio-vsock, but maybe we 
could leverage it for this use case.

If we have multiple devices, but each practically allows only one 
application to be reached, then these devices can be reached by CID=0 
and port=x, where each device exposes in its configuration space the 
port to which it responds.

Thus, in the guest, connect(0, 10001) will go to the device that exposes 
port 10001, and so on.

I don't know if I really like that proposal honestly, anyway, if we go 
back with yours instead, where the guest has to do the bind to choose 
the device to use, that's fine, but the one thing we have to have IMO is 
a way to set the default device, as we were doing.

>
>                 +────────────────+    +───────────────────────────────+
> .─────────.     │  tsi backend1  │    │+───────────────+    ┏━━━━━━━━┓│
>(    NW1    )◀───│   (userapp1)   │◀───┤│  vsock dev1   ◀────┃subnet1 ┃│
> `─────────'     +────────────────+    │+───────────────+    ┗━━━━━━━━┛│
>                                       │                               │
>                 +────────────────+    │+───────────────+    
>                 ┏━━━━━━━━┓│
> .─────────.     │  tsi backend2  │◀───┤│  vsock dev2   ◀────┃subnet2 ┃│
>(    NW2    )◀───│   (userapp2)   │    │+───────────────+    ┗━━━━━━━━┛│
> `─────────'     +────────────────+    +───────────────────────────────+
>
>> Can you just have a single one and have the application
>> connecting/listing on different port? (which is the sense of the port,
>> multiplexing application on the destination)
>
>In terms of functionality, I think it is possible. But it loses the benefit
>of vhost-user-vsock.

Can you elaborate a bit?

BTW in rust-vmm/vhost-device we use a single vhost-user device and 
multiplex connections between multiple applications in the host: 
https://github.com/rust-vmm/vhost-device/tree/main/vhost-device-vsock

Thanks,
Stefano

