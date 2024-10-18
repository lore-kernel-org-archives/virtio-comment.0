Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DCB2010E7
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246238; cv=none; b=Zy8uFCq/+CBUEn9dok8vZ3WVF9QMFwIikO3Jt+iUb9MY+xvqNXRuzHuTlgf8xBHvaJ/afZMxqlavgY35sQ/5mZd0piBYfa+dCcnVqIKL07lr4MJRv0/RqgPz+MJ/8RQflEMtoL1IipcvlNODHUIwx+mpueiM9koe0yuwBlT7euE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246238; c=relaxed/simple;
	bh=hKprVtVjgfoLKcon31FxVOlFqfm5XyrwXhEjPykbsAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTUWR4cXc04UHptJU83uOB5oTUjGRGI59ZY2Cb6ins4EqNlXntVGyjRJgg0hq1jxetmDy8pjoryZmBxamrn6bDDZSW4qzbzVmkFS1M2SjX3iEvnlGAcwuNia2pAJdW8RWEZsg89xYFEgevrq6B2SCcEnfpvICvp7cWTdPblOXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MF9+/7bO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MF9+/7bO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729246235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDCuHPRl8esZnd6d7tnThJHs80+5gWYra4eVXj4OXLA=;
	b=MF9+/7bOr5R7HDjhHMrt8tWDnrMJSFG9XNL9Ju6DLF+W++MtYIGmaNICf4/pYs7LR+zEg3
	3245B9ZK25xUWMSQh2Bx85u5v1hlwBNcqZphth35hZE66Jxh6vU12thM7a1YwIYXlG5z1e
	uZyvOZzc77gmkZU4FWAnUmcYDYwhW9A=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-JkbYXwguNfqY-4R7ZfHk8Q-1; Fri, 18 Oct 2024 06:10:33 -0400
X-MC-Unique: JkbYXwguNfqY-4R7ZfHk8Q-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-539eaa0561bso1926719e87.0
        for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 03:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729246232; x=1729851032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDCuHPRl8esZnd6d7tnThJHs80+5gWYra4eVXj4OXLA=;
        b=e6nAkhjmKGCrELWP4hlPyPOCgw0JQbpu5HDh8xYWUX50KLXKDHVwxFObklMd7s6UGL
         mrap70zThvtfEknxu5eytLmRS1AXXUImbHxTs2bJE1AoxD17GGzp1+FjNuJUMaDktix9
         bDwm8IvgD4cdnzEjZCqWX8NXDPNfUAsgCo7Kcuncxw0Q/PNEQLBoKIR8zuwjxFJy6frY
         +zLvNQ5R5C1GDWJaB46396kl5miSuPvuqGFYejvayyZs8SRoFrSHqZD+5ePM47lS22+H
         CsRc/M5uToVUUlSBcd1wwRb/QvHMtKpvdrB7HVy8gMiXKWk8nn9fLB09iTapEg48PgCy
         WW0Q==
X-Gm-Message-State: AOJu0Yxsuy1Y+oZrYUh+DqRlRleAesjI984DOf6jUsCE9BJXR68moyuC
	SXEjLg7srztLOEK2hB7brzEEArqDxKithCs/+DqB8+bUWJGPlndlBQ10Gl5ILIj7lYfHxSRDgwK
	NZQ7YgP/xDiVPpTS+p/U0HesX+A0lHSVmNmWRI18a4rAjT8XXfd9XzknQWs8vkopW
X-Received: by 2002:a05:6512:12c3:b0:539:d870:9a51 with SMTP id 2adb3069b0e04-53a154f8ebbmr1155139e87.48.1729246231991;
        Fri, 18 Oct 2024 03:10:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZguYg31/WUr0oVR6NodbLgfIs7OfPkmKb7qTxLv5hqWd+xqqLovSoUYCr3e0MiTx613e7kA==
X-Received: by 2002:a05:6512:12c3:b0:539:d870:9a51 with SMTP id 2adb3069b0e04-53a154f8ebbmr1155053e87.48.1729246230158;
        Fri, 18 Oct 2024 03:10:30 -0700 (PDT)
Received: from [192.168.88.248] (146-241-7-49.dyn.eolo.it. [146.241.7.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ac379esm73786666b.47.2024.10.18.03.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 03:10:29 -0700 (PDT)
Message-ID: <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
Date: Fri, 18 Oct 2024 12:10:28 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com>
 <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
 <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com>
 <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com>
 <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/18/24 06:26, Jason Wang wrote:
> On Thu, Oct 17, 2024 at 11:34 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> i.e. all the checks in
>>
>> https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/virtio_net.h#L97
>> ..L112
>>
>> will be meaningless in such scenario and the GSO over UDP tunnel helper
>> code must replicate them with the correct offsets.
> 
> I don't understand here. It works like a charm for non GSO UDP tunnel,
> anything that makes it can't work for GSO?

I we chose to use csum_start for the outer header, for GSO over UDP 
tunnel packets:

1) the 'all headers in linear part' check:

https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_net.h#L111

and all the need preeceeding algebra will be useless, as we will have 
later to do the same for inner header.

2) the 'thlen' as computed by the previous switch statement:

https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_net.h#L62

will be incorrect if we use csum_start to point the outer header, as 
VIRTIO_NET_HDR_GSO_{TCPV{4,6},UDP} refers to the inner header.

3) the csum_start/csum_offset assignment performed by:

https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_net.h#L104

will yeld the wrong values - as they should point to the inner header 
for GSO over UDP tunnel packets.

4) the gso_size validation checks done under the if statement:

https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_net.h#L156

will be incorrect - we need to account for the inner

Basically all actions and checks performed by virtio_net_hdr_to_skb() 
will be wrong or irrelevant.

Instead, by using the virtio_net_hdr csum_start for the inner header, 
all the above mentioned checks are be correct and meaningful.

I wrote a longer reply, addressing every later point, but I fear it 
would distract from the main point using csum_offset for the outer is a 
poor and inconsistent choice.

Cheers,

Paolo

p.s. I think you got scared by the many checks that the tnl helpers 
implementation carry: such helpers are much more strict than the non tnl 
ones to avoid injecting into the stack packets with bad layout. A 
functional PoC could be implemented without most of them, but I think we 
actually want those additional checks no matter what layout we use for 
the virtio_net_hdr.

