Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8FA41
	for <virtio-comment@lists.linux.dev>; Tue, 26 Nov 2024 15:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732635058; cv=none; b=DY7Xrm/iEblxNMmZ8l4jXC4jvTKFUj0y+XTEOKxfjmcTYWO0hvXbWm6uwcP/CY6Va8UWAX7VbuA/oNKjAAtjOuo1NGr/h3tPXBx1YjonjBJd9HHGPeEC+ORZbDXCWD5+Q605TaBwI3M1op5RtpUhGH9OY3r/BJyFBMRIYpNXAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732635058; c=relaxed/simple;
	bh=qo+IEP5k64RcMcnAvsK2o7lFPQfqm70itcCJ949VBzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D583WRO3iwKafnxWUsaktZCpTo0I40kncUKiID3n66VTpvoVzVLrNDzYgnZ0ji7FrnNHI5bOQlZFbBg/ZwA+LKKPRRGKMXS1ipPz6V1OoxJiNyTlyfq5XONyDzxUwWkXL4zNhU5k5JZ3iWUAN0DhNDHENks0CD3010WdflRFoT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qrks/ybG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qrks/ybG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732635055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glyWHN/5j+D+3QSTXN/Pa0EXNIoZmqpWXbRW99gacuw=;
	b=Qrks/ybG1+KKxxoA1NXNqzwu6fxxI8HoPZooZKMaJFd+4RiAM8kahYitK9/ynwl9IAnsf8
	4aJa3WRpgQM4jKoIqUGyfOowFshvAO/MRsYurbUDqjLSuH5zSD8oZGOEIdd5w7s8WLqVZc
	sUM7ltYJ5DxqFctFFbx287gIROkGPX4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-6EsCR-VWMhq3HIMjZMSSaQ-1; Tue, 26 Nov 2024 10:30:53 -0500
X-MC-Unique: 6EsCR-VWMhq3HIMjZMSSaQ-1
X-Mimecast-MFC-AGG-ID: 6EsCR-VWMhq3HIMjZMSSaQ
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b66eab7771so221105785a.1
        for <virtio-comment@lists.linux.dev>; Tue, 26 Nov 2024 07:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732635053; x=1733239853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=glyWHN/5j+D+3QSTXN/Pa0EXNIoZmqpWXbRW99gacuw=;
        b=eDoGww3JaQ9Pwq1YayREpsYc5cBIWAOuaUD4eTjHgORfRUXEW9bbm6j+Gah6Yp1xd7
         26n8DwOlPfxR20WLCL+fqZGFqzwe9x/6i7T8dtoscgszIBMXeNqI+F/Rb68pQ3km4Dpn
         FSVz32HshN5H1KbDdKJFI2mGfkA89FQ2X+j8m4M3CzK9mPvBAXz2KXuLwRieagGbU/iF
         NH0CEHDlGo7HYmJQnBgafUDT3hTeTPBXXOC5WYzBIQQcD/4xRQs515N1kxaCixqEaTSy
         pamGWabBtA9EzvIhI07FVhFEDD179ZCNrBRA6LIa1pSG/J8p2irHA8PQp0KrdcNNdqK5
         FBMg==
X-Gm-Message-State: AOJu0YzhlhYHWWWVCQTUUSeBIx5OIkLdIm4m/Re8EhqPh3581tHwIrU+
	G8/aLLCRVBhI7UVlnDvBVqSdwfIlfIV6fc8YeLOJU/WeHqhbMpl2yf8Lefa1pdFIlqyhpwj9ZXx
	KfssqJ4KQyp0SuGeqeeBdpyFM2tgXHEijhoc2/bEkB22nuF3bxsc/HdyaewE3v76O
X-Gm-Gg: ASbGncuZSMk0trNQJ97pcGBazDxkTGQ3/sF1bPApEdYrZ2syaRA/Ua8KzcvyLB+IiWb
	xM7lUtuAoUHclwQaUu8BWj2y4aDVFdKgWUPyrB8G9P8BvggNFY0/UY8kkZVGevT15Cf5Vt5kxuz
	qzygDaN7OamkLQ/0GmigwSRYiX0vSmYz2dyjmwaCS8VtXDmHzPXgMecxLLfZxQnRZKC8s8SLpsY
	GYs9/lC0QgphmCc3Te17Prmwh+z71/YpFx60bJjwHrNGX44R9mWGmQb8zAsw510luonYtM45HLV
X-Received: by 2002:a05:620a:319b:b0:7af:cf4d:b1e6 with SMTP id af79cd13be357-7b514511023mr2279573585a.18.1732635052691;
        Tue, 26 Nov 2024 07:30:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPODTxUQU6X3KdDrJvOXbJnLDM9N1r/yPiXLpVrPylE74paJobMAwOCZXPpkLiMjWveyzC9g==
X-Received: by 2002:a05:620a:319b:b0:7af:cf4d:b1e6 with SMTP id af79cd13be357-7b514511023mr2279570085a.18.1732635052274;
        Tue, 26 Nov 2024 07:30:52 -0800 (PST)
Received: from [192.168.88.24] (146-241-94-87.dyn.eolo.it. [146.241.94.87])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b66d4ec941sm203467385a.31.2024.11.26.07.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 07:30:51 -0800 (PST)
Message-ID: <76c679d8-0674-4213-9d82-a29d458882ae@redhat.com>
Date: Tue, 26 Nov 2024 16:30:49 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] virtio-net: clarify NEEDS_CSUM semantic for GSO
 packats.
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1731084277.git.pabeni@redhat.com>
 <c03a1ec585fd7755eaeea25b690e1704ad5260db.1731084277.git.pabeni@redhat.com>
 <CACGkMEsxRJVS5vyhJedj2RYuWG6B7ME6JbVEo1H9sgTgJR=ubg@mail.gmail.com>
 <067ebefd-8d1b-437a-97c0-f5f771102a94@redhat.com>
 <CACGkMEvVAoQAfKYnvuN5ZQqG-UgG+nUuhoAHruSmmV_rDSrc5w@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEvVAoQAfKYnvuN5ZQqG-UgG+nUuhoAHruSmmV_rDSrc5w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tLXGE5IT9HsGLHwz3GcvYbod9_a1Kvajg1BAWN5iBvc_1732635053
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/26/24 04:01, Jason Wang wrote:
> On Tue, Nov 26, 2024 at 12:01 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 11/25/24 03:51, Jason Wang wrote:
>>> On Sat, Nov 9, 2024 at 12:53 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>>>
>>>> The current wording is a bit unclear hinting to possible additional
>>>> nested headers. For GSO packets virtio net (currently) supports
>>>> offload for the checksum of single transport header, explicitly state
>>>> that in both the driver and device sections.
>>>>
>>>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>>>> ---
>>>>  device-types/net/description.tex | 11 ++++++++++-
>>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>> index b2a0d39..3099c6f 100644
>>>> --- a/device-types/net/description.tex
>>>> +++ b/device-types/net/description.tex
>>>> @@ -605,6 +605,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>>>  \item the driver MUST validate the packet checksum at
>>>>         offset \field{csum_offset} from \field{csum_start} as well as all
>>>>         preceding offsets;
>>>> +\begin{note}
>>>> +If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum_offset}
>>>> +points to the only transport header present in the packet, and there are no
>>>> +additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
>>>> +\end{note}
>>>
>>> I wonder if this defeats the purpose of LCO where the outer checksum
>>> could be deduced.
>>
>> I don't see how?!? The added statement is not a behavior change, it just
>> clarifies the existing text. I don't see any implications WRT LCO.
>>
>> Could you please describe in details the eventual problem?
> 
> Not a native speaker, just want to check if "no additional preceding
> checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM" is in conflict
> with the case when we apply LCO for the outer. Or do we treat outer
> checksum as "preceding checksums" here.

My take is that with LCO virtio is not offloading anything. The header
subject to LCO, from virtio perspective, is just constant header, not
offloaded via any virtio hdr field. The above spec statement applies/is
valid verbatim even in presence of LCO.

Cheers,

Paolo

