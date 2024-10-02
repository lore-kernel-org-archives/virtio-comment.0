Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6E41420D0
	for <virtio-comment@lists.linux.dev>; Wed,  2 Oct 2024 08:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858123; cv=none; b=lwbYyLh8Rm4aeP2BjC15nm2WVPtCyRo2AzIzHQUnnbJiTJWqZ+ZoS6Pp4SA1ljYtswYgzp7aw+Bwe8gIL/yJf8lW9+zYJj30Z+/w1Iqvl9en67VLDJ+jRmgAJrvIEjDNZsSCmysqKRhNUPtqdhpNRQdBkb1F23pFsSC8pBF9NbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858123; c=relaxed/simple;
	bh=doeQk2gcAKbJ9FbyZXsP2Ok4Ql3s8xF6cKMbIetXo9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEogWlInXZ8N4mcFdkBl6lkndoDA5ug5MwhJlY2F68f5PU8GvwxZHZ2s45Owr27AlqT9nVlsQvI1kdkFzhPH6p4emd6+pAHW0bPpit9EMR50TNkUogkHmpmSYovM7o91Z5CiYt/BtNPLdtI5X8H4vRWW8MwXB+RCIE9Z08W3QBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SM+tWJHi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SM+tWJHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727858119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xz+pF39Am+oGLwRa9c0d5efTLegxbdNI9J9OxehIQgY=;
	b=SM+tWJHi3bwk36Kfv1gQwDJ9gOV9dz/a7dJpgnFIPuusAg9n9h08O5fxNfvK+IZDo6kT6T
	aoVDrUGyvxHQReJ670w59edaAXZReSx9FndjDMIA02DpnZekQSbBzPqSWjT+qeu+xIaBXX
	IHtLSu144+LLwtX/ylm2EC9rSAlgRT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-_YZsPZMSMUyieF4Uxk8ggg-1; Wed, 02 Oct 2024 04:35:18 -0400
X-MC-Unique: _YZsPZMSMUyieF4Uxk8ggg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42ca8037d9aso42201735e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 02 Oct 2024 01:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727858117; x=1728462917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz+pF39Am+oGLwRa9c0d5efTLegxbdNI9J9OxehIQgY=;
        b=ELjCRP5RzRmpWp/8MWZdiRV5LAzq7hbc4n22IBbgTZ/GmpQuc9BC/yKJDFK72uHOtZ
         PNS/kOMEXuarRDbesV+O7NIT/Ux1kgnvicexF/2bpMaRAeoQCGaLr6G/GUzahcSZ+mim
         lTkx+TqCT2j94dfjWAeFbiWKhiuOjnig2sT4HDSPVQQD2Ce+S4zxOpdaPR+ltGeDdk0E
         ecy90KBccJoHMAHKkTLgp7NiFo5Pl4VG4l0wnBgIDKSXdfCWTLSnvRYvAHUfamgNxeQW
         QYeL3Cg/2MmAN3DTUv3QzaCSnFeciB5WSFfvzcA1i9kV4r2yqGr5HHYPpRiOvBBh/Ub0
         PVAA==
X-Forwarded-Encrypted: i=1; AJvYcCULDFp97mfNcHjbXF9BCkTLM0wpHtjyvQGUNlrTwFWr1p6QpkwcxNcYHB9H9lrhwqXE0WdHLRo9onYTSi+itg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhLVt4IcUgO3tdEidhxnNx8Ea6hmuJophNv77yJwn/oORFs6DT
	hJtrNQTfCYpR3MNdQBIFM/aMlcaCwgSKGjdGYGOQ5Wwixi35syHHvlXAHHZYsXlriBOte/0VGi7
	6mIP0bJBc3Ib4/dsYGK1x10oPiTlkYErwz4v8hKUsp3ymmSR4pwBlMNKl3lepVr04
X-Received: by 2002:a05:600c:1897:b0:42c:b2fa:1c15 with SMTP id 5b1f17b1804b1-42f77d2fbdemr14069425e9.15.1727858117316;
        Wed, 02 Oct 2024 01:35:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUVDfiYImrAn3q8kLmJd8HHURxTITucWy4lQe10PidhFKV6T+tH+SgXfgqD1hMk37/w6vVCg==
X-Received: by 2002:a05:600c:1897:b0:42c:b2fa:1c15 with SMTP id 5b1f17b1804b1-42f77d2fbdemr14069245e9.15.1727858116887;
        Wed, 02 Oct 2024 01:35:16 -0700 (PDT)
Received: from [192.168.88.248] (146-241-47-72.dyn.eolo.it. [146.241.47.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a00a266sm12174265e9.42.2024.10.02.01.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 01:35:16 -0700 (PDT)
Message-ID: <d2c437a4-1e84-46c6-a51b-77e97ed8e15b@redhat.com>
Date: Wed, 2 Oct 2024 10:35:14 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
References: <cover.1725463935.git.pabeni@redhat.com>
 <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
 <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com>
 <1ca3a523-87d1-4450-a0bb-980b1c8109c4@redhat.com>
 <CA+FuTSfdXbMsFqEDXRwoKZUwaRJLHi6H-BZjEF00-1bWqXvEdQ@mail.gmail.com>
 <891cebdd-a417-4d16-b01c-197bc0b5afdc@redhat.com>
 <CA+FuTSdTjtyjCJoZX4YHSeifL+BH=zD_ezLUL30=aqeJiDE+iw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSdTjtyjCJoZX4YHSeifL+BH=zD_ezLUL30=aqeJiDE+iw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/24 21:15, Willem de Bruijn wrote:
> On Tue, Oct 1, 2024 at 10:02 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 10/1/24 15:09, Willem de Bruijn wrote:
>>> On Mon, Sep 30, 2024 at 3:36 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>>> On 9/9/24 10:05, Paolo Abeni wrote:
>>>> I'm wondering if we could revisit the spec change requiring that both
>>>> the driver and the device, for GSO over UDP tunnel packets only, will
>>>> fill the csum_start field when either the NEEDS_CSUM or the DATA_VALID
>>>> bits are set.
>>>
>>> This SGTM.
>>>
>>>> Equivalently, for GSO over UDP tunnel packets only, the
>>>> driver and the device, to specify CHECKSUM_UNNECESSARY packets, could
>>>> set both the NEEDS_CSUM and DATA_VALID, with the latter flag 'taking
>>>> precedence' WRT the actual checksum type.
>>>
>>> Why do both need to be set to signal CHECKSUM_UNNECESSARY, rather
>>> than only DATA_VALID?
>>
>> I think it's mostly a matter of preferences, and 'allowed delta' WRT to
>> the existing offload.
>>
>> AFAICS, technically the plain GSO spec don't mandate that NEEDS_CSUM and
>> DATA_VALID as mutually exclusive. Instead the spec require the
>> NEEDS_CSUM flag to use csum_* fields: the first option would create a
>> more significant difference WRT plain GSO.
> 
> True. The existing API is very permissive.
> 
> As you probably know, I'm strongly in favor of being more strict in
> new additions, to avoid allowing weird unexpected packets that we then
> have to detect and work around later.
> 
>  From that PoV, explicitly specifying whether the bits are mutually
> exclusive or, if not, what having both sets means, would be great.
> Even if only for the new tunnel case, as we cannot do it
> retroactively.

I must admit it's not clear to me if the above is a sort of endorsement 
for both options, assuming each of them will be strict about the flags 
definition.

If even the 2nd option is ok, I would go with that, as it sounds 
preferable to me for the mentioned reasons.

>>   From an implementation PoV, the 2nd option (both NEEDS_CSUM and
>> NEEDS_CSUM) would allow for simpler integration/reuse of the existing
>> code: the UDP tunnel GSO 'to_skb()' helper could directly call the plain
>> GSO one and eventually later just set CHECKSUM_UNNECESSARY as needed.
> 
> I don't entirely follow. But that's probably fine at this point.

Let me try to make an example.

In order to reuse the existing code/avoid implementing multiple times 
access and parsing of the csum_start/csum_offset fields, with opt 1, in 
virtio_net_hdr_tnl_to_skb() I would need some hack alike:
	
	// this is an UDP GSO packet, tnl fields already
	// parsed/validated
	if (!(hdr->flags & VIRTIO_NET_F_GUEST_CSUM)) {
		clear_guest_csum_bit = true;
		hdr->flags |= VIRTIO_NET_F_GUEST_CSUM;
	}
	
	ret = virtio_net_hdr_to_skb(skb, hdr, little_endian);
	if (clear_guest_csum_bit)
		hdr->flags &= ~VIRTIO_NET_F_GUEST_CSUM;
	if (ret)
		return ret;

with option 2, the above chunk would be:

	// Incidentally this test is already present in the PoC code
	// and it's a bug WRT
	// v8 virtio-net: define UDP tunnel checksum offload feature
	if (!(hdr->flags & VIRTIO_NET_F_GUEST_CSUM))
		return -EINVAL;

	ret = virtio_net_hdr_to_skb(skb, hdr, little_endian);
	if (ret)
		return ret;

I think the implementation would be cleaner/simpler, and the validation 
stricter.

AFAICS, in both cases, when VIRTIO_NET_F_DATA_VALID is set, the 
_tnl_to_skb() helper will have to inner csum field, and eventually the 
outer one, if not zero, to the L4 pseudohdr csum. Basically 
VIRTIO_NET_F_DATA_VALID with GSO says that csum is validated, but the 
pseudo hdr csum is not provided.

Thanks,

Paolo

