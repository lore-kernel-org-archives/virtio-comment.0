Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068AD136331
	for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729680103; cv=none; b=D9zbltTo4rCvLHThrQx1qXBf9f6zgL5T2M0rbsMDWlGaNfcSGaOQ9Kzc9RvyVpvPn4sZSMEgsuP7AtbDB4xeDIMdDsLRNbqCef8nP5N714IT1Tk4YmxKYlgtu/8qBIVxiJN8YSDC5dMVV7+1qoZl361LTYEEsn8XSJIBmU8MY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729680103; c=relaxed/simple;
	bh=57547TybXhLqhr2izpqcQ6Yh7OH4phDEHXzwVw1TJrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eMR9xTAkNE+vac9njWwMXGCt85QJNJcYyVJRdkNcqwFnuA6UE2mzDmMb8b7mFURrezkuWY84PCcMjtyVbfpKnEN6zKK9601vqhHs6TIdqa9r9HVRvdA/jGprFEJ3drjKeXmg+l+3yIn3nO/kM/uXtT8pFDGU7CSF36WqvbX29AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CeTho9KO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CeTho9KO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729680101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qcOQ8dPE8SPaSLzL5+AX0ixDzhq6hJfQkOqiIuTIvSE=;
	b=CeTho9KOfu173mCTNemh1Tl1xKbrhh/98n3PppOxi0BlUrJN8yR4RyyWYpHqQa0DkMXpkH
	qK2nVc0oVfy8qCmLoNzi81e/c8YQf7Asi5v9HJlO/2TZf3eHzkSmdREnGJeKuLRB8t7M1X
	fy+TG7pY1RhHe5/bY9u3r7mDzBvsxsE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-RT0zztZfOT2d5jfAw7pW_A-1; Wed, 23 Oct 2024 06:41:39 -0400
X-MC-Unique: RT0zztZfOT2d5jfAw7pW_A-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6cbec7fbf1cso97712986d6.1
        for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 03:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729680099; x=1730284899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcOQ8dPE8SPaSLzL5+AX0ixDzhq6hJfQkOqiIuTIvSE=;
        b=rGAfD/TkkEOEbesCCjMqU29nqFh4bzZX6y+tD04q5gMf/U3xFtM5NI57Ixqnw9MizB
         1tWcTe+NVbAgGmwkE0eAqN3B5+DAfwuK/01Yv7ca1rKh+YIRVQRYX83ccAV0szVF9EKy
         LDCSMoOpqL9p7bgpFxC6EDwAvdkcp3E38fVhhLM4UcGW/hcH3+ZeEs49G0OvR7m71MNi
         laNkQRDVuI7xWU5wunAhG//HkWXrV/ulIj30jSGb1+BZg6T0+jQH27A+QuOUQbG5lPCz
         TnwGozNQnOQEOiRjXXJUJOF6YL4nMpQGkFBIu4mUs8kPmKI5XdXEk45WHqmdf0oUNgqt
         CCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+PCE0ihhAgEbyx78aS1zqYTTVS3Kp9YwrIMKXJ1qFxsynJtLRgyPn4IqZsBVbRAb8K3ZeSHExFbubJCwqnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYyKbJIAX5pD6ZXcDVNjXCQTBBBbVohoqb/PxpqxQQhHG3E449
	nchOAA0noujNoNSWpPIIUQiq8U1kBqEedzGQ62HxQvNGuNbkfP4Blx31hyPvND6noKd33LBoG4D
	zD60r6rE9rThusWiS/gS+rceLZMM7O7KE+3kbQmTsapPRhDFGoFGxr++OT5az7IfZ
X-Received: by 2002:a05:6214:390a:b0:6cb:e76b:d90 with SMTP id 6a1803df08f44-6ce3417a265mr33778776d6.13.1729680099406;
        Wed, 23 Oct 2024 03:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMr7A7/7aj+apYOy4dED9yjHZFkebhLCPuPjXfxtd+dBW9OyBg5LUkRC/83jxFE2Hn/Hj7VA==
X-Received: by 2002:a05:6214:390a:b0:6cb:e76b:d90 with SMTP id 6a1803df08f44-6ce3417a265mr33778576d6.13.1729680098978;
        Wed, 23 Oct 2024 03:41:38 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-231.retail.telecomitalia.it. [79.46.200.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce008acd29sm38191336d6.23.2024.10.23.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 03:41:38 -0700 (PDT)
Date: Wed, 23 Oct 2024 12:41:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	virtio-comment@lists.linux.dev
Subject: Re: [RESEND PATCH v4] virtio-vsock: Add support for multi devices
Message-ID: <aivsjdideukviwqjitriv2ilarkdiuq4uodxlmlwukpl7mdiov@ntpa7txyiuz2>
References: <wo2m5mkxpjx4flwbbyutlhpcdsnvwxn4b73b2fmyrconhfscx6@n45dc4sepcp5>
 <20241020083611.598017-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241020083611.598017-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sun, Oct 20, 2024 at 04:36:11PM +0800, Xuewei Niu wrote:
>> On Wed, Oct 16, 2024 at 05:53:54PM +0800, Xuewei Niu wrote:

[...]

>> >> >> >
>> >> >> >> >+
>> >> >> >> >+\devicenormative{\subsubsection}{Device configuration layout}{Device
>> >> >> >> >Types / Socket Device / Device configuration layout}
>> >> >> >> >+
>> >> >> >> >+The \field{index}es don't have to be continuous. For instance, three
>> >> >> >> >+devices with \field{index} 1, 2 and 5 respectively are acceptable.
>> >> >> >> >+
>> >> >> >> >+The \field{index}es cannot have conflicts. For instance, three devices with
>> >> >> >> >+\field{index} 1, 1 and 5 respectively are prohibited.
>> >> >> >>
>> >> >> >> A normative section should use SHOULD, MAY, MUST. Please take a look at
>> >> >> >> the other normative sections.
>> >> >> >>
>> >> >> >> Should we add a line here in the normative section to specify that the
>> >> >> >> driver must use the device with the lowest index as the default?
>> >> >> >
>> >> >> >I will update it as follows in v5.
>> >> >> >
>> >> >> >```
>> >> >> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> >> >> >
>> >> >> >The device MAY make \field{index}es discontinuous.
>> >> >> >
>> >> >> >The device MUST use a different \field{index}.
>> >> >>
>> >> >> I think in both we need to talk about multiple devices, not the single
>> >> >> device.
>> >> >
>> >> >Yes, I think I am talking about multiple devices. I'd like to point out that the
>> >> >indexes must be unique but could be discontinuous.
>> >> >
>> >> >What about the following?
>> >> >
>> >> >```
>> >> >\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> >> >
>> >> >The device MUST offer a unique \field{index}. The \field{index}es among all
>> >> >devices MAY be discontinuous.
>> >> >```
>> >>
>> >> I think we should emphasize that this is only true when
>> >> VIRTIO_VSOCK_F_MULTI_DEVICES is negotiated. Also we should better say
>> >> what we mean by unique, i.e., that index can be assigned to one device
>> >> when there are more than one.
>> >>
>> >> Thanks,
>> >> Stefano
>> >
>> >I updated it with emphasizing the condition of VIRTIO_VSOCK_F_MULTI_DEVICES
>> >and the meaning of "unique", as follows:
>> >
>> >```
>> >The device MUST offer an \field{index}, which MUST NOT be same with the
>> >\field{index} of other devices, when VIRTIO_VSOCK_F_MULTI_DEVICES is
>> >negotiated.
>>
>> I'd put the condition first: When VIRTIO_VSOCK_F_MULTI_DEVICES is
>> negotiated ...
>
>Will do.
>
>> Rereading these sentences, though, a doubt occurred to me:
>>
>> What if we have multiple devices attached, but some of them have
>> VIRTIO_VSOCK_F_MULTI_DEVICES and some don't?
>>
>> I think we should cover this in the spec, but I'm not sure how to handle
>> it. Maybe in this case, since without the feature we don't support,
>> devices that don't have VIRTIO_VSOCK_F_MULTI_DEVICES may be ignored, any
>> other ideas?
>
>Yeah, nice catch here!
>
>It would depend on the frist device:

The problem with depending everything on the first device is that we 
support hot-plug and hot-unplug, so there might be a case that we don't 
know which device is the first.

>
>1. The first device has negotiated VIRTIO_VSOCK_F_MULTI_DEVICES. Then,
>ingore the following devices without VIRTIO_VSOCK_F_MULTI_DEVICES.
>2. The first device has not negotiated VIRTIO_VSOCK_F_MULTI_DEVICES. Then,
>we should consider that the multi-devices feature is disabled, and ignore
>any devices that follow.

Yeah, but I wouldn't relate to the first device, something like this (to 
be reworked better)

- if the driver has already registered a device that doesn't have 
   negotiated VIRTIO_VSOCK_F_MULTI_DEVICES, then it can ignore all 
   subsequent devices

- if the driver has already registered one or more devices by 
   negotiating VIRTIO_VSOCK_F_MULTI_DEVICES, then it should accept other 
   devices only if they expose VIRTIO_VSOCK_F_MULTI_DEVICES

>
>I don't know if we can unregister a device after it has been registered. If
>yes, when a device with the feature enabled comes, for case 2, we could
>unregister the first device and ignore devices without
>VIRTIO_VSOCK_F_MULTI_DEVICES.

In that case I think we should ignore the new device, since we don't 
know how to handle the old one, and un-register it under the hood is not 
that nice.

So in the end if a user wants to use multiple vsock devices, they all 
have to negotiate VIRTIO_VSOCK_F_MULTI_DEVICES..

Thanks,
Stefano

