Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D38AAD2C
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 11:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677353; cv=none; b=DvRxvKhjmJWNoGLcymcjvsKqW8I5dwfrqjma1wBia1rjnfxDTdJBAlWIGfFTGvmQSaSTMLJijZj4Q+ApLN4AE7YvsOUyRJEaIGx1GtMfX32z3g/J69rvMa8Jk03isHq8NH6PWC858rP89vzEr1F4gunLlX41KZoVrrxSJA2YOLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677353; c=relaxed/simple;
	bh=Ok2ls2GG0w/RqVvRGRqeb1eCyUvL7U8kx8bHfiDqZNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SLjKUrPL7G1cZ+w1rqkWqX0enyVKcIHMbJH78k0jdU4YODDBZl9onCLHGDhvYK3WtDWhBBETDKIBmcksTRrKvuXT1lSYnlKQrMmAcNcv9kPEfsh0k32M+qG4eZv/yo+C9TM6J23tYb3hQUmw9Qxr7bvGbMTfUVnGkhnN6Bdbj0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q7EC6jI3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q7EC6jI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750677350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eNI9PF0nkZ2eM2seNVYvxeiBILwZEqPL4BDJB0dawIE=;
	b=Q7EC6jI3Gsydd80TSwzC6JpgrYuT9fXspHIG2qbzrJoQIzkhsulw6dlEcGZ6HXGWrKeKgw
	z/uwG3/XbahUEEFZ40RNYu4O9y0pp1A24B6UOgpMDSN1Sqp/bDOTHxCl94K3Bf0Wh4xDXG
	sBj6dlX3Ksuf4MjOj5eQfznvQ2Hevhs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-lhuS5emMOa-zdigmsEo8FQ-1; Mon, 23 Jun 2025 07:15:49 -0400
X-MC-Unique: lhuS5emMOa-zdigmsEo8FQ-1
X-Mimecast-MFC-AGG-ID: lhuS5emMOa-zdigmsEo8FQ_1750677349
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab979413fso78200876d6.2
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 04:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677349; x=1751282149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eNI9PF0nkZ2eM2seNVYvxeiBILwZEqPL4BDJB0dawIE=;
        b=CsYhPM9K6wnkxPpN9/nSx1ig4HXNEwDGbbFvJkcpBP3pF42ZrtkFhvHDvDw0pMsspe
         OQ+fE2FGMOae/PwTBhigzKN+KH4z/4SuVJFWOhX+vRV79d9/NjWLt1JdwPcSnRmG5c5o
         YZHRFVIvFqaoQOomi7lIgFoYp9WedYc6eFMEWSuEAS6evmp78lq4A0kuc40m9X8LTjIp
         ZRIH2f5+qoQR3G2BRNhX/wlSKpUjOy7dTIpk2oAQ+l3eScDX9E1/jbqqRmPI5DCXctfQ
         mcBhrkVC+q5gE6EFujpe9xtEeCfXbeFp2gSwISdyYY1tk0jaHjBeahFlF6f4KnU5aivH
         l+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBOunQPvMijZL1AVg20kJM9aGOLrALSt39Q5MILOb1OWPUpwWiAB9TB7LMdQRIcUzlKui6eoF6EvErwCLChA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCIszrZJHJXdh1l82ee6qS2RPx9A4S5BnMPfpAmuiC53aymXaQ
	VSECv1o9/J2QudG3p9pF9jFp6rxB3xNWDYMA37LSnHVQmBQ3YcIHnnbfOIVasA25HckzIEFrxeo
	gmj8k6aBPg7tzFDVexPSPiqOAoujgOfTPXEKHa7LZlmMJo+u89QtAiN6IBBJurr37FScM
X-Gm-Gg: ASbGncsY9e+DMkmeATNEjKLWrTo7mhiS4nknqPi55ZTMkS3dSYl1LWQOyMBLpdAaFUw
	iKl+Q7H1F2JTwt+VX3QOi1u+H95p1hKcZH6k9pfw2+edu8VjtPZf0ry1WeY5WJpkrFhQlEjavnw
	BFcCWLStpwUYqKW48+SXItV64nhk9WtTJR3xlEb9fypz6RkLkZCz/1HzqmhFCTR+kDyyRe4t3V6
	0uEOiMfhodM0DwQhE/4n3kAVdCG69Y6U+WYaVIq2F2poKziRa30APZ0SBnIj4/ZHu9UY/XadSux
	QJhBB0apAFrTAYjhdEA4ZZyJsFc=
X-Received: by 2002:a05:6214:27e4:b0:6ea:d6e1:f3f8 with SMTP id 6a1803df08f44-6fd0a5ca834mr203655146d6.45.1750677348755;
        Mon, 23 Jun 2025 04:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9pntUt0VlGJCSEIi03cwkR3LEQrrCsgvzekW8kTIqJl8MBNeDTA4/Hf4uSXbFhiXnQ4OSCw==
X-Received: by 2002:a05:6214:27e4:b0:6ea:d6e1:f3f8 with SMTP id 6a1803df08f44-6fd0a5ca834mr203654696d6.45.1750677348230;
        Mon, 23 Jun 2025 04:15:48 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.87])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095c8ccbsm43197746d6.122.2025.06.23.04.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:15:47 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:15:37 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Message-ID: <bswghcrtbm3tgfadpzjidjeng4hd6wnhpodu3hpgxqe7x7aa6m@zqctemeqotaf>
References: <ncciiv3udhy6mylzobtt5jnp3xwthtfvuwonb7i5c5hkpcyfc2@utxcie3jxof2>
 <20250623103559.1656206-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250623103559.1656206-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9T_iFNedElZ23SOe6eUp_r2Pr_sejziofJmaxbe46p4_1750677349
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 23, 2025 at 06:35:59PM +0800, Xuewei Niu wrote:
>> On Mon, Jun 23, 2025 at 04:48:33PM +0800, Xuewei Niu wrote:
>> >> On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
>> >> >> > From: Xuewei Niu <niuxuewei97@gmail.com>
>> >> >> > Sent: 19 June 2025 08:57 AM
>> >> >> >
>> >> >> > Hi Parav,
>> >> >> >
>> >> >> > Could you please take a look at the diagram in [1]?
>> >> >> >
>> >> >> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
>> >> >> > Am I right? If yes, I think the group concept is reasonable but we don't need
>> >> >> > at this time.
>> >> >> >
>> >> >> > I think the first thing is to figure out how to pick the right group.
>> >> >> >
>> >> >> > Standard socket doesn't provide a way to access the group information.
>> >> >> >
>> >> >> > Source and destination are from `bind()` and `connect()`, respectively. If we
>> >> >> > don't call `bind()`, only the destination is known.
>> >> >> >
>> >> >> > However, only destination is not enough to find the group. For example, the
>> >> >> > well-known CIDs (e.g. 2) are valid for all groups.
>> >> >> >
>> >> >> > 1:
>> >> >> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
>> >> >>
>> >> >> Right. Sock addressing scheme is naïve presently to select the group.
>> >> >> Not sure when/how you or others plan to do.
>> >> >> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).
>> >>
>> >>
>> >> >>
>> >> >> However, at device level, we should have the construct of grouping.
>> >> >> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
>> >> >> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
>> >> >>
>> >> >> So I was imagining a relatively simple scheme:
>> >> >> For example, virtio device level, some kind of group id is present.
>> >> >> So two devices which has same group id, are part of single group.
>> >> >> An example group id format can be a UUID.
>> >> >>
>> >> >> And this is completely optional for devices to implement.
>> >> >> Generic enough and usable beyond just vsock device in other use cases
>> >> >> we discussed in past.
>> >> >
>> >> >Fair enough.
>> >> >
>> >> >@Stefano, could you please take a look at this? I'd love to have some
>> >> >input
>> >> >from you.
>> >> >
>> >> >A brief summary of the idea is: The config space will be extended to
>> >> >include a group id. The devices with the same group id are considered
>> >> >to be
>> >> >in the same group.
>> >>
>> >> Thanks for the summary, but please avoid top posting, otherwise is very
>> >> hard to follow the discussion :-(
>> >> https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
>> >
>> >Sorry, I'll avoid it in the future.
>> >
>> >> I like the idea of groups. What is not clear to me, is how groups will
>> >> allow the driver to select the default output device when the source
>> >> socket is not bind to any source CID.
>> >
>> >Well, we did discuss, but we need your input.
>> >
>> >I said in the thread [1] based on the standard socket API, the driver can't
>> >pick a group. Parav [2] suggested that the group, as a basic concept,
>> >should be present even if we are unable to use it.
>> >
>> >IMHO, we might use "{group_id}-{cid}" as the vsock addressing scheme to use
>> >the concept. But it is a very big change, leading to incompatibility with
>> >the existing apps.
>>
>> I still don't understand how the group_id will work :-( and how will
>> allow the driver to pick the default device.
>
>FYI, here is trying to explain what is group and why it is needed, but I
>agree with you about the idea of "types".
>
>I posted a diagram in the thread [1]. I think the group is something like a
>"namespace". I think it is reasonable, but my concerns are compatibility
>and complexity.
>
>1: https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
>
>> This is the `sockaddr_vm`, so we should be careful of extending it:
>>
>> struct sockaddr_vm {
>> 	__kernel_sa_family_t svm_family;
>> 	unsigned short svm_reserved1;
>> 	unsigned int svm_port;
>> 	unsigned int svm_cid;
>>
>> #define VMADDR_FLAG_TO_HOST 0x01
>>
>> 	__u8 svm_flags;
>> 	unsigned char svm_zero[sizeof(struct sockaddr) -
>> 			       sizeof(sa_family_t) -
>> 			       sizeof(unsigned short) -
>> 			       sizeof(unsigned int) -
>> 			       sizeof(unsigned int) -
>> 			       sizeof(__u8)];
>> };
>>
>> >I think it might be beyond the scope of this patch, and would make the
>> >vsock more complex. The current conclusion is that we will keep the concept
>> >of grouping as a placeholder, but we will not use it.
>>
>> IMO we should first clarify better what we want to support.
>> As I already suggested some months ago, IMHO supporting any number of
>> vsock devices for a VM it's not really needed for your goal and I can't
>> see other use cases where a virtio-net device can't be use. Just a
>> reminder, vsock is not a network device, is more a P2P device where we
>> want to keep the configuration in the guest as simpler as possible (we
>> don't want to run ARP, DHCP, etc.).
>
>Agree that.
>
>> Till now vsock was more used just for guest-host communication, but
>> recently it was extended to communicate with sibling VMs.
>>
>> IIUC your use case, we just need to support different type of vsock
>> devices attached to the VM. With "type" I mean type of address handled.
>> I think we can define 3 types based on the CID we have:
>> - hypervisor: VMADDR_CID_HYPERVISOR(0)
>> - host: VMADDR_CID_HOST(2)
>> - sibling: CID >=3
>>
>> The vhost-vsock device handles only VMADDR_CID_HOST, so it doesn't allow
>> to reach from the guest any other CIDs.
>> The vhost-user-vsock recently started to support sibling VMs.
>> The tcp-over-vsock of libkrun should use VMADDR_CID_HYPERVISOR(0).
>>
>> So, IMHO we should define new features or config flags that a device can
>> expose depending on which address is able to handle.
>> Also, in order to avoid to overcomplicate vsock, we should allow only
>> one device for each type (a single device should support multiple types,
>> but only one device can be registered for a type).
>
>I think only one device can be registered for sibling and hypervisor. And
>it is possible to have multiple devices for host. Otherwise, the goals of
>this patch will be not achieved.

Why?

IMO, as I already wrote, the libkrun service should use CID=0.

How you will handle multiple devices for host? How can the guest know 
which device to use to reach HOST(2)?

IMO is easier to have the multiple device for sibling (e.g. the device 
can advertise which dest CID its supports), but not for host.

>
>Then, we can get rid of the group concept.
>
>Big thanks for your constructive ideas :)

You're welcome :-)

Stefano

