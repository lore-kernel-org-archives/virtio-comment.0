Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C4D139CFE
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277943; cv=none; b=JCTDwNZANHoLJA0NEV3aKyU9ZeXnb+P/beZA4aV15Ew9VXhNPc/BSUKLplFuG9fPJX67QFa+C5GDUiB4zfUnfaPoOOzkxDvhOkhrU5zoS3bfa51YnfY/AmBERiWl4uwc1ymIaaCkvH71dB9CXOBGoscltDkYAxGJ1ZDAjXBUqWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277943; c=relaxed/simple;
	bh=BgXrvAOfWlU7dXgtd8XyGydin71znpIstUOFfcpGbNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BPHrbE2fguWyCwviV5z0esDGtM6I6Sec25lq76Zk5/iNtEEe/CPl7qkhOIYiU4MdwMxOf2TvBS9BzsgiG918dwbQxFHN1YA/5nluGmSrnmjNOl6599bHPoJH+8hFbMdAjjOnwHtKX8Bmu0IG9TjB1IiyGlKrKkVsgzpvcmBfQpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RF1f9j0J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RF1f9j0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718277940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fvXAf5Cq5GdG/uU93rPx8Jh/FDikn8/FjoyiEzHyWss=;
	b=RF1f9j0JlrxMQuQty/rsYHbBE0/Eq+LYpzBsy8z8YDPQenqmWiSbYq3N88UqY4OlXgyDYw
	z342wzwIIL5nB9oD5HSXGBZN6cT6XyzKwUYWaegDQ267yJ9jP+9hOoTz2wNJa0MiSz+nak
	fsHGwDdSCLKfmLmJRMSMYLHjSRmZ8rk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-e94Zyi4MPC2xgcHeg_WeUw-1; Thu, 13 Jun 2024 07:25:38 -0400
X-MC-Unique: e94Zyi4MPC2xgcHeg_WeUw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-57ca75cc79cso865794a12.0
        for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 04:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718277937; x=1718882737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvXAf5Cq5GdG/uU93rPx8Jh/FDikn8/FjoyiEzHyWss=;
        b=Qtu5OtKPTK/xUbqVNZRCaNgHq2jE/tJSLtFQ2DY6Y1Q+GFooL5i363149ax4Wz4K/w
         SkNl1f4oBT0bkEdmWajx6PRjH+0iy8m89C0Y1fOVTOE40K5rdc6dsnDQ0qtSUQ/uIujv
         UKBmTJTrR4t9pIij/Vo1zAnG+yOCPwTsBcOpIwFY0aF7DAW7AK2l8y+BBDhfKJfctCu8
         4hYBY81BSh+LBH+iKcuMep2Ho9kJdA1DwhKGVoo9OlxbJstDQYV3T9ysSOkl1tdA2NOu
         PmTZP0EmTN4jIUA/u2exUTAz4CjbL3S1k+ywAp5ZPC+d1oxP4XZKlrLPx9H7EkGT6oXI
         nHmg==
X-Forwarded-Encrypted: i=1; AJvYcCUDTqXKC328ourpMSGVXKq+Of5ZAOFMRE7DCymCLDjKYzfrrrA8pKLc3UGqXSWcLzfydK2siAmbUF3PGGSeAmqrqJoU4shFB4e5BSAB5FY=
X-Gm-Message-State: AOJu0YwjMeyAwZF6kjevRb0Ip5pHy3HWqnzJrANVRYilgMy3r/Snv48F
	IhwNSh3L5G10hA6u1AHv8EDtK4wf+4L8KDmCXSvwiuvXPlBnhL263t6m4CZ3/AwsJ0fK2zZy42I
	Sh3NytLLGtrth2P2qsvii3DaI+OQv4XTUwAJmjKOc6A9avCUOtkeJJ9b+9xzLgrdu
X-Received: by 2002:aa7:cf0c:0:b0:57c:b976:9223 with SMTP id 4fb4d7f45d1cf-57cb97692b2mr914225a12.16.1718277937261;
        Thu, 13 Jun 2024 04:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOCjYvd4B2aoC7i5kQcsfEYkKZGIzlkPgj2bXB5nklWczkY+j3NF6KoUpYSOUvwwHL7PocSg==
X-Received: by 2002:aa7:cf0c:0:b0:57c:b976:9223 with SMTP id 4fb4d7f45d1cf-57cb97692b2mr914207a12.16.1718277936895;
        Thu, 13 Jun 2024 04:25:36 -0700 (PDT)
Received: from sgarzare-redhat ([147.229.117.1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb741e906sm786338a12.59.2024.06.13.04.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 04:25:36 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:25:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, hi@alyssa.is, mst@redhat.com, 
	niuxuewei.nxw@antgroup.com, virtio-comment@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] virtio-vsock: Extend the spec with an `order`
Message-ID: <4vi4tpunqv4lx3odqgjxcb3lgu2nobqarmsugt3i2s7nhonjrf@2kjhzmlcyibj>
References: <oxfm5jjjim3tv6q22o4mr2oidz4yljjs4lmadcccfbkdlrudrp@fo7wkwb2p3up>
 <20240613040136.2497504-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240613040136.2497504-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Jun 13, 2024 at 12:01:36PM GMT, Xuewei Niu wrote:
>> >> >Add a new field, named `order`, to the `virtio_vsock_config`.
>> >> >
>> >> >There are two questions about the field that are valuable to discuss:
>> >> >
>> >> >(1) Do we really need the `order` instead of a `default_device`?
>> >> >
>> >> >IMHO, the answer is yes.
>> >> >
>> >> >The `order` is more generic than the `default_device`. The device with the
>> >> >lowest order is the default device. Moreover, the `order` field determines
>> >> >the sequence of devices in the list. The device list is the same every time
>> >> >the system starts.
>> >> >
>> >> >The device with lower order means it is more important. Also, it means it
>> >> >has more likely to be used. Those devices are placed in the front of the
>> >> >list for performance purposes.
>> >>
>> >> This is an implementation details IMHO.
>> >>
>> >> BTW perhaps the biggest point in favor of `order` IMHO is the fact that
>> >> this works very well with hotplung/hotunplug, since if we add at 
>> >> runtime
>> >> a device that is to become the default, we don't need to change the
>> >> configuration of the previous device.
>> >
>> >I'll rework on this. BTW, shall I add this to the document? Currently, they
>> >only exist on the commit message.
>>
>> Maybe yes, what about adding a new paragraph to describe the
>> multi-device support?
>
>I'd like to add some descriptor after 
>"\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple 
>devices.":
>
>\begin{description}
>\item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>\item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>\item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not 
>implied.
>\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple 
>devices.
>It allows to enable multiple backends, e.g. virtio-vsock, vhost-vsock, 
>etc.

I don't think we should talk about backends here. We never defined them 
in the spec, and I think is out of the scope. They are just virtio-vsock 
device implementation, so we should just refer them as "devices".

>The isolation of virtqueues benefits from this feature.

Let's describe just the feature and how it works.
If we don't want to add a new section, maybe we can describe it a bit in 
the Device Initialization or Device Operation.

Also, maybe we should merge the 2 patches in a single patch, since 
VIRTIO_VSOCK_F_MULTI_DEVICES is useless without the new field in the 
config space.

WDYT?

Thanks,
Stefano

