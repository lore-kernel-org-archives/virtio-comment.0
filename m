Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9631917E6
	for <virtio-comment@lists.linux.dev>; Tue, 26 Nov 2024 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732635435; cv=none; b=vGNXwe0Q6knDG02Ct6VpvGHxWfFV4DSFzGSkEUv03lj5vIRc+clJYx+YfJDPmVfNPKVvLR5bKZBG0hxx18QzXB8dX7sCzBLZDPCbsomjv0+v7ub4kYZQdJIB+sfZREdJAx0JMVDBg3uXY/ZS29LWTPrnNN8IsUNuI7pubOdLAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732635435; c=relaxed/simple;
	bh=OWiOz/kTpwFpqYY+XJaLLKvYZYjBGh7FHMp0kv4Ydsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEEq27MSqSzkhObDuzsZpoutWbiMJD/pHncOIK0r5QIJHstr7Gx3DFAbhXC878uF3md/AxjKqznD92360PwZH3ZaiOmsSjba+vUPkffFeKt7IKLhaSEZKdrIFQYN49jwSjbixHkVvI6CGZGnppQJp5oISfigIUSrP4Due1JHGOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PmQpAe9+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PmQpAe9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732635432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toPOlKv27I8bokJX2JFCU5fCDz9pUzHujJ+x3kxjLs4=;
	b=PmQpAe9+R6fVX8lIUbAfEE7VJTb7734DoaK8RHWg524k/+ihrbYW16ibfKzzutf+KJHD5e
	AihgGnbt4BPwt52meB7FtabEZ8SkNC+/AIkpuPcNE8LKKoBqh3eFTbWWsbYXG0aEklNlWC
	Goxe3kojaZHQe+AREGDTk34pwrNJPvA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-tusKM-tDN4mccZ4JlX-1VA-1; Tue, 26 Nov 2024 10:37:11 -0500
X-MC-Unique: tusKM-tDN4mccZ4JlX-1VA-1
X-Mimecast-MFC-AGG-ID: tusKM-tDN4mccZ4JlX-1VA
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-46697645ceeso30593931cf.0
        for <virtio-comment@lists.linux.dev>; Tue, 26 Nov 2024 07:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732635430; x=1733240230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=toPOlKv27I8bokJX2JFCU5fCDz9pUzHujJ+x3kxjLs4=;
        b=C6Ar1HfU52JknWZG0cq6KvZ6aCtgbu+kXUuRhCllFsnoNeTf2+7sf0hjK9GTdtoLEn
         kJ0B0eRt3qlTZG7qU+Ec4cab8atHYqXCwf6q/UdV5IT1zMlJZizcqz2mkkPZWbvlhfB+
         1dH/3vyuWTvk55X/J3DwgirqGcWFuTQ4ijFzPbZoY0Pf8u8cDDoo3xorZ0Toti3US4P1
         HfY3QH3WJZiC5CIalmhAYu6pgrJ/F2Op+1kxOBrtt5XTgSkguoInorq1kSdrHt5TqJjE
         86RRf4o7BLS8k45rcTARiAl9cb9ThPwPOxyQ98UwyGq1BH10qjfn6Gie7hGxIJhjIzxJ
         0hjA==
X-Gm-Message-State: AOJu0YwOitnyzHbkgQQseu/Xru/BgCM7FyTX/pIMP3ogXVmvmgkn5JQp
	J6KXNFJbX63F9YXWvFWqU7RRRkniG+5e3jFikuj7eUdGLJdYA7eMCWUiLRaqC14sdEo5afc2oWK
	iqtEDWLYc+EOrgwdHM8cOJRDbtds6e0VxM7eHe6QyO0SgCBv0IWVkpgBquSwLUoZh
X-Gm-Gg: ASbGncvcXAx2AaCTLFKHof/eGI1X7HOH5qlh1p3X9pK+3GdBfJD28jFW4PnpkSrLtxK
	axtBEhdTOpiozJpWDuDT/jerYmQOjNR8hbdMFuLKhpKgAVvkgQj+sV6Qj1PZWaqzQ/QnPFd5Tj8
	MRYEK+Q7SgQ7QdnJiBaUSE8osMSY/np1uJTvGCirSm6JlCuS6wur3PO7fK4+W4sCqQKG7TG5VNI
	SlE9nHYWN1YJDNz/5Cke0HlxJ7Ro7IT7LkVarCZ2CLFEXtAuBmacAIPnt3Fyo3z3dAC9BlBw97M
X-Received: by 2002:a05:622a:190a:b0:460:ebb5:5fe5 with SMTP id d75a77b69052e-4653d535f30mr268761591cf.10.1732635430559;
        Tue, 26 Nov 2024 07:37:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsXDK3tFs8EFvLqDNcOJC4hJIMz+ehkbZEL5HNbYZRd1F3B8Wicpgld0rXoftdVwDIOuloxw==
X-Received: by 2002:a05:622a:190a:b0:460:ebb5:5fe5 with SMTP id d75a77b69052e-4653d535f30mr268761231cf.10.1732635430283;
        Tue, 26 Nov 2024 07:37:10 -0800 (PST)
Received: from [192.168.88.24] (146-241-94-87.dyn.eolo.it. [146.241.94.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c4924a0sm60051801cf.89.2024.11.26.07.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 07:37:09 -0800 (PST)
Message-ID: <8cd6acf6-278b-4cf5-8b88-789cd5f25652@redhat.com>
Date: Tue, 26 Nov 2024 16:37:06 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] virtio-net: define UDP tunnel checksum offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1731084277.git.pabeni@redhat.com>
 <4a81d0cac760abddfdeeb71da4c42ee0ba83cc4d.1731084277.git.pabeni@redhat.com>
 <CACGkMEtR62pqGA9fi3np7fmpexq6F1MAx3XD2s0bctKKSofrug@mail.gmail.com>
 <88fa80f1-d82a-49c8-b933-7621d24b15df@redhat.com>
 <CACGkMEshn+s75cRO-_AxpErMisQvewVoG7dr2cr5tCgiP5zamg@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEshn+s75cRO-_AxpErMisQvewVoG7dr2cr5tCgiP5zamg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ssivv62qnKiwHTEBI6vNpuFNp_msg9ur1E4mVkgelV8_1732635430
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/26/24 04:07, Jason Wang wrote:
> On Tue, Nov 26, 2024 at 12:44 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 11/25/24 04:41, Jason Wang wrote:
>>>> @@ -926,8 +1003,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>>  \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>>>>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>>>>    set: if so, device has validated the packet checksum.
>>>> -  In case of multiple encapsulated protocols, one level of checksums
>>>> -  has been validated.
>>>> +  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
>>>> +  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags},
>>>> +  both the outer UDP checksum and the inner transport checksum
>>>> +  have been validated, otherwise only one level of checksums (the outer one
>>>> +  in case of tunnels) has been validated.
>>>
>>> Not a must but I'd suggest making this an independent patch. (I meant
>>> the " (the outer one in case of tunnels) has been validated." part).
>>>
>>> Or after some thought, maybe it's just better to leave it as is. This
>>> means let the device choose which part has been validated:
>>>
>>> 1) more flexibility that it allows the device to choose the level it
>>> can do the validation
>>> 2) no need to worry about the migration compatibility
>>>
>>> But it would
>>>
>>> 1) complicate the implementation of both the device and driver
>>
>> Note that offloading the inner checksum only would be quite useless, as
>> AFAIK no OS as support for such a thing on RX.
> 
> Yes it is, a small concern is that it might be too late to do such
> clarification. Rethink this, I think it would be still better to have
> a clarification like this.

I'm sorry, but I'm unsure what exactly is the clarification you mention
above.

Do you mean moving """(the outer one in case of tunnels)""" into a
separate patch?

I'll do that in next revision.

Thanks!

Paolo

